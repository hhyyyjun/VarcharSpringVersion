package com.koala.biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.koala.biz.common.JDBCUtil;
import com.koala.biz.service.MemberService;
import com.koala.biz.vo.BoardVO;
import com.koala.biz.vo.MemberVO;


@Repository("memberDAO")
public class MemberDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	@Autowired
	private BoardDAO boardDAO;

	Connection conn;
	PreparedStatement pstmt;

	//로그인 
	final String sql_selectOne="SELECT * FROM CMEMBER WHERE MID=? AND MPW=?";
	// 회원정보변경 -> mid만으로 사용자 데이터 보기
	final String sql_selectOne_M="SELECT * FROM CMEMBER WHERE MID=?";
	//회원가입 
	final String sql_insert="INSERT INTO CMEMBER VALUES(?,?,?,?,?,?,?,?)";
	//회원 리스트 조희 (필요없으면 삭제!!) 
	final String sql_selectAll ="SELECT * FROM CMEMBER";
	//회원 정보 수정 
	final String sql_update = "UPDATE CMEMBER SET MPW=?, MNICKNAME=?, MADD=?, MPHONE=?, MEMAIL=? WHERE MID=?";
	//회원 탈퇴 
	final String sql_delete = "DELETE FROM CMEMBER WHERE MID=?";
	// 회원 탈퇴시 리뷰 ID (알수없음) - 트랜잭션
	final String sql_bupdate = "UPDATE CBOARD SET MID= '(알수없음)' WHERE MID =?";
	// 해당 MID에 게시글 전부 삭제 - 트랜잭션 
	final String sql_bdelete = "DELETE FROM CBOARD WHERE MID=?"; 
	// 아이디 찾기 (회원 이름, 번호 입력) 
	final String sql_findId = "SELECT * FROM CMEMBER WHERE MNAME=? AND MEMAIL=?";
	// 비밀번호 찾기 (회원 아이디, 메일 입력) 
	final String sql_findPw = "SELECT * FROM CMEMBER WHERE MID=? AND MEMAIL=?"; 
	// 재발행 비밀번호로 변경 
	final String sql_updatePw = "UPDATE CMEMBER SET MPW=? WHERE MID=? AND MEMAIL=?";

	//로그인 
	public MemberVO selectOne(MemberVO vo) {	
		try {
			Object[] args= {vo.getMid(),vo.getMpw()};
			return jdbcTemplate.queryForObject(sql_selectOne,args,new MemberRowMapper());
		}catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	// 회원정보변경 -> mid만으로 사용자 데이터 보기
	public MemberVO selectOne_M(MemberVO vo) {
		try {
			Object[] args= {vo.getMid()};
			return jdbcTemplate.queryForObject(sql_selectOne_M,args,new MemberRowMapper());
		}catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	//회원가입
	public boolean insert(MemberVO vo) {
		int res = jdbcTemplate.update(sql_insert, vo.getMid(), vo.getMpw(), vo.getMname(), vo.getMnickname(), 
				vo.getMadd(), vo.getMphone(), vo.getMemail(), vo.getMrole());
		return res>0;
	}

	//회원 리스트 조회 
	public List<MemberVO> selectAll(MemberVO vo){
		try {
			return jdbcTemplate.query(sql_selectAll,new MemberRowMapper());
		}catch (DataAccessException e) {
			return null;
		}
	}

	//회원 정보 수정 
	public boolean update(MemberVO vo) {
		int res = jdbcTemplate.update(sql_update,vo.getMpw(),vo.getMnickname(),vo.getMadd(),vo.getMphone(),vo.getMemail(),vo.getMid());
		System.out.println("memberDAO로그 res :" + res);
		System.out.println("memberDAO로그 vo : " + vo);
		return res>0;
	}

	//회원 탈퇴 
	// res가 true == 게시글 모두 삭제 / false == 알수없음으로 변경 

	public boolean delete(MemberVO vo, BoardVO bvo) throws Exception{
		System.out.println("memberDAO mvo : " + vo);
		System.out.println("bvo : " + bvo);
		//bvo.setMid(vo.getMid());
		System.out.println("bvo setmid : " + bvo);
		// 트랜잭션 시작
		conn = JDBCUtil.connect();
		conn.setAutoCommit(false);
		int res = jdbcTemplate.update(sql_delete,vo.getMid());
		
		System.out.println("삭제된 회원 수 : " + res);
		return res>0;
	}
	
	
	public boolean bdelete(BoardVO bvo) throws Exception{
		System.out.println("boardDAO 가져오니? " + boardDAO.selectAll_userPost(bvo));
		System.out.println("처리할 댓글 개수 : " + boardDAO.selectAll_userPost(bvo).size());
		
		// 삭제, 변경할 게시글이 없을 때
		if(boardDAO.selectAll_userPost(bvo).size() == 0) {
			System.out.println("처리할 댓글 없음");
			return true;
		}
		System.out.println("처리할 댓글 존재");
		int res = -1;
		if(bvo.isRes()) {
			
			res = jdbcTemplate.update(sql_bdelete,bvo.getMid());
			System.out.println("댓글삭제!!");
		}else {
			System.out.println("댓글유지!!");
			res = jdbcTemplate.update(sql_bupdate,bvo.getMid());
		}
		return res > 0;
	}

	// 08.30 추가 사항
	// 아이디 중복 검사 함수 
	// 기존에 있던 selectOne_M sql문 사용 
	// 따로 사용한 이유는 output 값이 다르기 때문
	public int checkId(MemberVO mvo) {
		try {
			Object[] args = {mvo.getMid()};
			boolean res = jdbcTemplate.queryForObject(sql_selectOne_M, args, new MemberRowMapper())!=null;
			return res ? 0 : 1;
		}catch (EmptyResultDataAccessException e) {
			return 1;
		}
	}

	//아이디 찾기 (회원 이름, 이메일 입력) 
	public String findId(MemberVO vo) {
		try {
			String mid =null;

			Object[] args= {vo.getMname(),vo.getMemail()};
			vo = jdbcTemplate.queryForObject(sql_findId,args,new MemberRowMapper());
			mid = vo.getMid();
			return mid;
		}catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	//비밀번호 찾기 (회원 아이디, 메일 입력)
	public String findPW(MemberVO vo) {
		try {
			System.out.println("memberDAO  find id 수1행전 : " + vo);
			Object[] args= {vo.getMid(),vo.getMemail()};
			vo = jdbcTemplate.queryForObject(sql_findPw,args,new MemberRowMapper());
			System.out.println("memberDAO  find id 수1행후 : " + vo);
			String mpw = vo.getMpw();
			System.out.println("memberDAO  find mpw : " + mpw);
			return mpw;
		} catch (EmptyResultDataAccessException e) {
			System.out.println("dataaccesserror");
			e.printStackTrace();
			return null;
		}
	}

	// 재발행 비밀번호로 변경 
	public boolean updatePw(MemberVO vo) {
		try {
			int res = jdbcTemplate.update(sql_updatePw,vo.getMpw(),vo.getMid(),vo.getMemail());
			return res>0;
		}catch (EmptyResultDataAccessException e) {
			return false;
		}
	}

	class MemberRowMapper implements RowMapper<MemberVO> {

		@Override
		public MemberVO mapRow(ResultSet rs, int rowNum) throws SQLException {
			MemberVO data=new MemberVO();
			data.setMid(rs.getString("mid"));
			data.setMpw(rs.getString("mpw"));
			data.setMname(rs.getString("mname"));
			data.setMnickname(rs.getString("mnickname"));
			data.setMadd(rs.getString("madd"));
			data.setMphone(rs.getString("mphone"));
			data.setMemail(rs.getString("memail"));
			data.setMrole(rs.getString("mrole"));
			return data;
		}
	}
}