package com.koala.biz.service;

import com.koala.biz.vo.sendVO;

public interface SendMsgService {
	
	public int sendmsg(sendVO vo);//회원가입시 입력 핸드폰번호 인증문자 발송
	public int sendCheck(sendVO vo);//사용자가 입력한 인증번호와 랜덤인증번호 확인
	
}
