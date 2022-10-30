package com.koala.biz.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.koala.biz.common.PreserveURL;
import com.koala.biz.service.MemberService;
import com.koala.biz.service.SendEmailService;
import com.koala.biz.service.SendMsgService;
import com.koala.biz.vo.BoardVO;
import com.koala.biz.vo.MemberVO;
import com.koala.biz.vo.sendVO;

@Controller
@SessionAttributes({"userId","loginType","mrole"})
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private SendMsgService sendmsgService;
	@Autowired
	private SendEmailService sendemailService;

	//////// Member /////////
	//----로그인 
	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public String index() {
		return "login.jsp";
	}
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String selectOneMember(MemberVO mVO, HttpSession session, Model model) {
		mVO=memberService.selectOne(mVO);
		System.out.println("로그인 로그11  : " + mVO);

		if(mVO==null) {
			return "redirect:login.jsp";
		}
		else {
			model.addAttribute("userId", mVO.getMid());//model에 "member"가 add!! -> session에 저장
			model.addAttribute("mrole", mVO.getMrole());
			
			return "redirect:main.do";
		}
	}

	//----카카오 로그인 API
	// sns 간편 로그인(현재 카카오톡)
	@RequestMapping(value="/kakaoLogin.do", method= RequestMethod.POST) 
	public String snsLogin( @RequestParam(value="kakaoUserName",defaultValue="",required=true)String kakaoUserName, 
			@RequestParam(value="loginType",defaultValue="",required=true)String loginType, MemberVO mVO, Model model) {
	
		mVO.setMid(kakaoUserName);
	
		model.addAttribute("userId", mVO.getMid());
		model.addAttribute("loginType", loginType);
		return "redirect:main.do";
	}

	//----로그아웃
	@RequestMapping("/logout.do")
	public String logout(SessionStatus sessionStatus)  {
		sessionStatus.setComplete();//저장된 model 객체를 없애줌
		return "redirect:login.do"; //VR 디폴트 값이 forward
	}

	//----마이페이지 화면 출력 
	@RequestMapping("/mypage.do")
	public String mypageselectOne(MemberVO mVO,Model model, HttpSession session) {
		mVO.setMid((String)session.getAttribute("userId"));
		mVO = memberService.selectOne_M(mVO);
		System.out.println("회원정보 : " + mVO);
		model.addAttribute("userInfo", mVO); 
		return "mypage.jsp";
	}

	//----마이페이지 수정 
	@RequestMapping("/updateM.do")
	public  String mypageupdate(MemberVO mVO, HttpSession session) {
		mVO.setMid((String)session.getAttribute("userId"));
		//원래 존재하던 userId를 set해주고, 변경되는 정보는 그 뒤에 set! 
		System.out.println("update로그 :" + mVO);
		memberService.update(mVO);
		//만약 변경사항이 있다면 새로운 정보로 덮어씌워줌! 
		return "main.do";
	}

	//----회원가입 
	@RequestMapping(value="/signup.do",method=RequestMethod.GET)
	public String Signup() {
		return "signup.jsp";
	}
	@RequestMapping(value="/insertM.do",method=RequestMethod.POST)
	public String signin(MemberVO mVO,@RequestParam(value="maddDetail",defaultValue="",required=false)String addDetail) {
		mVO.setMadd(mVO.getMadd() +" "+addDetail);
		mVO.setMrole("일반회원");
		memberService.insert(mVO);
		return "redirect:login.do";
	}

	//----회원탈퇴 
	@RequestMapping("/deleteM.do")
	public String memberDelete(MemberVO mVO, BoardVO bVO,
			SessionStatus sessionStatus,
			@RequestParam(value="deleteAll",defaultValue="",required=false)String deleteAll, 
			@RequestParam(value="deleteOnlyMsg",defaultValue="",required=false)String deleteOnlyMsg) throws Exception {


		if(deleteAll!=null && deleteAll.equals("deleteAll")) {
			System.out.println(deleteAll);
			bVO.setRes(true);
		}
		else if( deleteOnlyMsg!=null && deleteOnlyMsg.equals("deleteOnlyMsg")) {
			System.out.println(deleteOnlyMsg);
			bVO.setRes(false);
		}
		memberService.delete(mVO, bVO);
		System.out.println("memberController 처리 완료");
		sessionStatus.setComplete();

		return "login.jsp";
	}

	//----회원가입 시 인증번호 발송 
	@ResponseBody
	@RequestMapping(value="/sendMSG.do",produces = {"application/json;charset=UTF-8"})
	public int sendMsg(sendVO sVO, @RequestParam(value="phone",defaultValue="",required=false)String phone) {
		sVO.setPhone(phone);

		return sendmsgService.sendmsg(sVO);
	}

	//----회원가입 시 발송된 인증번호 검사 
	@ResponseBody
	@RequestMapping(value="/sendCheck.do",produces = {"application/json;charset=UTF-8"})
	public int sendCheck(sendVO sVO, @RequestParam(value="randomNumber",defaultValue="",required=false)String randomNumber,
			@RequestParam(value="checkNum",defaultValue="",required=false)String checkNum) {
		//randomNumber : 랜덤으로 생성된 인증번호
		//checkNum : 사용자가 입력한 인증번호 

		sVO.setRandomNumber(randomNumber);
		sVO.setCheckNum(checkNum);

		return sendmsgService.sendCheck(sVO);
	}

	//----아이디 중복 검사 
	@ResponseBody
	@RequestMapping(value="/IDCheck.do",produces = {"application/json;charset=UTF-8"})
	public int checkId(MemberVO mVO,@RequestParam(value="mid",defaultValue="",required=false)String mid) {
		System.out.println("아이디 중복검사 : " + mVO);
		mVO.setMid(mid);

		return memberService.checkId(mVO);
	}
	// 아이디 / 비번 찾기 이동
	@RequestMapping(value="/findAccount.do",method=RequestMethod.GET)
	public String findAccount() {
		return "findAccount.jsp";
	}

	//----아이디 찾기 - 이메일 사용자 아이디 발송 
	@ResponseBody
	@RequestMapping(value="/sendIdEmail.do",method=RequestMethod.POST, produces = {"text/html"})//produces사용하여 response type 설정할 수 있음
	public String sendIdMail(MemberVO mVO, @RequestParam(value="email",defaultValue="",required=false)String email, 
			@RequestParam(value="name",defaultValue="",required=false)String name) {
		mVO.setMemail(email);
		mVO.setMname(name);
		return sendemailService.sendIdMail(mVO);	
	}

	//----비밀번호 찾기 
	@ResponseBody
	@RequestMapping(value="/sendPwEmail.do",method=RequestMethod.POST)
	public String sendPwMail(MemberVO mVO, @RequestParam(value="email",defaultValue="",required=false)String email, 
			@RequestParam(value="mid",defaultValue="",required=false)String mid) {
		mVO.setMemail(email);
		mVO.setMid(mid);

		return sendemailService.sendPwMail(mVO);
	}
	//---- 언어 변경시 기존 페이지 유지 
	@RequestMapping(value="/language.do",method=RequestMethod.GET)
	public String ChangeLanguage(HttpServletRequest request, @RequestParam("lang") String lang) {
		System.out.println("언어 변경 : " + lang);
		System.out.println(PreserveURL.preserveURL(request));
		return PreserveURL.preserveURL(request);
	}
}
