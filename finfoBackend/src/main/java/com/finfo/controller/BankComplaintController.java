package com.finfo.controller;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.finfo.component.BankComplaints;
import com.finfo.service.BankComplaintsService;

@RestController
@RequestMapping("/complaint")

public class BankComplaintController {
	@Autowired
	BankComplaintsService bankComplaintService ;
	
	@RequestMapping("/number")
	public BankComplaints getBankComplaints (@RequestParam(value = "number",required = true)
	Integer number , @RequestParam(value = "name", required = true) String name ) {
		
		BankComplaints bankComplaints = new BankComplaints();
		bankComplaints.setBankName(name);
		bankComplaints.setComplaintNumber(number);
		return bankComplaints;
	}
	
	@RequestMapping("/banksComplaints")
	public List<BankComplaints> getBanksComplaintsList (@RequestParam(value = "noOfMonths",required = false,
	        defaultValue = "03") Integer noOfMonths ){
		List<BankComplaints> bankComplaintsList = new ArrayList<BankComplaints>();
		bankComplaintsList = bankComplaintService.getBankComplaintList(noOfMonths);
		return bankComplaintsList;
	}

}
