package com.koala.biz.service;


import java.util.List;

import com.koala.biz.vo.CarVO;

public interface CarService {
	  public boolean insert(CarVO vo); // Crawling data
	  public List<CarVO> selectAll(CarVO vo); // Crawling data
	  public boolean hasSample(CarVO vo);// 샘플데이터 확인 
	  public boolean update(CarVO vo); //자동차 정보 수정 
	  public boolean delete(CarVO vo); //자동차 삭제 
	  public CarVO selectOne(CarVO vo); //디테일 페이지에서 사용
	  public List<CarVO> selectAll_R(CarVO vo);//자동차 정보 최근순으로 정렬
	  public List<CarVO> selectAllPage(CarVO vo);//filterSearchAction에서 페이징 할떄 사용
}
