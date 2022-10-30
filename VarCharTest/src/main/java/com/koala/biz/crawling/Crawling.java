package com.koala.biz.crawling;

import java.io.IOException;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.koala.biz.dao.CarDAO;
import com.koala.biz.vo.CarVO;


public class Crawling {
//	public static void main(String[] args) {
		public static void data(){
	
		int count = 0;
		for(int i=1;i<2;i++) {
			String url = "https://www.bobaedream.co.kr/cyber/CyberCar.php?sel_m_gubun=ALL&page="+i+"&order=S11&view_size=70";
			Document doc = null;
			try {
				doc = Jsoup.connect(url).get(); 
			} catch (IOException e) {
				e.printStackTrace();
			}

			String ctitle1 = "p.tit.ellipsis > a"; // 차량명
			String csubtitle1 = "p.stxt.ellipsis > a"; // 설명
			String cyear1 = "div.mode-cell.year > span.text"; // 연식
			String cfuel1 = "div.mode-cell.fuel > span.text"; //엔진
			String ckm1 = "div.mode-cell.km > span.text"; //주행거리
			String cprice1 = "div.mode-cell.price"; //가격
			String ccity1 = "ul.content-list > li:nth-child(1) > span.text"; // 지역
			String cimg1 = "div.list-inner > div.mode-cell.thumb > a.img.w132 > img"; // 이미지

			Elements eles = doc.select("ul.clearfix"); // 아래 정보들을 포함하는 div의 정보 가져온다
			Elements ctitle2 = eles.select(ctitle1); 
			Elements csubtitle2 = eles.select(csubtitle1); 
			Elements cyear2 = eles.select(cyear1); 
			Elements cfuel2 = eles.select(cfuel1); 
			Elements ckm2 = eles.select(ckm1);
			Elements cprice2 = eles.select(cprice1); 
			Elements ccity2 = eles.select(ccity1);
			Elements cimg2 = eles.select(cimg1);

			Iterator<Element> ctitle3 = ctitle2.iterator();
			Iterator<Element> csubtitle3 = csubtitle2.iterator();
			Iterator<Element> cyear3 = cyear2.iterator();
			Iterator<Element> cfuel3 = cfuel2.iterator();
			Iterator<Element> ckm3 = ckm2.iterator();
			Iterator<Element> cprice3 = cprice2.iterator();
			Iterator<Element> ccity3 = ccity2.iterator();
			Iterator<Element> cimg3 = cimg2.iterator();
			
			CarDAO cDAO = new CarDAO();
			while (ctitle3.hasNext()) {
				//자동차 명
				String ctitle4 = ctitle3.next().text();
				System.out.println("차 : " + ctitle4);
				//자동차설명
				String csubtitle4 = csubtitle3.next().text();
				System.out.println("설명 : " + csubtitle4);

				//연식 : 데이터 가공
				String cyear4 = cyear3.next().text(); 
				cyear4 = cyear4.substring(cyear4.length()-5, cyear4.length()-3); //연식 xx/xx 중 '/' 앞부분의 2자리수만 추출
				cyear4 = "20".concat(cyear4); //20xx 년도로 저장하기 위해 concat으로 문자열 합침
				System.out.println("연식 : " + Integer.parseInt(cyear4));

				//엔진 : 데이터 가공
				String cfuel4 = cfuel3.next().text();
				if(cfuel4.indexOf("+") > 0) { // 문자열 '+'의 인덱스가 0보다 클 경우
					cfuel4 = cfuel4.substring(0,cfuel4.indexOf("+")); //문자열 처음부터 '+' 전까지 잘라 저장
				}
				System.out.println("엔진 : " + cfuel4);

				//주행거리 : 데이터 가공
				String ckm4 = ckm3.next().text();
				if(ckm4.equals("미등록")) {
					ckm4 = "0";
				}
				else if(ckm4.indexOf("k") > 0) { // 문자열 'k'의 인덱스가 0보다 클 경우
					ckm4 = ckm4.substring(0, ckm4.indexOf("k")); //문자열 처음부터 'k' 전까지 잘라 저장
					if(ckm4.indexOf("만")>0) { // 문자열 '만'의 인덱스가 0보다 클 경우
						ckm4 = ckm4.substring(0,ckm4.indexOf("만")); //문자열 처음부터 '만' 전까지 잘라 저장
						ckm4 = ckm4.concat("0000"); //concat으로 0000 합침
					}else if(ckm4.indexOf("천")>0) { // 문자열 '천'의 인덱스가 0보다 클 경우
						ckm4 = ckm4.substring(0,ckm4.indexOf("천")); //문자열 처음부터 '천' 전까지 잘라 저장
						ckm4 = ckm4.concat("000"); //concat으로 000 합침
					}else {
						ckm4 = ckm4.concat("000"); //concat으로 000 합침
					}
				}
				else if(ckm4.indexOf("m")>0) { //문자열 'm'의 인덱스가 0보다 클 경우
		               ckm4 = ckm4.substring(0, ckm4.indexOf("m")); //문자열 처음부터 'm' 전까지 잘라 저장
		               if(ckm4.indexOf("만")>0) { // 문자열 '만'의 인덱스가 0보다 클 경우
		                  ckm4 = ckm4.substring(0,ckm4.indexOf("만")); //문자열 처음부터 '만' 전까지 잘라 저장
		                  ckm4 = ckm4.concat("0000"); //concat으로 0000 합침
		               }else if(ckm4.indexOf("천")>0) { // 문자열 '천'의 인덱스가 0보다 클 경우
		                  ckm4 = ckm4.substring(0,ckm4.indexOf("천")); //문자열 처음부터 '천' 전까지 잘라 저장
		                  ckm4 = ckm4.concat("000"); //concat으로 000 합침
		               }else {
		                  ckm4 = ckm4.concat("000"); //concat으로 000 합침
		               }
		            }
				System.out.println("주행거리 : " + Integer.parseInt(ckm4));

				//가격 : 데이터 가공
				String cprice4 = cprice3.next().text();
				if(cprice4.equals("상담") || cprice4.equals("운용리스") || cprice4.equals("금융리스") || cprice4.equals("계약") || cprice4.equals("팔림") || cprice4.equals("보류") || cprice4.equals("렌트")) {
					cprice4 = "" + Integer.MAX_VALUE; // 가격이 기재되지 않은 경우 int형 최대값으로 만듦
				}
				else if(cprice4.indexOf(" ") > 0) { // indexOf로 공백이 있는 위치의 인덱스가 0보다 클 경우
					cprice4 = cprice4.substring(0, cprice4.indexOf(" ")); //문자열 처음부터 공백 전까지 잘라 저장
					cprice4 = cprice4.replace(",", ""); // 문자열에서 ',' 를 빈 값으로 설정
				}
				System.out.println("가격 : " + Integer.parseInt(cprice4));

				//지역 : 데이터 가공
				String ccity4 = ccity3.next().text();
				if(ccity4.equals("오토갤러리")) { //지역이 오토갤러리로 나올 경우 '경기'로 변경하여 저장
					ccity4 = ccity4.replace("오토갤러리", "경기"); 
				}
				else if(ccity4.indexOf(" ") > 0) { // indexOf로 공백이 있는 위치의 인덱스가 0보다 클 경우
					ccity4 = ccity4.substring(0,ccity4.indexOf(" ")); //문자열 처음부터 공백 전까지 잘라 저장
				}
				System.out.println("지역 : " + ccity4);
				
				//이미지
				String cimg4 = cimg3.next().attr("src"); //이미지의 URL을 가져오기 위해 속성 src를 불러옴
				System.out.println("이미지 url : " + cimg4);
				
				count++;
				System.out.println("순서 : "+count);
				System.out.println();
				CarVO vo = new CarVO();
				vo.setCtitle(ctitle4);
				vo.setCsubtitle(csubtitle4);
				vo.setCyear(Integer.parseInt(cyear4)); 
				vo.setCfuel(cfuel4);
				vo.setCkm(Integer.parseInt(ckm4));
				vo.setCprice(Integer.parseInt(cprice4)); 
				vo.setCcity(ccity4); 
				vo.setCimg(cimg4);
				cDAO.crawinsert(vo);// dao insert함수 호출
			}
		}
		System.out.println("총 크롤링된 데이터 수 : "+count);
		System.out.println("로그: DB에 저장완료!");
		System.out.println();
	}
}