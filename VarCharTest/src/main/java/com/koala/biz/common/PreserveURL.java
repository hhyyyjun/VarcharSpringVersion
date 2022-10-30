package com.koala.biz.common;

import javax.servlet.http.HttpServletRequest;

public class PreserveURL {
	public static String preserveURL(HttpServletRequest request) {
	      String prevURL = request.getHeader("referer");
	       System.out.println(prevURL.contains("title")); 
	       return "redirect:" + prevURL;
	   }
}
