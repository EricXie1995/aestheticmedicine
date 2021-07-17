package com.iiiedu.beauty.shopping.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.iiiedu.beauty.model.Products;
import com.iiiedu.beauty.shopping.service.ProductsService;

@Controller
@RequestMapping("/shopping")
public class ProductsController {

	@Autowired
	private ProductsService productsService;
	
	@Autowired
	ServletContext context;

	@GetMapping("/shopping")
	public String shopping(Model model) {
		model.addAttribute("allProducts", productsService.getAllProducts());
		return "shopping/Shopping";
	}
	
	@GetMapping("/showAllProducts")
	public String showAllProducts(Model model) {
		Products products = new Products();
		model.addAttribute("allProducts", productsService.getAllProducts());
		model.addAttribute("products", products);
		return "shopping/AllProductDetail";
	}
	
	@GetMapping("/add")
	public String showEmptyForm(Model model) {
		Products products = new Products();
		model.addAttribute("products", products);
		return "shopping/Add";
	}
	
	@PostMapping("/add")
	public String add(
			@ModelAttribute("products") /* @Valid */ Products products, 
			BindingResult result, Model model) {
		MultipartFile picture = products.getProductImage();
		String originalFilename = picture.getOriginalFilename();
//		String extFilename = ""; 
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			products.setFileName(originalFilename);
//			extFilename = originalFilename.substring(originalFilename.lastIndexOf("."));
//			System.out.println("**================**extFilename = "+extFilename);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				products.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		Timestamp adminTime = new Timestamp(System.currentTimeMillis());
		products.setProductUpdateDate(adminTime);
		
		try {
			productsService.save(products);
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
		}
		return "redirect:/shopping/showAllProducts";
	}
	
	@GetMapping("/products/{id}")
	public String showEmptyUpdateForm(@PathVariable("id") Integer id, Model model) {
		Products products = productsService.get(id);
		model.addAttribute("products", products);
		return "shopping/AllProductDetail";
	}
	
//	@GetMapping("/products.json")
//	public @ResponseBody Products showUpdateEmptyForm(@RequestParam("id") Integer id) {
//		System.out.println("============id=============="+id);
//		Products products = productsService.get(id);
////		model.addAttribute(products);
//		return products;
//	}
	
	@PostMapping("/products/{id}")
	public String modify(Products products,@PathVariable Integer id)
	{
		Products origProducts = productsService.get(id);
		Blob originalImg = origProducts.getImage();
		System.out.println("============>@PostMapping(\"/products/{id}\") #modify()  products =" + products);
		
		MultipartFile picture = products.getProductImage();
		if (picture.getSize() == 0) {
			// 表示使用者並未挑選圖片
			products.setImage(originalImg);
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				products.setFileName(originalFilename);
			}
			
			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					products.setImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		productsService.update(products);
		return "redirect:/shopping/showAllProducts";
	}
	
	@DeleteMapping("/products/{id}")
	public String delete(@PathVariable("id") Integer id) {
		productsService.delete(id);
		return "redirect:/shopping/showAllProducts";
	}
	
	@GetMapping("/picture/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		Products products = productsService.get(id);
		if (products == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = products.getFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = products.getImage();
		if (blob != null) {
			body = blobToByteArray(blob);
		} else {
			String path = "/images/NoImage.png";
			body = fileToByteArray(path);
		}
		re = new ResponseEntity<byte[]>(body, headers, HttpStatus.OK);

		return re;
	}
	
	private byte[] fileToByteArray(String path) {
		byte[] result = null;
		try (InputStream is = context.getResourceAsStream(path);
				ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public byte[] blobToByteArray(Blob blob) {
		byte[] result = null;
		try (InputStream is = blob.getBinaryStream(); ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			byte[] b = new byte[819200];
			int len = 0;
			while ((len = is.read(b)) != -1) {
				baos.write(b, 0, len);
			}
			result = baos.toByteArray();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}
