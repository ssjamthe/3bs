package com.finfo.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/bank")
public class BankController {
	@RequestMapping("/product/{bank}")
	public String getBankProducts(@PathVariable String bank){
		String products = "Products of bank "+bank ;
		return products;
	}

}
