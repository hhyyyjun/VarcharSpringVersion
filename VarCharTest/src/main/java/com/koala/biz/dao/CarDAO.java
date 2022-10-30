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

import com.koala.biz.common.JDBCUtil;
import com.koala.biz.vo.CarVO;


@Repository("carDAO")
public class CarDAO {
	
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
   Connection conn;
   PreparedStatement pstmt;
   //====================크롤링 용 sql문(크롤링 안해도 쓰이긴함 )=====================================
   // 자동차 추가
   //---ORCLE
   //final String sql_insert = "INSERT INTO CAR VALUES((SELECT NVL(MAX(CNUM),0)+1 FROM CAR),?,?,?,?,?,?,?,?)";
   //---MYSQL
   final String sql_insert =  "INSERT INTO CAR VALUES((SELECT CNUM FROM(SELECT IFNULL(MAX(CNUM),0)+1 AS CNUM FROM CAR)A),?,?,?,?,?,?,?,?)";
   final String sql_sample = "SELECT COUNT(*) AS CNUM FROM CAR";
   //filterSearchAction에서 페이징 할떄 사용
   //---ORCLE
   //final String sql_selectAllOneToTwelve="SELECT * FROM (SELECT C.*, ROWNUM FROM (SELECT * FROM CAR ORDER BY ROWNUM ) C WHERE ROWNUM <= ? ) WHERE ROWNUM >= 1";
   //---MYSQL
   final String sql_selectAllOneToTwelve="SELECT * FROM CAR ORDERS LIMIT 0,12"; 
   //-----------------------------------------------------------------------------------------------------------
   final String sql_selectAll="SELECT * FROM CAR";
   //======================크롤링 끝====================================================
   // 자동차 정보 수정(다른 사항은 변경 할 수 없으므로 가격과 지역만 변경 가능)
   final String sql_update = "UPDATE CAR SET CPRICE=?, CCITY=? WHERE CNUM=?";
   // 자동차 삭제
   final String sql_delete = "DELETE FROM CAR WHERE CNUM=?";
   // 자동차 검색
   final String sql_selectF = "SELECT * FROM CAR WHERE CTITLE IN (SELECT FROM CTITLE CAR) AND CYEAR IN(SELECT FROM CYEAR WHERE CAR) AND CFUEL IN(SELECT FROM CFUEL WHERE CAR) AND CKM IN(SELECT FROM CKM WHERE CAR) AND CPRICE IN(SELECT FROM CPRICE WHERE CAR)"; 
   final String sql_selectS = "SELECT * FROM CAR WHERE CTITLE IN REPLACE((SELECT FROM CTITLE CAR),'SELECT FROM CTITLE CAR','?')";
   //---ORCLE
   //final String sql_selectAll_Recent="SELECT * FROM (SELECT C.*, ROWNUM FROM (SELECT * FROM CAR ORDER BY ROWNUM DESC) C WHERE ROWNUM <= 12 ) WHERE ROWNUM >= 1 ";
   //---MYSQL
   final String sql_selectAll_Recent="SELECT * FROM CAR ORDERS LIMIT 0,12";   
   final String sql_selectOne="SELECT * FROM CAR WHERE CNUM=?";
   //===================Crawling data============
   //////////////////////////자동차 추가/////////////////////////////////
    // Crawling data
      public boolean insert(CarVO vo) {

         int res = jdbcTemplate.update(vo.getCtitle(),vo.getCsubtitle(),vo.getCyear(),vo.getCyear(),vo.getCfuel(),vo.getCkm(),
        		 vo.getCprice(),vo.getCcity(),vo.getCimg());
         return res>0;
      }
      
      public boolean crawinsert(CarVO vo) {
          conn = JDBCUtil.connect();
          try {
             pstmt = conn.prepareStatement(sql_insert);
             pstmt.setString(1, vo.getCtitle()); 
             pstmt.setString(2, vo.getCsubtitle()); 
             pstmt.setInt(3, vo.getCyear()); 
             pstmt.setString(4, vo.getCfuel());
             pstmt.setInt(5, vo.getCkm()); 
             pstmt.setInt(6, vo.getCprice()); 
             pstmt.setString(7, vo.getCcity()); 
             pstmt.setString(8, vo.getCimg()); 

             pstmt.executeUpdate();
          } catch (Exception e) {
             e.printStackTrace();
             return false;
          } finally {
             JDBCUtil.disconnect(pstmt, conn);
          }
          return true;
       }

      
      public List<CarVO> selectAll(CarVO vo){
    	  try {
    	  return jdbcTemplate.query(sql_selectAll,new CarRowMapper());
      }catch (EmptyResultDataAccessException e) {
			return null;
		}
	}
      
      // 샘플데이터가 있는지?
      public boolean hasSample(CarVO vo) {
          conn = JDBCUtil.connect();
          try {
             pstmt = conn.prepareStatement(sql_sample);
             ResultSet rs = pstmt.executeQuery();
             rs.next();
             int cnum = rs.getInt("CNUM");
             if (cnum >= 1) {
                return true;
             }
             return false;
          } catch (SQLException e) {
             e.printStackTrace();
             return false;
          } finally {
             JDBCUtil.disconnect(pstmt, conn);
          }
       }
   //=========================크롤링 끝 ===============================
   
   //////////////////////////자동차 정보 수정/////////////////////////////////
   public boolean update(CarVO vo) {
      int res = jdbcTemplate.update(sql_update,vo.getCprice(),vo.getCcity(),vo.getCnum());
      return res>0;
   }
   //////////////////////////자동차 삭제/////////////////////////////////
   public boolean delete(CarVO vo) {
	   int res = jdbcTemplate.update(sql_delete,vo.getCnum());
	      return res>0;
   }
   //디테일 페이지에서 사용
   public CarVO selectOne(CarVO vo) {
	   try {
      Object[] args= {vo.getCnum()};
		return jdbcTemplate.queryForObject(sql_selectOne,args,new CarRowMapper());
   }catch (EmptyResultDataAccessException e) {
		return null;
	}
}
      public List<CarVO> selectAll_R(CarVO vo){
    	  try {
     	Object[] args= {vo.getCtitle(),vo.getCprice(),vo.getCfuel()};
     	return jdbcTemplate.query(sql_selectAll_Recent,args,new CarRowMapper());
      }catch (DataAccessException e) {
			return null;
		}
	}
      

      public List<CarVO> selectAllPage(CarVO vo){
    	  try {
      	return jdbcTemplate.query(sql_selectAllOneToTwelve,new CarRowMapper());
      }catch (DataAccessException e) {
			return null;
		}
	}
   
      class CarRowMapper implements RowMapper<CarVO> {

  		@Override
  		public CarVO mapRow(ResultSet rs, int rowNum) throws SQLException {
  		  CarVO data=new CarVO();
          data.setCnum(rs.getInt("CNUM"));
          data.setCtitle(rs.getString("CTITLE"));
          data.setCsubtitle(rs.getString("CSUBTITLE"));
          data.setCyear(rs.getInt("CYEAR"));
          data.setCfuel(rs.getString("CFUEL"));
          data.setCkm(rs.getInt("CKM"));
          data.setCprice(rs.getInt("CPRICE"));
          data.setCcity(rs.getString("CCITY"));
          data.setCimg(rs.getString("CIMG"));
          return data;
  		}
  	}
  }