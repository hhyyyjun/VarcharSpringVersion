package com.koala.biz.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.koala.biz.vo.CarVO;
import com.koala.biz.vo.SearchVO;


/*@Repository("searchDAO")*/
public class SearchDAO {

   @Autowired
   private JdbcTemplate jdbcTemplate;

   //메서드를 하나만 사용할 예정이므로 각 조건에 따라 들어갈 sql문의 초기값 설정
   String CfuelSql = "";
   String CcitySql = "";
   String CyearSql = "";
   String CkmSql = "";
   String CpriceSql = "";
   String sql_selectAll = "";
   String Check="";
   //   String sql_selectAll = "SELECT A.* FROM (SELECT * FROM CAR WHERE 1=1" + CfuelSql + " " + CcitySql+ " " +CyearSql + " " + CkmSql + " " + CpriceSql + ") A";

   public List<CarVO> selectAll(SearchVO svo){ // 검색 결과 전체 조회 (전부 다 가져오기)
      //데이터는 CarVO로부터 받아올 예정이기 때문에 제네릭을 CarVO로 설정
      //필터에 사용될 데이터는 SearchVO에서 사용할 것이므로 인자로 두었음
      System.out.println("svo1 : " + svo);
      System.out.println("DAO 로그 fuel 통과 시작 : fuel" + svo.getFuelList());

      if(svo.getFuelList().size() > 0 && !svo.getFuelList().contains("전체")){ //연료의 필터 값을 저장한 배열객체의 길이가 1 이상일 때


         StringBuilder cfuelSb = new StringBuilder(); // append 메서드를 사용하기 위해 StringBuilder을 통해 객체 생성
         ArrayList<String> fuelData  = svo.getFuelList(); //fuelData 배열객체에 필터값을 저장한 값 삽입

         for(int i = 0; i < svo.getFuelList().size() ; i++){ //필터 배열의 길이만큼 반복진행 ex)검색할 필터가 전기, 가솔린 등 
            cfuelSb.append("\'" + fuelData.get(i)+ "\'"); //cfuelSB객체에 'index[i]번쨰의 필터배열값' 뒤에 붙여줌
            if(i+1 < svo.getFuelList().size())   //만약 필터 배열의 길이가 i+1보다 크다면
               cfuelSb.append(",");  // 중간에 ','를 붙여줌

            System.out.println("DAO 로그 cfuelSb append " + cfuelSb.toString());
         }
         //cfuelSql 객체 = AND CFUEL IN ('for문을 통해 나온 필터배열값')
         CfuelSql = "AND CFUEL IN ("+cfuelSb.toString()+")";
      }
      else {
         CfuelSql = "";
      }
      System.out.println("CfuelSql : " + CfuelSql);
      if(svo.getCityList().size() > 0 && !svo.getCityList().contains("전체")){ //지역의 필터 값을 저장한 배열객체의 길이가 1 이상일 때
         StringBuilder ccitySb = new StringBuilder();
         ArrayList<String> citydata  = svo.getCityList();

         for(int i = 0; i < svo.getCityList().size() ; i++){
            ccitySb.append("\'" + citydata.get(i) + "\'");
            if(i+1 < svo.getCityList().size())
               ccitySb.append(","); 
         }
         CcitySql = "AND CCITY IN ("+ccitySb.toString()+")";
      }
      else {
         CcitySql = "";
      }
      System.out.println("CcitySql : " + CcitySql);
      if(svo.getPrice_min() >= 0){ //SearchVO로부터 불러온 price_min의 값이 0보다 크거나 같다면
         //CpriceSql = AND CPRICE BETWEEN '범위의 최소값' AND '범위의 최대값'
         CpriceSql = "AND CPRICE BETWEEN " + svo.getPrice_min() + " AND " + svo.getPrice_max();
      }
      System.out.println("CpriceSql : " + CpriceSql);
      if(svo.getKm_min() >= 0){
         CkmSql = "AND CKM BETWEEN " + svo.getKm_min() + " AND " + svo.getKm_max();
      }
      System.out.println("CkmSql : " + CkmSql);
      if(svo.getYear_min() >= 0){
         CyearSql = "AND CYEAR BETWEEN " + svo.getYear_min() + " AND " + svo.getYear_max();
      }
      System.out.println("CyearSql : " + CyearSql);
      if(svo.getChecksort() != null) { 
         String element = "";
         if(svo.getChecksort().equals("최신순")) {
            element = "CNUM";
         }
         if(svo.getChecksort().equals("제목순정렬")) {
            element = "CTITLE";
         }
         if(svo.getChecksort().equals("가격순정렬")) {
            element = "CPRICE";
         }
         if(svo.getChecksort().equals("주행거리순")) {
            element = "CKM";
         }
         if(element.equals("CNUM")){
            System.out.println("CNUM element값 : "+element);
            Check = "ORDER BY "+element+" DESC";
         }else {
            System.out.println("로그 element값 : "+element);
            Check = "ORDER BY "+element+" ASC";
         }
      }
      System.out.println("Check : " + Check);
      //         if(만약 값이 참이거나 1이라면~) {
      //            range2 += 12;
      //         }
      //sql문을 상단에 위치할 경우 조건에 따른 sql문들이 삽입되었을 때 sql문 자체가 변경된 것이 아니기 때문에
      //메서드를 사용했을 때 원하는 데이터 값을 받을 수 없음.

      sql_selectAll = "SELECT * FROM (SELECT * FROM CAR WHERE 1=1 "
            + CfuelSql + " " + CcitySql+ " " +CyearSql + " " + CkmSql + " " + CpriceSql + ")A "+Check;
      System.out.println("sql_selectAll : " + sql_selectAll);
      return jdbcTemplate.query(sql_selectAll, new SearchRowMapper());
   }

   public List<CarVO> selectMore(SearchVO svo){ // 검색 결과 일정 범위 조회 (검색 결과 페이지 출력 + 더보기)
      //데이터는 CarVO로부터 받아올 예정이기 때문에 제네릭을 CarVO로 설정
      //필터에 사용될 데이터는 SearchVO에서 사용할 것이므로 인자로 두었음
      System.out.println("svo2 : " + svo);
      System.out.println("DAO 로그 fuel 통과 시작 fuel : " + svo.getFuelList());
      if(svo.getFuelList().size() > 0 && !svo.getFuelList().contains("전체")){ //연료의 필터 값을 저장한 배열객체의 길이가 1 이상일 때
         System.out.println("DAO 로그 fuel 통과 중 fuel : " + svo.getFuelList());

         StringBuilder cfuelSb = new StringBuilder(); // append 메서드를 사용하기 위해 StringBuilder을 통해 객체 생성
         ArrayList<String> fuelData  = svo.getFuelList(); //fuelData 배열객체에 필터값을 저장한 값 삽입

         for(int i = 0; i < svo.getFuelList().size() ; i++){ //필터 배열의 길이만큼 반복진행 ex)검색할 필터가 전기, 가솔린 등 
            cfuelSb.append("\'" + fuelData.get(i)+ "\'"); //cfuelSB객체에 'index[i]번쨰의 필터배열값' 뒤에 붙여줌
            if(i+1 < svo.getFuelList().size())   //만약 필터 배열의 길이가 i+1보다 크다면
               cfuelSb.append(",");  // 중간에 ','를 붙여줌

            System.out.println("DAO 로그 cfuelSb append " + cfuelSb.toString());
         }
         //cfuelSql 객체 = AND CFUEL IN ('for문을 통해 나온 필터배열값')
         CfuelSql = "AND CFUEL IN ("+cfuelSb.toString()+")";
      }
      System.out.println("CfuelSql : " + CfuelSql);
      if(svo.getCityList().size() > 0){ //지역의 필터 값을 저장한 배열객체의 길이가 1 이상일 때
         StringBuilder ccitySb = new StringBuilder();
         ArrayList<String> citydata  = svo.getCityList();

         for(int i = 0; i < svo.getCityList().size() ; i++){
            ccitySb.append("\'" + citydata.get(i) + "\'");
            if(i+1 < svo.getCityList().size())
               ccitySb.append(","); 
         }
         CcitySql = "AND CCITY IN ("+ccitySb.toString()+")";
      }
      System.out.println("CcitySql : " + CcitySql);

      if(svo.getPrice_min() >= 0){ //SearchVO로부터 불러온 price_min의 값이 0보다 크거나 같다면
         //             CpriceSql = AND CPRICE BETWEEN '범위의 최소값' AND '범위의 최대값'
         CpriceSql = "AND CPRICE BETWEEN " + svo.getPrice_min() + " AND " + svo.getPrice_max();
      }
      System.out.println("CpriceSql : " + CpriceSql);

      if(svo.getKm_min() >= 0){
         CkmSql = "AND CKM BETWEEN " + svo.getKm_min() + " AND " + svo.getKm_max();
      }
      System.out.println("CkmSql : " + CkmSql);
      if(svo.getYear_min() >= 0){
         CyearSql = "AND CYEAR BETWEEN " + svo.getYear_min() + " AND " + svo.getYear_max();
      }
      System.out.println("CyearSql : " + CyearSql);
      if(svo.getChecksort() != null) { // 정렬
         String element = "";
         if(svo.getChecksort().equals("최신순")) {
            element = "CNUM";
         }
         if(svo.getChecksort().equals("제목순정렬")) {
            element = "CTITLE";
         }
         if(svo.getChecksort().equals("가격순정렬")) {
            element = "CPRICE";
         }
         if(svo.getChecksort().equals("주행거리순")) {
            element = "CKM";
         }
         if(element.equals("CNUM")){
            System.out.println("CNUM element값 : "+element);
            Check = "ORDER BY "+element+" DESC";
         }else {
            System.out.println("로그 element값 : "+element);
            Check = "ORDER BY "+element+" ASC";
         }
      }
      else { // 기본 정렬 (초기 화면 진입 등 입력 없을 때) ==> CNUM 내림차순 정렬
         Check = "ORDER BY CNUM DESC";
      }
      System.out.println("Check : " + Check);
      //          if(만약 값이 참이거나 1이라면~) {
      //             range2 += 12;
      //          }
      //sql문을 상단에 위치할 경우 조건에 따른 sql문들이 삽입되었을 때 sql문 자체가 변경된 것이 아니기 때문에
      //메서드를 사용했을 때 원하는 데이터 값을 받을 수 없음.

      sql_selectAll = "SELECT * FROM (SELECT * FROM CAR WHERE 1=1 "
            + CfuelSql + " " + CcitySql+ " " +CyearSql + " " + CkmSql + " " + CpriceSql + ")A "+Check+" LIMIT "+svo.getRange1()+ ","+svo.getRange2();
      System.out.println("sql_selectAll : " + sql_selectAll);
      return jdbcTemplate.query(sql_selectAll, new SearchRowMapper());
   }
}

class SearchRowMapper implements RowMapper<CarVO>{

   @Override
   public CarVO mapRow(ResultSet rs, int rowNum) throws SQLException {
      CarVO cvo = new CarVO();
      cvo.setCnum(rs.getInt("CNUM"));
      cvo.setCfuel(rs.getString("CFUEL"));
      cvo.setCtitle(rs.getString("CTITLE"));
      cvo.setCprice(rs.getInt("CPRICE"));
      cvo.setCkm(rs.getInt("CKM"));
      cvo.setCcity(rs.getString("CCITY"));
      cvo.setCimg(rs.getString("CIMG"));
      cvo.setCyear(rs.getInt("CYEAR"));
      return cvo;
   }
}
