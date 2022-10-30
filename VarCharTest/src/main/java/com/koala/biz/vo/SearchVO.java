package com.koala.biz.vo;

import java.util.ArrayList;

public class SearchVO {
	private ArrayList<String> fuelList = new ArrayList<>(); // input태그의 checkbox를 사용하여 중복 선택을 할 수 있으므로 문자열을 배열형태로 저장
	private ArrayList<String> cityList = new ArrayList<>(); // input태그의 checkbox를 사용하여 중복 선택을 할 수 있으므로 문자열을 배열형태로 저장
	private int price_min; // 차량 검색페이지로 처음 이동 시 차량 가격의 초기값을 설정할 변수 (기본생성자에 초기값 설정)
	private int price_max;
	private int km_min; // 차량 검색페이지로 처음 이동 시 주행거리의 초기값을 설정할 변수 (기본생성자에 초기값 설정)
	private int km_max;
	private int year_min; // 차량 검색페이지로 처음 이동 시 연식의 초기값을 설정할 변수 (기본생성자에 초기값 설정)
	private int year_max;
	private String checksort; // 정렬 데이터가 저장될 변수
	private int range1;
	private int range2;
	
	private int dataList;

	public SearchVO() { //크롤링 데이터 컬럼 값 범위에 따라 초기값 수정 비교 
		this.price_min = 0;
		this.price_max = Integer.MAX_VALUE;
		this.year_min = 0;
		this.year_max = 3000;
		this.km_min = 0;
		this.km_max = 10000000;
		this.range1 = 0; //Oracle Rownum =1, MySQL limit =0
		this.range2 = 12; //Oracle Rownum: 최대 데이터 조회 범위, MySQL Limit : 더 보여질 데이터 개수 
		this.dataList = -1;
	}
	


	public int getDataList() {
		return dataList;
	}



	public void setDataList(int dataList) {
		this.dataList = dataList;
	}



	public String getChecksort() {
		return checksort;
	}

	public void setChecksort(String checksort) {
		this.checksort = checksort;
	}

	public ArrayList<String> getFuelList() {
		return fuelList;
	}

	public void setFuelList(ArrayList<String> fuelList) {
		this.fuelList = fuelList;
	}

	public ArrayList<String> getCityList() {
		return cityList;
	}

	public void setCityList(ArrayList<String> cityList) {
		this.cityList = cityList;
	}

	public int getPrice_min() {
		return price_min;
	}

	public void setPrice_min(int price_min) {
		this.price_min = price_min;
	}

	public int getPrice_max() {
		return price_max;
	}

	public void setPrice_max(int price_max) {
		this.price_max = price_max;
	}

	public int getKm_min() {
		return km_min;
	}

	public void setKm_min(int km_min) {
		this.km_min = km_min;
	}

	public int getKm_max() {
		return km_max;
	}

	public void setKm_max(int km_max) {
		this.km_max = km_max;
	}

	public int getYear_min() {
		return year_min;
	}

	public void setYear_min(int year_min) {
		this.year_min = year_min;
	}

	public int getYear_max() {
		return year_max;
	}

	public void setYear_max(int year_max) {
		this.year_max = year_max;
	}

	public int getRange1() {
		return range1;
	}

	public void setRange1(int range1) {
		this.range1 = range1;
	}

	public int getRange2() {
		return range2;
	}

	public void setRange2(int range2) {
		this.range2 = range2;
	}

	@Override
	public String toString() {
		return "SearchVO [fuelList=" + fuelList + ", cityList=" + cityList + ", price_min=" + price_min + ", price_max="
				+ price_max + ", km_min=" + km_min + ", km_max=" + km_max + ", year_min=" + year_min + ", year_max="
				+ year_max + ", checksort=" + checksort + ", range1=" + range1 + ", range2=" + range2 + ", dataList="
				+ dataList + "]";
	}





	
	
}