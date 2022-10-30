package com.koala.biz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koala.biz.common.PreserveURL;
import com.koala.biz.service.BoardService;
import com.koala.biz.service.CarService;
import com.koala.biz.service.MemberService;
import com.koala.biz.vo.BoardSet;
import com.koala.biz.vo.BoardVO;
import com.koala.biz.vo.CarVO;
import com.koala.biz.vo.MemberVO;
import com.koala.biz.vo.ReplyVO;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CarService carService;
	
	
	//////// Board /////////
	//----메인 
	@RequestMapping("/main.do")
	public String main(BoardVO bVO, CarVO cVO, MemberVO mVO, Model model) {
		
		System.out.println("main.do 입장!");

		//최근 등록 차량들을 저장할 배열객체 생성
		List<CarVO> recentCarList = carService.selectAllPage(cVO);
		System.out.println("resenC" + recentCarList);
		model.addAttribute("recentC", recentCarList);

		//회원 전체 데이터 배열로 저장
		List<MemberVO> countMember = memberService.selectAll(mVO);
		//자동차 전체 데이터 배열로 저장
		List<CarVO> countCar = carService.selectAll(cVO);
		//추천 랜덤차량 데이터 담는 배열객체
		List<CarVO> randCar = new ArrayList<CarVO>();
		
		//차량 랜덤 추천
		Random random = new Random();
		   for(int i=0;i<7;i++) { //6개까지만 추천할 예정이므로 하드코딩이 필요함
			   CarVO car = new CarVO();
		         int rand = random.nextInt(countCar.size()+1); //전체 데이타 중 랜덤 값 추출
		         car.setCnum(rand);
		         car=carService.selectOne(car);
		         randCar.add(car);
		   }
		   System.out.println("randCar" + randCar);
		   model.addAttribute("cdata", randCar);
		   
		//게시판 제목 
		//최근 등록된 문의글 제목담을 배열객체 생성
		List<BoardVO> recentBoardList = boardService.selectAll_R(bVO);
		 System.out.println("recentBoardList" + recentBoardList);
		model.addAttribute("recentB", recentBoardList);
		System.out.println(recentBoardList);
		
		//회원 데이터 배열의 길이
		System.out.println("countMember.size()" + countMember.size());
		model.addAttribute("countM", countMember.size());
		//자동차 데이터 배열의 길이
		System.out.println("countCar.size()" + countCar.size());
		model.addAttribute("countC", countCar.size());
		
		System.out.println("회원수 :" + countMember.size());
	    System.out.println("자동차 등록 대수 :" + countCar.size());
		
		
		return "main.jsp";
		}
	
	//----문의 글 목록, 검색 - 게시판 메인 
	@RequestMapping(value={"/boardMain.do", "/searchR.do"},method=RequestMethod.GET)
	public String boardMain(BoardVO bVO,
			Model model, HttpSession session, MemberVO mVO ) {
		
	System.out.println("cnt들어왔니 : " + bVO);
	if(bVO.getBtitle()!=null) {
	model.addAttribute("btitle", bVO.getBtitle());
	}
	//게시판 출력하는 부분 
	List<BoardSet> bList = boardService.selectMore(bVO); //게시판 정보 담을 배열 객체 생성
	model.addAttribute("bList", bList);//배열객체 데이터를 담아 속성명 저장
	System.out.println("보드메인액션 중 : "+bList);
	

	
	model.addAttribute("totalDatas", boardService.selectAll(bVO).size());

		return "board.jsp";
	}
	
	 @ResponseBody
	   @RequestMapping("/moreBoard.do")
	   public HashMap<String, Object> moreBoard(BoardVO bVO) {
	      System.out.println("bVO : " + bVO);
	      HashMap<String, Object> result = new HashMap<String, Object>();

	      List<BoardSet> boardList = boardService.selectMore(bVO);
	      System.out.println("응답 : boardList : " + boardList);
	      BoardVO nextBvo = bVO;
	      final int moreContent = 5;
	      nextBvo.setBcnt(bVO.getBcnt() + moreContent);
	      List<BoardSet> nextDatas = boardService.selectMore(nextBvo);
	      boolean showMore = nextDatas.size() > 0;
	      
	      result.put("boardList", boardList);
	      result.put("showMore", showMore);
	      return result;
	   }
	
	//----문의 글 작성 
	@RequestMapping("/insertB.do")
	public String insertBoard(BoardVO bVO) {
		boardService.insert(bVO);
		return "redirect:boardMain.do";
	}
	
	//----문의 글 삭제 
	@RequestMapping("/deleteB.do")
	public String deleteBoard(BoardVO bVO, HttpServletRequest request) {
		boardService.delete(bVO);
		return PreserveURL.preserveURL(request);
	}
	
	//----문의 글 수정 - (이전에는 구현안됨) 
	@RequestMapping("/updateB.do")
	public String updateBoard(BoardVO bVO) {
		boardService.update(bVO);
		return "redirect:boardMain.do";
	}
	
	//----댓글 작성 
	@RequestMapping("/insertR.do")
	public String insertReply(ReplyVO rVO, HttpServletRequest request) {
		boardService.insertR(rVO);
		return PreserveURL.preserveURL(request);
	}
	
	//----댓글 삭제 
	@RequestMapping("/deleteR.do")
	public String deleteReply(ReplyVO rVO, HttpServletRequest request) {
		boardService.deleteR(rVO);
		return PreserveURL.preserveURL(request);
	}
	
	//문의게시판 제목 검색 
	@RequestMapping("/searchT.do")
	public String searchTitle(BoardVO bVO, Model model) {
		
		List<BoardSet> data = boardService.selectAll(bVO);
		model.addAttribute("bList", data);
		return "board.jsp";
	}
}
