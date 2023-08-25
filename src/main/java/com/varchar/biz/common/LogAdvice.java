package com.varchar.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.springframework.util.StopWatch;

import com.varchar.biz.member.MemberVO;

//@Service
//@Aspect
public class LogAdvice {
	
	// 로그 색상 변경
	public static final String RESET = "\u001B[0m";
	public static final String FONT_BLACK = "\u001B[30m";
	public static final String FONT_RED = "\u001B[31m";
	public static final String FONT_GREEN = "\u001B[32m";
	public static final String FONT_YELLOW = "\u001B[33m";
	public static final String FONT_BLUE = "\u001B[34m";
	public static final String FONT_PURPLE = "\u001B[35m";
	public static final String FONT_CYAN = "\u001B[36m";
	public static final String FONT_WHITE = "\u001B[37m";
	public static final String BACKGROUND_BLACK = "\u001B[40m";
	public static final String BACKGROUND_RED = "\u001B[41m";
	public static final String BACKGROUND_GREEN = "\u001B[42m";
	public static final String BACKGROUND_YELLOW = "\u001B[43m";
	public static final String BACKGROUND_BLUE = "\u001B[44m";
	public static final String BACKGROUND_PURPLE = "\u001B[45m";
	public static final String BACKGROUND_CYAN = "\u001B[46m";
	public static final String BACKGROUND_WHITE = "\u001B[47m";
	
//	System.out.println(FONT_BLUE);
//	System.out.println(RESET);
	
	
//	@Before("PointCutCommon.aPointcut()")
//	public void beforeLog() {
//		System.out.println("횡단관심: 비즈니스 메서드 수행 전에 호출됨");
//	}
	
	@After("PointCutCommon.aPointcut()")
	public void afterLog() {
		System.out.println("[횡단관심]");
		System.out.println("     비즈니스 메서드 수행 후에 호출됨");
		System.out.println();
	}
	
	@AfterReturning(pointcut="PointCutCommon.bPointcut()", returning="returnObj")
	public void afterReturningLog(JoinPoint jp, Object returnObj) {
		String methodName=jp.getSignature().getName();
		System.out.println("횡단관심 : "+methodName+"의 반환 이후의 로그");
		if(returnObj instanceof MemberVO) {
			MemberVO memberVO=(MemberVO)returnObj;
//			if(memberVO.getRole().equals("ADMIN")) {
//				System.out.println("[관리자 입장]");
//			}
//			else {
//				System.out.println("[사용자 입장]");
//			}
		}
		else {
			System.out.println("[데이터 열람]");
		}
	}
	
    // 예외발생시 trycatch 되어있으면 어드바이스 호출되지 않음
	@AfterThrowing(pointcut="PointCutCommon.aPointcut()", throwing="exceptObj")
	public void afterThrowingPrintLog(JoinPoint jp, Exception exceptObj) {
		String methodName = jp.getSignature().getName();
		System.out.println("횡단 관심 : "+methodName+"에서 예외가 발생해서 출력되는 로그");
		System.out.println("예외 메세지 : "+exceptObj.getMessage());
	}
	
	@Around("PointCutCommon.aPointcut()")
	public Object aroundPrintLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println("around 로그 전");
		StopWatch sw=new StopWatch();
		sw.start();
		Object obj=pjp.proceed();
		sw.stop();
		String methodName=pjp.getSignature().getName();
		System.out.println(methodName+" 메서드를 수행하는데에 소요한 시간은 "+sw.getTotalTimeMillis()+"초입니다.");
		System.out.println("around 로그 후");
		return obj;
	}
}