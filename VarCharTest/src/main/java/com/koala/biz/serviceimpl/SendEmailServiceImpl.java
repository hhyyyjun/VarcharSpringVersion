package com.koala.biz.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koala.biz.dao.EmailDAO;
import com.koala.biz.service.SendEmailService;
import com.koala.biz.vo.MemberVO;

@Service("sendEmailService")
public class SendEmailServiceImpl implements SendEmailService {

	@Autowired
	private EmailDAO emailDAO;
	
	@Override
	public String sendIdMail(MemberVO mvo) {
		return emailDAO.sendIdMail(mvo);
	}

	@Override
	public String sendPwMail(MemberVO mvo) {
		return emailDAO.sendPwMail(mvo);
	}
}
