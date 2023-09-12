package com.varchar.biz.common;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.util.StopWatch;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.varchar.biz.buy.BuyDetailVO;
import com.varchar.biz.buy.BuyVO;
import com.varchar.biz.favor.FavorVO;
import com.varchar.biz.member.MemberVO;
import com.varchar.biz.payment.PaymentVO;
import com.varchar.biz.review.ReviewVO;
import com.varchar.biz.tea.TeaVO;

@Aspect
@Component
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
	
	@Around("PointCutCommon.dPointcut()") // selectAll 메서드에 실행
	public Object aroundPrintLog(ProceedingJoinPoint pjp) throws Throwable {
		System.out.println();
		System.out.print(FONT_CYAN);
		String className = pjp.getTarget().getClass().getName();
        String methodName = pjp.getSignature().getName();
		StopWatch sw=new StopWatch();
		
		System.out.println();
		System.out.println("\t"+className);
		System.out.println("\t[ 컨트롤러 ] => "+ methodName +" [START]");
		System.out.print(RESET);
		
		sw.start();
		Object obj=pjp.proceed();
		sw.stop();
		
		System.out.println(FONT_CYAN);
		System.out.println("\t[ 컨트롤러 ] => "+ methodName +" [END]");
		System.out.println(FONT_BLUE);
		System.out.println("\t"+methodName+" 메서드 수행 소요시간: "+sw.getTotalTimeSeconds()+"초");
		System.out.println("\t"+methodName+" 메서드 수행: "+pjp);
		System.out.print(RESET);

		return obj;
	}
	
	@Before("PointCutCommon.aPointcut()") // 모든 메서드에 실행
	public void beforeLog(JoinPoint joinPoint) {
		
		System.out.println();
		System.out.print(FONT_YELLOW);
		
        String className = joinPoint.getTarget().getClass().getName();
        String methodName = joinPoint.getSignature().getName();
        
        Object[] args = joinPoint.getArgs();
        StringBuilder argsString = new StringBuilder();
        
        for (Object arg : args) {
            argsString.append(arg).append(", ");
        }
        
        if (argsString.length() > 0) {
            argsString.delete(argsString.length() - 2, argsString.length()); // Remove trailing comma and space
        }
        
        System.out.println("\t\t\t[모델 "+methodName +" ] \n\t\t\tINPUT: "+argsString);
        //System.out.println("Before method execution: " + className + "." + methodName + "(" + argsString + ")");

		System.out.print(RESET);

	}
	
	@AfterReturning(pointcut="PointCutCommon.bPointcut()", returning="returnObj") // select 메서드에 실행
	public void afterReturningLog(JoinPoint jp, Object returnObj) {
		System.out.println();
		System.out.print(FONT_GREEN);
		
		String methodName=jp.getSignature().getName();
		
		if(returnObj instanceof MemberVO) {
			MemberVO memberVO=(MemberVO)returnObj;
			System.out.println("\t\t\t[모델 memberVO "+ methodName +" ] \n\t\t\tOUTPUT: "+memberVO);
			//System.out.println(methodName +"실행 완료 memberVO: "+memberVO);
			
			if(memberVO.getMemberSearch() != null) {
				if(memberVO.getMemberSearch().equals("로그인")) {
					System.out.println("\t\t\t로그인");
//					if (memberVO.getMemberGrade().equals("ADMIN")) {
//						System.out.println("\t\t\t[관리자 입장]: "+ memberVO.getMemberName +"님");
//					} else {
//						System.out.println("\t\t\t[사용자 입장]: "+ memberVO.getMemberName +"님");
//					}
				}
				else {
					System.out.println("\t\t\t해당 회원 존재 확인");
				}
			}
			
		}
		else if(returnObj instanceof TeaVO){
			TeaVO teaVO=(TeaVO)returnObj;
			System.out.println("\t\t\t[모델 teaVO "+ methodName +" ] \n\t\t\tOUTPUT: "+teaVO);
			//System.out.println(methodName +"실행 완료 \n\tteaVO: "+teaVO);
			// 판매 가능 여부?
		}
		else if(returnObj instanceof BuyVO){
			BuyVO buyVO=(BuyVO)returnObj;
			System.out.println("\t\t\t[모델 buyVO "+ methodName +" ] \n\t\t\tOUTPUT: "+buyVO);
		}
		else if(returnObj instanceof BuyDetailVO){
			BuyDetailVO buyDetailVO=(BuyDetailVO)returnObj;
			System.out.println("\t\t\t[모델 buyDetailVO "+ methodName +" ] \n\t\t\tOUTPUT: "+buyDetailVO);
			
			if(buyDetailVO.getBuySearch() != null) {
				if(buyDetailVO.getBuySearch().equals("주문번호")) {
					System.out.println("\t\t\t해당 회원의 가장 최근 주문내역 조회");
				}
				else {
					System.out.println("\t\t\t주문내역상세(단건) 조회");
				}
			}
			
		}
		else if(returnObj instanceof PaymentVO){
			PaymentVO paymentVO=(PaymentVO)returnObj;
			System.out.println("\t\t\t[모델 paymentVO "+ methodName +" ] \n\t\t\tOUTPUT: "+paymentVO);
		}
		else if(returnObj instanceof FavorVO){
			FavorVO favorVO=(FavorVO)returnObj;
			System.out.println("\t\t\t[모델 favorVO "+ methodName +" ] \n\t\t\tOUTPUT: "+favorVO);
			System.out.println("\t\t\t해당 회원의 찜 여부 조회");
		}
		else if(returnObj instanceof ReviewVO){
			ReviewVO reviewVO=(ReviewVO)returnObj;
			System.out.println("\t\t\t[모델 reviewVO "+ methodName +" ] \n\t\t\tOUTPUT: "+reviewVO);
			
			if(reviewVO.getReviewSearch() != null) {
				if(reviewVO.getReviewSearch().equals("리뷰상세")) { 
					System.out.println("\t\t\t후기 상세 조회");
				}
				else {
					System.out.println("\t\t\t후기 확인 조회");
				}
			}
			
		}
//		else if(((List<?>)returnObj).get(0) instanceof TeaVO) {
//			System.out.println();
//		}
		else{
			System.out.println("\n\t\t[ 데이터 열람 ] \n\t\t\t"+returnObj);
		}
		System.out.print(RESET);
	}
	
    // 예외발생시 trycatch 되어있으면 어드바이스 호출되지 않음
	@AfterThrowing(pointcut="PointCutCommon.aPointcut()", throwing="exceptObj")
	public void afterThrowingPrintLog(JoinPoint jp, Exception exceptObj) {
		System.out.println();
		System.out.print(FONT_RED);
		
		String methodName = jp.getSignature().getName();
		System.out.println("횡단 관심 : "+methodName+"에서 예외 발생");
		System.out.println("예외 메세지 : "+exceptObj.getMessage());
		
		System.out.print(RESET);
	}
	
}