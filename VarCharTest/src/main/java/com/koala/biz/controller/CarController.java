package com.koala.biz.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.koala.biz.common.PreserveURL;
import com.koala.biz.service.CarService;
import com.koala.biz.vo.CarVO;

@Controller
@SessionAttributes("sdatas")
public class CarController {

	@Autowired
	private CarService carService;

	//차게시판 상세 페이지 
	@RequestMapping("/detail.do")
	public String detail(CarVO cVO, Model model) {
		System.out.println(cVO);
		System.out.println("detail.do로그 : " + cVO.getCnum());
		cVO = carService.selectOne(cVO);
		System.out.println("detail.do로그 : " + cVO);
		model.addAttribute("data", cVO);
		return "detail.jsp";
	}

	//찜목록 추가 
	@RequestMapping("/storeAdd.do")
	public String storeAdd(CarVO cVO, Model model, HttpSession session, HttpServletRequest request) {
		System.out.println("storeAdd.do 로그 : " + cVO);
		cVO = carService.selectOne(cVO);
		ArrayList<CarVO> sdatas = (ArrayList<CarVO>)session.getAttribute("sdatas");
		if(sdatas ==null){
			sdatas= new ArrayList<CarVO>();
		}
		sdatas.add(cVO);
		model.addAttribute("sdatas", sdatas);
		return PreserveURL.preserveURL(request);

	}
	//찜목록 삭제 
	@RequestMapping("/storeR.do")
	public String storeRemove(CarVO cVO, Model model, HttpSession session, HttpServletRequest request) {
		//cVO = carService.selectOne(cVO);
		System.out.println("삭제 : " + cVO);
		ArrayList<CarVO> sdatas = (ArrayList<CarVO>)session.getAttribute("sdatas");
		
		if(sdatas ==null || sdatas.size() == 0) {	
			return PreserveURL.preserveURL(request);
		}
		System.out.println("삭제 통과중 : " + cVO);
		for(CarVO car : sdatas) {
			if(car.getCnum() == cVO.getCnum()) {
				sdatas.remove(car);
				break;
			}
		}
		
		model.addAttribute("sdatas", sdatas);
		return PreserveURL.preserveURL(request);
	}
}

