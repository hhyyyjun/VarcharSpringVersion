package com.koala.biz.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.koala.biz.service.SearchService;
import com.koala.biz.vo.CarVO;
import com.koala.biz.vo.SearchVO;

   @Controller
   public class ShowMore {

      @Autowired
      private SearchService searchService;

      @ResponseBody
      @RequestMapping(value="/showMore.do")
      public JSONObject showMore(@RequestParam(value="cityList") String cityOptions, 
            @RequestParam(value="fuelList") String fuelOptions,
            SearchVO svo, Model model) {
    	  
    	  svo.setDataList(0);
    	  
         ArrayList<String> cityList = new ArrayList<String>();
         ArrayList<String> fuelList = new ArrayList<String>();
         try {
            JSONParser parser = new JSONParser();
            JSONArray cityTmp = (JSONArray)parser.parse(cityOptions);
            JSONArray fuelTmp = (JSONArray)parser.parse(fuelOptions);
            cityList = cityTmp;     fuelList = fuelTmp;
            
         } catch (ParseException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
         }
         svo.setCityList(cityList);   svo.setFuelList(fuelList);
         
         
         System.out.println("svo : " + svo);
         final int moreContent = 12; // 더보기를 클릭할 때마다 보여줄 상품 개수   
         svo.setRange2(moreContent);





         List<CarVO> dataList = searchService.selectAll(svo);


         // 다음에 보여줄 데이터 존재 여부 --> 더보기 버튼 활성화 / 비활성화
         boolean showMore = true; // 더보기 버튼 활성화 여부
         // 미리 다음에 보여줄 동일 항목 데이터 개수 계산
         //         range1 += moreContent; 
         //         range2 += moreContent;               
         //         svo.setRange1(range1);
         
         svo.setRange1(svo.getRange1() + moreContent);
         svo.setRange2(moreContent);
       
         //         svo.setRange2(range2);
         List<CarVO> nextDataList = searchService.selectAll(svo);
         // 더 보여줄 데이터가 없다면 --> 더보기 버튼 비활성화
         if(nextDataList.size() == 0) {
            showMore = false;

         }

         // ajax 응답 데이터
         JSONObject obj = new JSONObject();
         JSONArray jArray = new JSONArray();
         try {
            for(int i = 0; i < dataList.size(); i++) {
               JSONObject sObject = new JSONObject();  // 더 보여줄 중고차 상품 1개 (밑에는 정보들)
               sObject.put("cimg", dataList.get(i).getCimg());
               sObject.put("ctitle", dataList.get(i).getCtitle());
               sObject.put("ckm", dataList.get(i).getCkm());
               sObject.put("cprice", dataList.get(i).getCprice());
               sObject.put("cnum", dataList.get(i).getCnum());
               sObject.put("cyear", dataList.get(i).getCyear());
               sObject.put("cfuel", dataList.get(i).getCfuel());
               sObject.put("ccity", dataList.get(i).getCcity());
               sObject.put("csubtitle", dataList.get(i).getCsubtitle());
               jArray.add(sObject);
            }
            obj.put("dataList", jArray); // 더 보여줄 상품
            obj.put("showMore", showMore); // 더보기 활성화 여부
         } catch (Exception e) {
            e.printStackTrace();
         }
         return obj;
      }
   }