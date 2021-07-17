<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
</head>
<body>

	<h3>Cart Page</h3>
	<form method="post" 
		  action="${payPalConfig.posturl }">
	
		  <!--  PayPal Setting -->
		  <input type="hidden" name="upload" value="1" />
		  <input type="hidden" name="return" value="${payPalConfig.returnurl }" />
		  <input type="hidden" name="cmd" value="_cart" />
		  <input type="hidden" name="business" value="${payPalConfig.business }" />
		  
		  <!--  Products List -->
		  <c:forEach var="product" items="${products }" varStatus="i">
		  		<input type="hidden" name="item_number_${i.index + 1 }" value="${product.id }" >
		  		<input type="hidden" name="item_name_${i.index + 1 }" value="${product.name }" >
		  		<input type="hidden" name="amount_${i.index + 1 }" value="${product.price }" >
		  		<input type="hidden" name="quantity_${i.index + 1 }" value="${product.quantity }" >
		  </c:forEach>	
		 
		  <input type="image"
		  	     src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif">
			
	</form>

</body>
</html>