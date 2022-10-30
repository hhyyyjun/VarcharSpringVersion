package com.koala.biz.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.koala.biz.dao.MemberDAO;
import com.koala.biz.service.MemberService;
import com.koala.biz.vo.BoardVO;
import com.koala.biz.vo.MemberVO;

@Service("memberService")
public class MerberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDAO memberDAO;
	

	@Override
	public MemberVO selectOne(MemberVO vo) {
		return memberDAO.selectOne(vo);
	}

	@Override
	public MemberVO selectOne_M(MemberVO vo) {
		return memberDAO.selectOne_M(vo);
	}

	@Override
	public boolean insert(MemberVO vo) {
		return memberDAO.insert(vo);
	}

	@Override
	public List<MemberVO> selectAll(MemberVO vo) {
		return memberDAO.selectAll(vo);
	}

	@Override
	public boolean update(MemberVO vo) {
		return memberDAO.update(vo);
	}
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public boolean delete(MemberVO vo, BoardVO bvo) throws Exception  {
		return memberDAO.delete(vo,bvo) && bdelete(bvo);
	}

	@Override
	public boolean bdelete(BoardVO bvo) throws Exception {
		return memberDAO.bdelete(bvo);
	}

	@Override
	public int checkId(MemberVO vo) {
		return memberDAO.checkId(vo);
	}

	@Override
	public String findId(MemberVO vo) {
		return memberDAO.findId(vo);
	}

	@Override
	public String findPW(MemberVO vo) {
		return memberDAO.findPW(vo);
	}

	@Override
	public boolean updatePw(MemberVO vo) {
		return memberDAO.updatePw(vo);
	}

}
