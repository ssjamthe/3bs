package com.finfo.controller;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.finfo.component.Bank;
import com.finfo.service.BankService;

@RestController
@RequestMapping("/bank")

public class BankController {
	@Autowired
	BankService bankService;
	
	@RequestMapping("/list")
	public List<Bank> getBanksComplaintsList (){
		List<Bank> bankList = new ArrayList<Bank>();
		bankList = bankService.getBankList();
		return bankList;
	}


}
