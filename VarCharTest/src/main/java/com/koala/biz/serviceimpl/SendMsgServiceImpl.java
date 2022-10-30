package com.koala.biz.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koala.biz.dao.SendMsgDAO;
import com.koala.biz.service.SendMsgService;
import com.koala.biz.vo.sendVO;

@Service("sendmsgService")
public class SendMsgServiceImpl implements SendMsgService{
	
	@Autowired
	private SendMsgDAO sendmsgDAO;

	@Override
	public int sendmsg(sendVO vo) {
		return sendmsgDAO.sendmsg(vo);
	}

	@Override
	public int sendCheck(sendVO vo) {
		return sendmsgDAO.sendCheck(vo);
	}

}
