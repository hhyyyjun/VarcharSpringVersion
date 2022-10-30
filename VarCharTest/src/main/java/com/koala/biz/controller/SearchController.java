package com.koala.biz.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.koala.biz.service.SearchService;
import com.koala.biz.vo.CarVO;
import com.koala.biz.vo.SearchVO;

@Controller
public class SearchController {
   @Autowired
   private SearchService searchService;

   @RequestMapping("/filter.do")
   public String carSearch(@RequestParam(value="fuel", required=false) String[] fuel, 
         @RequestParam(value="city", required=false) String[] city, SearchVO svo, Model model) {
      System.out.println("SearchController 로그 fuel : " + Arrays.toString(fuel));
      System.out.println("SearchController 로그 city : " + Arrays.toString(city));
      

      // 가격
         //검색할 때 입력한 값이 null이 아닌경우 = 범위를 위해 값을 입력하고 검색한 경우
         // => 첫 차량검색페이지를 실행한 경우 파라미터 값이 null임
         if(svo.getPrice_min() != 0 && svo.getPrice_max() != 0) {
            model.addAttribute("pmin", svo.getPrice_min());
            model.addAttribute("pmax", svo.getPrice_max());
         }

         //연식
         //검색할 때 입력한 값이 null이 아닌경우 = 범위를 위해 값을 입력하고 검색한 경우
         if(svo.getYear_min() != 0 && svo.getYear_max() != 0) {
            model.addAttribute("ymin", svo.getYear_min());
            model.addAttribute("ymax", svo.getYear_max());
         }
         
         //주행거리
         if(svo.getKm_min() != 0 && svo.getKm_max() != 0) {
            model.addAttribute("kmin",svo.getKm_min());
            model.addAttribute("kmax", svo.getKm_max());
         }
         // 정렬
         if(svo.getChecksort() == null) {
        	 svo.setChecksort("최신순");
         }
         model.addAttribute("sort", svo.getChecksort());
         System.out.println("sort111: " + svo.getChecksort());

         ArrayList<String> fList = new ArrayList<String>(); //필터(연료) 선택 시 데이터가 들어갈 배열객체
         ArrayList<String> cList = new ArrayList<String>(); //필터(지역) 선택 시 데이터가 들어갈 배열객체
         if(fuel != null){
            for(int i=0;i<fuel.length;i++) { //선택된 필터 개수에 따라 반복처리하여 검색
               if(fuel[i].equals("전체")){
                  continue;
                  }
               fList.add(fuel[i]);
               System.out.println("받아온 연료 파라미터 값 : " + fuel[i]);
            }
         }
         svo.setFuelList(fList); //SearchVO의 배열객체에 필터선택된 연료배열값 저장
            
         // ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
         model.addAttribute("fList", fList);
         // ★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★★
         
         if(city != null){
            for(int i=0;i<city.length;i++) { //선택된 필터 개수에 따라 반복처리하여 검색
               if(city[i].equals("전체")){
                  continue;
                  }
               cList.add(city[i]);
               System.out.println("받아온 지역 파라미터 값 : " + city[i]);
            }
         }
         svo.setCityList(cList); //SearchVO의 배열객체에 필터선택된 지역배열값 저장
         model.addAttribute("cList", cList);
         int totalDatas = searchService.selectAll(svo).size(); // 전체 데이터 개수
         svo.setDataList(totalDatas);

         List<CarVO> datas = searchService.selectAll(svo);   // 처음 보여줄 데이터 12개
         
         model.addAttribute("datas", datas);
         model.addAttribute("totalDatas", totalDatas);
      
      
      return "filterSearch.jsp";
   }
}