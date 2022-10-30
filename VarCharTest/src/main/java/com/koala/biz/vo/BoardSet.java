package com.koala.biz.vo;

import java.util.ArrayList;

public class BoardSet {
	// ★★★★★★
	// 글 1개 + 댓글 N개
	// java에서 사용할 vo를 자체제작
	
	private BoardVO boardVO;
	private ArrayList<ReplyVO> rList = new ArrayList<ReplyVO>();
	public BoardVO getBoardVO() {
		return boardVO;
	}
	public void setBoardVO(BoardVO boardVO) {
		this.boardVO = boardVO;
	}
	public ArrayList<ReplyVO> getrList() {
		return rList;
	}
	public void setrList(ArrayList<ReplyVO> rList) {
		this.rList = rList;
	}
	@Override
	public String toString() {
		return "BoardSet [boardVO=" + boardVO + ", rList=" + rList + "]";
	}
	
	
}
