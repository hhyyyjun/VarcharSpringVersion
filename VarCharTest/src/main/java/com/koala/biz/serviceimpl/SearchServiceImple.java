package com.koala.biz.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koala.biz.dao.SearchDAO;
import com.koala.biz.dao.SearchDAO2;
import com.koala.biz.service.SearchService;
import com.koala.biz.vo.CarVO;
import com.koala.biz.vo.SearchVO;

@Service("searchService")
public class SearchServiceImple implements SearchService{

	@Autowired
	private SearchDAO2 searchDAO;
	
	@Override
	public List<CarVO> selectAll(SearchVO svo) {
		return searchDAO.selectAll(svo);
	}
}
