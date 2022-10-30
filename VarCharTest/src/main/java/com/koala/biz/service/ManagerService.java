package com.koala.biz.service;

import java.util.List;

import com.koala.biz.vo.CarVO;
import com.koala.biz.vo.MemberVO;


public interface ManagerService {
	public void insertCar(CarVO vo);
	public void updateCar(CarVO vo);
	public void deleteCar(CarVO vo);
	public CarVO selectOne(CarVO vo);
	public List<MemberVO> selectAllM(MemberVO vo);
	public List<CarVO> selectAllC(CarVO vo);
}
