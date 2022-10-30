package com.koala.biz.common;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;

@Aspect
public class PointcutCommon {
   @Pointcut("execution(* com.koala.biz..*Impl.*(..))")
   public void aPointcut() {}
}