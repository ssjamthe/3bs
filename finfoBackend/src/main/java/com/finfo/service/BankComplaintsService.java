package com.finfo.service;

import java.util.List;

import com.finfo.component.BankComplaints;

public interface BankComplaintsService {
	public List<BankComplaints> getBankComplaintList(Integer numberOfMonths);

}
