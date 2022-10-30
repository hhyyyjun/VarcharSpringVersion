package com.koala.biz.common;

import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice("com.koala.biz") // CommonExceptionHandler를 객체화해주는 @
public class CommonExceptionHandler {

	/*@RequestMapping과 비슷한 역할로 bean내에서 발생하는 예외를 잡아서 하나의 메서드로 처리해주는 기능*/
	//인자로 캐치하고 싶은 예외클래스를 등록
   @ExceptionHandler({NullPointerException.class, FileNotFoundException.class, Exception.class, IOException.class})
   public ModelAndView aException(Exception e) { 
      ModelAndView mav=new ModelAndView();
      mav.addObject("exception",e);
      mav.setViewName("/error/error.jsp");
      return mav;
   }
}