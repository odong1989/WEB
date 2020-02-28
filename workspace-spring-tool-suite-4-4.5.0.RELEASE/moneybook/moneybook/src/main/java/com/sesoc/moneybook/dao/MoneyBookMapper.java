package com.sesoc.moneybook.dao;

import java.util.ArrayList;

import com.sesoc.moneybook.vo.MoneybookVO;

public interface MoneyBookMapper {

	public void write(MoneybookVO vo); 
	public ArrayList<MoneybookVO> list(MoneybookVO vo);
	public void remove(MoneybookVO vo); 
}
