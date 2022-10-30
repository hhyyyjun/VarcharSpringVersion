package com.koala.biz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.koala.biz.vo.BoardSet;
import com.koala.biz.vo.BoardVO;
import com.koala.biz.vo.ReplyVO;

@Repository("boardDAO")
public class BoardDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;

	// SQL문
	// 문의글 추가
	//---ORCLE
	//final String sql_insert = "INSERT INTO CBOARD(BNUM,MID,BTITLE,BCONTENT,MNICKNAME,BDATE) VALUES((SELECT NVL(MAX(BNUM),0) +1 FROM CBOARD),?,?,?,?,(SELECT SYSDATE FROM DUAL))";
	//---MYSQL
	final String sql_insert ="INSERT INTO CBOARD(BNUM,MID,BTITLE,BCONTENT,MNICKNAME,BDATE) VALUES(?,?,?,?,?,(SELECT SYSDATE() FROM DUAL))";
	// 문의글에 댓글 추가
	//---ORCLE
	//final String sql_insert_R = "INSERT INTO CREPLY(RID,MID,BNUM,CMSG) VALUES((SELECT NVL(MAX(RID),0) +1 FROM CREPLY),?,?,?)";
	//---MYSQL
	final String sql_insert_R = "INSERT INTO CREPLY(RID,MID,BNUM,CMSG) VALUES(?,?,?,?)";
	// 문의글 삭제
	final String sql_delete = "DELETE FROM CBOARD WHERE BNUM=?";
	// 문의글에 댓글 삭제
	final String sql_delete_R = "DELETE FROM CREPLY WHERE RID=?";
	// 문의글 수정
	final String sql_update = "UPDATE CBOARD SET BTITLE=?, CONTENT=?, WHERE BNUM=?";
	// 문의글 상세보기- (문의글 게시판에서는 안씀) 
	final String sql_selectOne = "SELECT * FROM CBOARD WHERE BNUM=?";
	// 문의글 목록보기
	//---ORCLE
	//final String sql_selectAll = "SELECT * FROM (SELECT * FROM CBOARD ORDER BY BNUM DESC) WHERE ROWNUM <=?";
	//---MYSQL
	final String sql_selectAll = "SELECT * FROM CBOARD ORDER BY BNUM DESC LIMIT 0,?";
	// 사용자가 작성한 글
	final String sql_selectAll_userPost = "SELECT * FROM CBOARD WHERE MID = ?";
	// 모든 글(board, boardSet 아님) 가져오기
	final String sql_selectAll_board = "SELECT * FROM CBOARD ORDER BY BNUM DESC";
	// 문의 게시판 더보기 
	final String sql_selectMore_board = "SELECT * FROM CBOARD ORDER BY BNUM DESC LIMIT ?,?";
	// 내가 작성한 문의글 보기 - 사용안함 (지워도됨) 
	final String sql_selectAll_M = "SELECT * FROM (SELECT * FROM CBOARD WHERE MID=? ORDER BY BNUM DESC) WHERE ROWNUM <=?";
	// 문의글 댓글 보기
	final String sql_selectAll_R="SELECT * FROM CREPLY WHERE BNUM=? ORDER BY RID DESC";
	// 문의글 제목 검색
	//---ORCLE
	//final String sql_selectAll_T="SELECT * FROM CBOARD WHERE BTITLE LIKE '%'||?||'%' ORDER BY BNUM DESC";
	//---MYSQL
	final String sql_selectAll_T="SELECT * FROM CBOARD WHERE BTITLE LIKE Concat('%',IFNULL(?, ''),'%') ORDER BY BNUM DESC";
	// 문의 게시판 더보기_검색부분 
	final String sql_selectMore_T="SELECT * FROM CBOARD WHERE BTITLE LIKE Concat('%',IFNULL(?, ''),'%') ORDER BY BNUM DESC LIMIT ?,?";
	// 최근 문의글 3개 제목만 출력
	//---ORCLE
	//final String sql_selectAll_Recent="SELECT * FROM (SELECT B.*, ROWNUM FROM (SELECT * FROM CBOARD ORDER BY ROWNUM DESC) B WHERE ROWNUM <= 3 ) WHERE ROWNUM >= 1 ";
	//---MYSQL
	final String sql_selectAll_Recent="SELECT * FROM CBOARD ORDERS LIMIT 0,3";
	///////////////////////////문의 글 추가///////////////////////////////////////
	public boolean insert(BoardVO bvo) {	// vo로 인자값을 받아 유지보수 용이
		
		int res= jdbcTemplate.update(sql_insert,bvo.getBnum(),bvo.getMid(),bvo.getBtitle(),bvo.getBcontent(),bvo.getMnickname());
		return res>0;
	}
	///////////////////////////문의 글에 댓글 추가///////////////////////////////////////
	public boolean insertR(ReplyVO rvo) {	// vo로 인자값을 받아 유지보수 용이

		int res= jdbcTemplate.update(sql_insert_R,rvo.getRid(),rvo.getMid(),rvo.getBnum(),rvo.getCmsg());
		return res>0;
	}
	////////////////////////////문의 글 삭제//////////////////////////////////////
	public boolean delete(BoardVO bvo) { // vo로 인자값을 받아 유지보수 용이

		int res= jdbcTemplate.update(sql_delete,bvo.getBnum());
		return res>0;
	}
	////////////////////////////문의 글에 달린 댓글삭제//////////////////////////////////////
	public boolean deleteR(ReplyVO rvo) { // vo로 인자값을 받아 유지보수 용이

		int res= jdbcTemplate.update(sql_delete_R,rvo.getRid());
		return res>0;
	}
	////////////////////////////문의 글 수정/////////////////////////////////////
	public boolean update(BoardVO bvo) {// vo로 인자값을 받아 유지보수 용이

		int res= jdbcTemplate.update(sql_update,bvo.getBtitle(),bvo.getBcontent(),bvo.getBnum());
		return res>0;
	}

	/////////////////////////////문의 글 상세보기////////////////////////////////////

	public BoardVO selectOne(BoardVO bvo) {// vo로 인자값을 받아 유지보수 용이
		try {
			Object[] args= {bvo.getBnum()};
			return jdbcTemplate.queryForObject(sql_selectOne,args,new BoardRowMapper());
		}catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	////////////////////////////문의 글 목록, 검색////////////////////////////////////
	public BoardVO selectOneBoard(BoardVO bvo) {
		try {
			Object[] args = {bvo.getBnum()};
			return jdbcTemplate.queryForObject(sql_selectOne, args, new BoardRowMapper());
		}catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	public List<BoardVO> selectAll_userPost(BoardVO bvo) {
		try {
			Object[] args = {bvo.getMid()};
			return jdbcTemplate.query(sql_selectAll_userPost, args, new BoardRowMapper());
		} catch(DataAccessException e) {
			return null;
		}
	}

	public List<BoardSet> selectAll(BoardVO bvo) { // 전체 게시글 or 게시글 제목 검색
		List<BoardSet> boardSet = new ArrayList<BoardSet>();
		List<BoardVO> boardList = new ArrayList<BoardVO>();
		if(bvo.getBtitle() == null) { // 전체 검색
			boardList = jdbcTemplate.query(sql_selectAll_board, new BoardRowMapper());
		}
		else { // 제목 검색
			Object[] args = {bvo.getBtitle()};
			boardList = jdbcTemplate.query(sql_selectAll_T, args, new BoardRowMapper());
		}
		List<ReplyVO> replyList = new ArrayList<ReplyVO>();
		for(BoardVO b : boardList) {
			BoardSet data = new BoardSet();
			Object[] args = {b.getBnum()};
			replyList = jdbcTemplate.query(sql_selectAll_R, args, new ReplyRowMapper());
			data.setBoardVO(b);
			data.setrList((ArrayList<ReplyVO>) replyList);
			boardSet.add(data);
		}
		return boardSet;
	}
	
	 public List<BoardSet> selectMore(BoardVO bvo) { // 전체 게시글 or 게시글 제목 검색 (몇개 씩만 보여주기 ==> 더보기)
	      final int moreContent = 5;
	      
	      List<BoardSet> boardSet = new ArrayList<BoardSet>();
	      List<BoardVO> boardList = new ArrayList<BoardVO>();
	      if(bvo.getBtitle() == null) { // 전체 검색
	         Object[] args = {bvo.getBcnt(), moreContent};
	         boardList = jdbcTemplate.query(sql_selectMore_board, args, new BoardRowMapper());
	      }
	      else { // 제목 검색
	         Object[] args = {bvo.getBtitle(), bvo.getBcnt(), moreContent};
	         boardList = jdbcTemplate.query(sql_selectMore_T, args, new BoardRowMapper());
	      }
	      List<ReplyVO> replyList = new ArrayList<ReplyVO>();
	      for(BoardVO b : boardList) {
	         BoardSet data = new BoardSet();
	         Object[] args = {b.getBnum()};
	         replyList = jdbcTemplate.query(sql_selectAll_R, args, new ReplyRowMapper());
	         data.setBoardVO(b);
	         data.setrList((ArrayList<ReplyVO>) replyList);
	         boardSet.add(data);
	      }
	      return boardSet;
	   }

	////////////////////////최근 등록된 문의글 3개 제목 불러오기//////////////////////////
	public List<BoardVO> selectAll_R(BoardVO bvo) {
		try {
			return jdbcTemplate.query(sql_selectAll_Recent, new BoardRowMapper());
		}catch (DataAccessException e) {
			return null;
		}
	}


	class BoardRowMapper implements RowMapper<BoardVO> {

		@Override
		public BoardVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			BoardVO data = new BoardVO();
			data.setBnum(rs.getInt("BNUM"));
			data.setMid(rs.getString("MID"));
			data.setMnickname(rs.getString("MNICKNAME"));
			data.setBcontent(rs.getString("BCONTENT"));
			data.setBtitle(rs.getString("BTITLE"));
			data.setBdate(rs.getString("BDATE"));
			return data;
		}
	}

	class ReplyRowMapper implements RowMapper<ReplyVO> {

		@Override
		public ReplyVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			ReplyVO data = new ReplyVO();
			data.setBnum(rs.getInt("BNUM"));
			data.setMid(rs.getString("MID"));
			data.setRid(rs.getInt("RID"));
			data.setCmsg(rs.getString("CMSG"));
			return data;
		}

	}

}

