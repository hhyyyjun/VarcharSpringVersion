package com.koala.biz.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koala.biz.dao.CarDAO;
import com.koala.biz.service.CarService;
import com.koala.biz.vo.CarVO;

@Service("carService")
public class CarServiceImpl implements CarService{
	
	@Autowired
	private CarDAO carDAO;

	@Override
	public boolean insert(CarVO vo) {
		return carDAO.insert(vo);
	}

	@Override
	public List<CarVO> selectAll(CarVO vo) {
		return carDAO.selectAll(vo);
	}

	@Override
	public boolean hasSample(CarVO vo) {
		return carDAO.hasSample(vo);
	}

	@Override
	public boolean update(CarVO vo) {
		return carDAO.update(vo);
	}

	@Override
	public boolean delete(CarVO vo) {
		return carDAO.delete(vo);
	}

	@Override
	public CarVO selectOne(CarVO vo) {
		return carDAO.selectOne(vo);
	}

	@Override
	public List<CarVO> selectAll_R(CarVO vo) {
		return carDAO.selectAll_R(vo);
	}

	@Override
	public List<CarVO> selectAllPage(CarVO vo) {
		System.out.println("ASDFASDFASFASFSF");
		return carDAO.selectAllPage(vo);
	}

}
