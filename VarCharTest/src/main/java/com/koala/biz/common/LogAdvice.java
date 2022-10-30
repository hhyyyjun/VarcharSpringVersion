package com.koala.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Service;

@Service
@Aspect
public class LogAdvice {
   @Before("PointcutCommon.aPointcut()")
   public void printLog(JoinPoint jp) {
      String methodName=jp.getSignature().getName();
      Object[] args=jp.getArgs();
      
      System.out.println("수행중인 핵심메서드명: "+methodName);
      System.out.println("사용하는 인자");
      System.out.println("=====");
      for(Object v:args) {
         System.out.println(v);
      }
      System.out.println("=====");
   }
}