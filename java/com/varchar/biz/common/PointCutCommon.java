package com.varchar.biz.common;

import org.aspectj.lang.annotation.Pointcut;

public class PointCutCommon {
	@Pointcut("execution(* com.varchar.biz..*Impl.*(..))")
	public void aPointcut() {}
	@Pointcut("execution(* com.varchar.biz..*Impl.select*(..))")
	public void bPointcut() {}
}
