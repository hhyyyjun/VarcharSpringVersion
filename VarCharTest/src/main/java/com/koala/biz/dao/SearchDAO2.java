package com.koala.biz.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.koala.biz.vo.CarVO;
import com.koala.biz.vo.SearchVO;

//Mybatis 버전
@Repository("searchDAO")
public class SearchDAO2 {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<CarVO> selectAll(SearchVO svo){
		return mybatis.selectList("SearchDAO.searchCar", svo);
	}
}
