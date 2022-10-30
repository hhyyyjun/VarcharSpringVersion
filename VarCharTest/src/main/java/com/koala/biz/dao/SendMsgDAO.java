package com.koala.biz.dao;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import com.koala.biz.vo.sendVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Repository("sendmsgDAO")
public class SendMsgDAO{

	//휴대폰번호 인증문자 보내기
	public int sendmsg(sendVO vo) {
		String api_key = "인증키";
		String api_secret = "인증키 비밀번호";
		Message coolsms = new Message(api_key, api_secret);		

		int randomNumber = (int)((Math.random()* (9999 - 1000 + 1)) + 1000); //랜덤 인증번호

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", vo.getPhone() );    // 수신전화번호 
		params.put("from", "인증키 발급자 번호");   // 발신번호 - 인증키 받은사람 번호 (수정하면 안됨) 
		params.put("type", "sms"); 
		params.put("text", "<VARCHAR> 인증번호는 [" + randomNumber + "] 입니다."
				+ "해당 인증번호를 인증번호 확인란에 기입하여 주세요.");
		params.put("app_version", "JAVA SDK v1.2"); // application name and version

		try {
			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		return randomNumber; // 인증번호 확인용
	}

	public int sendCheck(sendVO vo) {
		if(vo.getRandomNumber().equals(vo.getCheckNum())) { //사용자가 입력한 인증번호와 랜덤인증번호가 
			return 1; //동일하다면
		}else {
			return 0; //다르다면
		}
	}	

}
