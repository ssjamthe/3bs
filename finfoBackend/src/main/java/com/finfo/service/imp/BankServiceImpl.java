package com.finfo.service.imp;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import com.finfo.component.Bank;
import com.finfo.service.BankService;

@Component
public class BankServiceImpl implements BankService{

	@Override
	public List<Bank> getBankList() {
		// TODO Auto-generated method stub
		List<Bank> bankList = new ArrayList<Bank>();
		Bank bank = new Bank();
		bank.setBankName("SBI");
		Bank bank1 = new Bank();
		bank1.setBankName("HSBC");
		bankList.add(bank);
		bankList.add(bank1);
		return bankList;
	}

}
