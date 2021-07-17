package com.iiiedu.beauty.Paypal.service.Impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Service;

import com.iiiedu.beauty.Paypal.paypal.PayPalConfig;
import com.iiiedu.beauty.Paypal.service.PayPalService;


@Service("payPalService")
public class PayPalServiceImpl implements PayPalService {

	@Autowired
	private Environment environment;
	
	@Override
	public PayPalConfig getPayPalConfig() {
		// TODO Auto-generated method stub
		PayPalConfig payPalConfig = new PayPalConfig();
		payPalConfig.setAuthToken(environment.getProperty("paypal.authtoken"));
		payPalConfig.setBusiness(environment.getProperty("paypal.business"));
		payPalConfig.setPosturl(environment.getProperty("paypal.posturl"));
		payPalConfig.setReturnurl(environment.getProperty("paypal.returnurl"));
		return payPalConfig;
	}

	
	
}
