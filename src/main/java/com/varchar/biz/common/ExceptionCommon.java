package com.varchar.biz.common;

public class ExceptionCommon extends Exception {

	// ------------------ member ------------------
	public void signupException() {
		System.out.println("회원가입 실패!");
	}
	
	public void updateInfoException() {
		System.out.println("회원정보변경 실패!");
	}
	
	public void updatePwException() {
		System.out.println("비밀번호변경 실패!");
	}
	
	public void selectMemberException() {
		System.out.println("해당 회원은 존재하지 않습니다!");
	}
	
	// ------------------ tea ------------------
	public void insertTeaException() {
		System.out.println("상품 추가 실패!");
	}
	
	public void updateTeaException() {
		System.out.println("상품 변경 실패!"); // 어떤 것 때문에 변경했는지?
	}
	
	public void deleteTeaException() {
		System.out.println("상품 삭제 실패!"); // 실질적으론 판매가능여부 판단 컬럼 update
	}
	
	public void selectTeaException() {
		System.out.println("존재하지 않는 상품입니다");
	}
	
	// ------------------ buy ------------------
	public void buyException() {
		System.out.println("상품 구매 실패!");
	}
	
	public void selectBuyException() {
		System.out.println("존재하지 않는 주문입니다");
	}
	
	// ------------------ buyDetail ------------------
	public void buyDetailException() {
		System.out.println("상품 구매 실패!");
	}
	
	public void selectBuyDetailException() {
		System.out.println("존재하지 않는 주문상세입니다");
	}
	
	// ------------------ payment ------------------
	public void paymentException() {
		System.out.println("상품 결제 실패!");
	}
	
	public void selectPaymentException() {
		System.out.println("존재하지 않는 결제 정보입니다");
	}
	
	// ------------------ favor ------------------
	public void insertFavorException() {
		System.out.println("상품 찜 실패!");
	}
	
	public void deleteFavorException() {
		System.out.println("상품 찜 실패!");
	}
	
	public void selectFavorException() {
		System.out.println("존재하지 않는 찜(좋아요) 정보입니다");
	}
	
	// ------------------ review ------------------
	public void insertReviewException() {
		System.out.println("후기 작성 실패!");
	}
	
	public void updateReviewException() {
		System.out.println("후기 수정 실패!"); // 어떤 것 때문에 변경했는지?
	}
	
	public void deleteReviewException() {
		System.out.println("후기 삭제 실패!"); // 실질적으론 판매가능여부 판단 컬럼 update
	}
	
	public void selectReviewException() {
		System.out.println("존재하지 않는 후기입니다");
	}
	
	// ------------------ cart ------------------
	// 장바구니는 서비스류가 아니라(DB 사용 안함) AOP 결합 불가
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
