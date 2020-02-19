package com.springlegacy.ex3.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.springlegacy.ex3.vo.Customer;

public interface CustomerMapper {
	
	public int insertCustomer(Customer customer);
	public ArrayList<Customer> selectCustomerAll();
	public int deleteCustomer(String custid);
	public Customer selectCustomerOne(String custid);
	public int updateCustomer(Customer customer);
	public int deleteCustomer2(HashMap<String, Object> params);
	
}
