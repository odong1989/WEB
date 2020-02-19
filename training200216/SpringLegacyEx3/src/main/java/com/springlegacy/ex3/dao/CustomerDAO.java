package com.springlegacy.ex3.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.springlegacy.ex3.vo.Customer;

@Repository
public class CustomerDAO {

	//SqlSessionFactory로 부터 Sqlsession객체를 가져오는 코드
	@Autowired
	private SqlSession session;
	
	public int insertCustomer(Customer customer) {
		int cnt = 0;
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			cnt = mapper.insertCustomer(customer);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public ArrayList<Customer> selectCustomerAll(){
		ArrayList<Customer> list = null;
		
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			list = mapper.selectCustomerAll();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int deleteCustomer(String custid) {
		int cnt = 0;
		
		try{
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			cnt = mapper.deleteCustomer(custid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public int deleteCustomer2(HashMap<String, Object> params) {
		int cnt = 0;
		
		try{
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			cnt = mapper.deleteCustomer2(params);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public Customer selectCustomerOne(String custid) {
		Customer customer = null;
		try{
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			customer = mapper.selectCustomerOne(custid);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return customer;
	}
	
	public int updateCustomer(Customer customer) {
		int cnt = 0;
		try {
			CustomerMapper mapper = session.getMapper(CustomerMapper.class);
			cnt = mapper.updateCustomer(customer);
		}catch (Exception e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	
	
	
	
}
