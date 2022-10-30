package com.koala.biz.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.koala.biz.dao.BoardDAO;
import com.koala.biz.service.BoardService;
import com.koala.biz.vo.BoardSet;
import com.koala.biz.vo.BoardVO;
import com.koala.biz.vo.ReplyVO;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO boardDAO;

	@Override
	public boolean insert(BoardVO bvo) {
		return boardDAO.insert(bvo);
	}

	@Override
	public boolean insertR(ReplyVO rvo) {
		return boardDAO.insertR(rvo);
	}

	@Override
	public boolean delete(BoardVO bvo) {
		return boardDAO.delete(bvo);
	}

	@Override
	public boolean deleteR(ReplyVO rvo) {
		return boardDAO.deleteR(rvo);
	}

	@Override
	public boolean update(BoardVO bvo) {
		return boardDAO.update(bvo);
	}

	@Override
	public BoardVO selectOne(BoardVO bvo) {
		return boardDAO.selectOne(bvo);
	}

	@Override
	public BoardVO selectOneBoard(BoardVO bvo) {
		return boardDAO.selectOneBoard(bvo);
	}

	@Override
	public List<BoardVO> selectAll_R(BoardVO bvo) {
		return boardDAO.selectAll_R(bvo);
	}

	@Override
	public List<BoardSet> selectAll(BoardVO bvo) {
		return boardDAO.selectAll(bvo);
	}

	@Override
	public List<BoardVO> selectAll_userPost(BoardVO bvo) {
		return boardDAO.selectAll_userPost(bvo);
	}

	@Override
	public List<BoardSet> selectMore(BoardVO bvo) {
		return boardDAO.selectMore(bvo);
	}

}
