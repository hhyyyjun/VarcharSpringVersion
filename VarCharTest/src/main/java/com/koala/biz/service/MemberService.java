package com.koala.biz.service;

import java.util.List;

import com.koala.biz.vo.BoardVO;
import com.koala.biz.vo.MemberVO;

public interface MemberService {
	public MemberVO selectOne(MemberVO vo);//로그인 
	public MemberVO selectOne_M(MemberVO vo);// 회원정보변경 -> mid만으로 사용자 데이터 보기
	public boolean insert(MemberVO vo);//회원가입
	public List<MemberVO> selectAll(MemberVO vo);//회원 리스트 조회 
	public boolean update(MemberVO vo);//회원 정보 수정 
	public boolean delete(MemberVO vo, BoardVO bvo) throws Exception;//회원 탈퇴 
	public boolean bdelete(BoardVO bvo) throws Exception;//회원 탈퇴 
	public int checkId(MemberVO vo);// 아이디 중복 검사
	public String findId(MemberVO vo);//아이디 찾기
	public String findPW(MemberVO vo);//비밀번호 찾기
	public boolean updatePw(MemberVO vo);// 재발행 비밀번호로 변경 
}
