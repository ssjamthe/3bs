package com.finfo.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.finfo.component.BankComplaints;
import com.finfo.service.BankComplaintsService;

@Component
public class BankComplaintsServiceImpl  implements BankComplaintsService{

	@Override
	public List<BankComplaints> getBankComplaintList(Integer numberOfMonths) {
		// TODO Auto-generated method stub
		List<BankComplaints> bankComplaintsList = new ArrayList<BankComplaints>();
		BankComplaints bankComplaints = new BankComplaints();
		bankComplaints.setBankName("SBI");
		bankComplaints.setComplaintNumber(3);
		
		BankComplaints bankComplaints1 = new BankComplaints();
		bankComplaints.setBankName("HSBC");
		bankComplaints.setComplaintNumber(4);
		
		bankComplaintsList.add(bankComplaints);
		bankComplaintsList.add(bankComplaints1);
		
		return bankComplaintsList;
	}

}
