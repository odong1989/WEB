package com.spring.ex1.vo;

import java.util.Arrays;

public class TestData {
	//예전에는 변수명은 DB의 컬럼을 보고 적어야했죠??(#잊지마!)
	//이제는 DB컬럼명=vo의변수명=jsp파일의 form의 변수명이 같아야 합니다.
	//1)DB컬럼명 확정
	//2)DB컬럼명 =vo의변수명 일치시키기
	//3)vo의변수명=jsp파일의 form의 변수명
	//이런순으로 일을 진행합니다.
	
	
	private String str;
	private String password;
	private String[] hobby;
	public TestData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public TestData(String str, String password, String[] hobby) {
		super();
		this.str = str;
		this.password = password;
		this.hobby = hobby;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String[] getHobby() {
		return hobby;
	}
	public void setHobby(String[] hobby) {
		this.hobby = hobby;
	}
	
	@Override
	public String toString() {
		return "TestData [str=" + str + ", password=" + password + ", hobby=" + Arrays.toString(hobby) + "]";
	}
	
	
}
