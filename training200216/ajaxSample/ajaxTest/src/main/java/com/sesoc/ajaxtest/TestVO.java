package com.sesoc.ajaxtest;

public class TestVO {
	private String id;
	private String name;
	
	public TestVO() {}
	public TestVO(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	
	@Override
	public String toString() {
		return "TestVO [id=" + id + ", name=" + name + "]";
	}
}
