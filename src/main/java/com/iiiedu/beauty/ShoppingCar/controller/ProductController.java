package com.iiiedu.beauty.ShoppingCar.controller;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.iiiedu.beauty.ShoppingCar.service2.ProductService;
import com.iiiedu.beauty.ShoppingCar.service2.ShoppingCarService;
import com.iiiedu.beauty.ShoppingCar.service2.ShoppingRecordService;
import com.iiiedu.beauty.model.Product;
import com.iiiedu.beauty.model.ShoppingCar;
import com.iiiedu.beauty.model.ShoppingRecord;

/**
 * Created by 14437 on 2017/3/1.
 */
@Controller
@RequestMapping("/shoppingMall")
public class ProductController {
	@Autowired
    private ProductService productService;
    
    @Autowired
    private ShoppingCarService shoppingCarService;
    
    @Autowired
    private ShoppingRecordService shoppingRecordService;
    
    @Autowired
	ServletContext context;

    @RequestMapping(value = "/getAllProducts" ,method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> getAllProducts(){
        List<Product> productList = new ArrayList<>();
        productList = productService.getAllProduct();
        String allProducts = JSONArray.toJSONString(productList);
//        System.out.println(allProducts);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("allProducts",allProducts);
        return resultMap;
    }

    //推荐寫法
    @RequestMapping(value = "/deleteProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> deleteProduct(int id) {
        productService.deleteProduct(id);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
		return resultMap;
    }

    
    @PostMapping("/addProduct")
    @ResponseBody
	public Map<String, Object> add(Product product) {
    	System.out.println("add");
		MultipartFile picture = product.getProductImage();
		String originalFilename = picture.getOriginalFilename();
		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
			product.setFileName(originalFilename);
		}
		// 建立Blob物件，交由 Hibernate 寫入資料庫
		if (picture != null && !picture.isEmpty()) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				product.setImage(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}

		try {
			productService.addProduct(product);
		} catch (Exception ex) {
			System.out.println(ex.getClass().getName() + ", ex.getMessage()=" + ex.getMessage());
		}
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result","success");
		return resultMap;
	}
    
    
//    @RequestMapping(value = "/addProduct", method = RequestMethod.POST)
//    @ResponseBody
//    public Map<String, Object> addProduct(Product product) {
//        System.out.println("添加了商品：");
//        
//        
//        MultipartFile picture = product.getProductImage();
//		String originalFilename = picture.getOriginalFilename();
////		String extFilename = ""; 
//		if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
//			product.setFileName(originalFilename);
////			extFilename = originalFilename.substring(originalFilename.lastIndexOf("."));
////			System.out.println("**================**extFilename = "+extFilename);
//		}
//		// 建立Blob物件，交由 Hibernate 寫入資料庫
//		if (picture != null && !picture.isEmpty()) {
//			try {
//				byte[] b = picture.getBytes();
//				Blob blob = new SerialBlob(b);
//				product.setImage(blob);
//			} catch (Exception e) {
//				e.printStackTrace();
//				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
//			}
//		}
//
//		productService.addProduct(product);
//        
//        String result ="fail";
////        Product product = new Product();
////        product.setName(name);
////        product.setDescription(description);
////        product.setKeyWord(keyWord);
////        product.setPrice(price);
////        product.setCounts(counts);
////        product.setType(type);
////        productService.addProduct(product);
//        result = "success";
//        Map<String,Object> resultMap = new HashMap<String,Object>();
//        resultMap.put("result",result);
//        return resultMap;
//    }

    @RequestMapping(value = "/productDetail", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> productDetail(int id, HttpSession httpSession) {
        System.out.println("I am here!"+id);
        Product product = productService.getProduct(id);
        httpSession.setAttribute("productDetail",product);
        System.out.print("I am here"+product.getName());
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        return resultMap;
    }

    @RequestMapping(value = "/product_detail")
    public String product_detail() {
//        return "shoppingMall/product_detail";
        return "shoppingMall/product_detail";
    }

    @RequestMapping(value = "/searchPre", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> searchPre(String searchKeyWord,HttpSession httpSession) {
        httpSession.setAttribute("searchKeyWord",searchKeyWord);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result","success");
        return resultMap;
    }

    @RequestMapping(value = "/search")
    public String search() {
        return "shoppingMall/search";
    }

    @RequestMapping(value = "/searchProduct", method = RequestMethod.POST)
    @ResponseBody
    public Map<String,Object> searchProduct(String searchKeyWord){
        System.out.println("我到了SearchProduct"+searchKeyWord);
        List<Product> productList = new ArrayList<Product>();
        productList = productService.getProductsByKeyWord(searchKeyWord);
        String searchResult = JSONArray.toJSONString(productList);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",searchResult);
        System.out.println("我返回了"+searchResult);
        return resultMap;
    }
    
    @PostMapping("/product/{id}")
    @ResponseBody
	public Map<String,Object> modify(Product product,@PathVariable Integer id)
	{
		Product origProduct = productService.getProduct(id);
		Blob originalImg = origProduct.getImage();
		System.out.println("============>@PostMapping(\"/products/{id}\") #modify()  product =" + originalImg);
		
		MultipartFile picture = product.getProductImage();
		if (picture.getSize() == 0) {
			// 表示使用者並未挑選圖片
			product.setImage(originalImg);
		} else {
			String originalFilename = picture.getOriginalFilename();
			if (originalFilename.length() > 0 && originalFilename.lastIndexOf(".") > -1) {
				product.setFileName(originalFilename);
			}else {
				product.setFileName(origProduct.getFileName());
			}
			
			// 建立Blob物件
			if (picture != null && !picture.isEmpty()) {
				try {
					byte[] b = picture.getBytes();
					Blob blob = new SerialBlob(b);
					product.setImage(blob);
				} catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
				}
			}
		}
		productService.updateProduct(product);
		Map<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("result","success");
		System.out.println("=>OK");
		return resultMap;
	}

    @RequestMapping(value = "/getProductById", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductById(int id) {
//    	System.out.println("123123132123-------------------------------"+id);
        Product product = productService.getProduct(id);
//        System.out.println("----------------------------------------------------------"+product);
        String result = JSON.toJSONString(product);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }

    @RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(@RequestParam MultipartFile productImgUpload,String name, HttpServletRequest request) {
        String result = "fail";
        try{
            if(productImgUpload != null && !productImgUpload.isEmpty()) {
                String fileRealPath = request.getSession().getServletContext().getRealPath("/static/img");
                System.out.println(fileRealPath);
                int id = productService.getProduct(name).getId();
                String fileName = String.valueOf(id)+".jpg";
                File fileFolder = new File(fileRealPath);
                System.out.println("fileRealPath=" + fileRealPath+"/"+fileName);
                if(!fileFolder.exists()){
                    fileFolder.mkdirs();
                }
                File file = new File(fileFolder,fileName);
                productImgUpload.transferTo(file);
                result = "success";
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    
    @RequestMapping(value = "/getProductByCarId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductByCarId(int carId) {
//    	System.out.println("77777777777777777777-------------------------------"+carId);
    	ShoppingCar shoppingCar = shoppingCarService.getShoppingCarById(carId);
        Product product = shoppingCar.getProduct();
//        System.out.println("----------------------------------------------------------"+product);
        String result = JSON.toJSONString(product);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    
    @RequestMapping(value = "/getProductByRecordId", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> getProductByRecordId(int recordId) {
//    	System.out.println("-++++++++-+-+++-+-+---------------------------------"+recordId);
    	ShoppingRecord shoppingRecord = shoppingRecordService.getShoppingRecordById(recordId);
        Product product = shoppingRecord.getProduct();
//        System.out.println("----------------------------------------------------------"+product);
        String result = JSON.toJSONString(product);
        Map<String,Object> resultMap = new HashMap<String,Object>();
        resultMap.put("result",result);
        return resultMap;
    }
    
    @GetMapping("/picture/{id}")
	public ResponseEntity<byte[]> getPicture(@PathVariable("id") Integer id) {
		byte[] body = null;
		ResponseEntity<byte[]> re = null;
		MediaType mediaType = null;
		HttpHeaders headers = new HttpHeaders();
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());

		Product product = productService.getProduct(id);
		if (product == null) {
			return new ResponseEntity<byte[]>(HttpStatus.NOT_FOUND);
		}
		String filename = product.getFileName();
		if (filename != null) {
			if (filename.toLowerCase().endsWith("jfif")) {
				mediaType = MediaType.valueOf(context.getMimeType("dummy.jpeg"));
			} else {
				mediaType = MediaType.valueOf(context.getMimeType(filename));
				headers.setContentType(mediaType);
			}
		}
		Blob blob = product.getImage();
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
