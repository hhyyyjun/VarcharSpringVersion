package com.koala.biz.service;

import com.koala.biz.vo.MemberVO;

public interface SendEmailService {
	public String sendIdMail(MemberVO mvo); //아이디 발송
	public String sendPwMail(MemberVO mvo); //비밀번호 발송 
}
