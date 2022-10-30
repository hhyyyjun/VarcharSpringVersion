package com.koala.biz.service;


import java.util.List;

import com.koala.biz.vo.BoardSet;
import com.koala.biz.vo.BoardVO;
import com.koala.biz.vo.ReplyVO;

public interface BoardService {
	public boolean insert(BoardVO bvo);//문의 글 작성
	public boolean insertR(ReplyVO rvo);//문의 글 댓글 작성
	public boolean delete(BoardVO bvo);//문의 글 삭제
	public boolean deleteR(ReplyVO rvo);//문의 글 댓글 삭제 
	public boolean update(BoardVO bvo);//문의 글 수정 
	public BoardVO selectOne(BoardVO bvo);//문의 글 상세보기 
	public List<BoardSet> selectAll(BoardVO bvo);// 전체 게시글 or 게시글 제목 검색
	public List<BoardSet> selectMore(BoardVO bvo);// 전체 게시글 or 게시글 제목 검색
	BoardVO selectOneBoard(BoardVO bvo);//문의 글 목록, 검색 기능
	public List<BoardVO> selectAll_R(BoardVO bvo) ;//최근 등록 문의글 3개 제목 불러오기
	public List<BoardVO> selectAll_userPost(BoardVO bvo);
	 
}
