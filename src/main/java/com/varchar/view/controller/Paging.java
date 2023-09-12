package com.varchar.view.controller;

public class Paging {

	public static PagingVO paging(PagingVO pagingVO) {
		System.out.println("\tLog: controller => PageAction [START]");

		int currentPage = 1;

		String currentPageStr = pagingVO.getCurrentPageStr();
		System.out.println("로그 currentPageStr: "+currentPageStr);
		//String currentPageStr = request.getParameter("page");

		try {
			if (currentPageStr != null && !currentPageStr.equals("")) {
				currentPage = Integer.parseInt(currentPageStr);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		System.out.println("로그 int currentPage: "+currentPage);
		

		final int pageSize = pagingVO.getPageSize(); // 한페이지에 보여줄 행
		final int pageBlock = 2; // 페이징에 나타날 페이지 수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 끝 페이지
		int startRnum = 0; // 시작 rnum
		int endRnum = 0; // 끝 rnum
		int totalCnt = 0; // 총 행 수
		
		totalCnt = pagingVO.getTotalCnt();
		
		int totalPageCnt = (totalCnt / pageSize) + (totalCnt % pageSize == 0 ? 0 : 1);
		if (currentPage % pageBlock == 0) {
			startPage = ((currentPage / pageBlock) - 1) * pageBlock + 1;
		} else {
			startPage = (currentPage / pageBlock) * pageBlock + 1;
		}
		endPage = startPage + pageBlock - 1;
		if (endPage > totalPageCnt) {
			endPage = totalPageCnt;
		}
		
		System.out.println("\teaLog: controller => PageAction [page: startPage: " + startPage + ", endPage: " + endPage + "]");
		
		startRnum = (currentPage - 1) * pageSize + 1;
		endRnum = startRnum + pageSize - 1;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		
		pagingVO.setStartPage(startPage);
		pagingVO.setEndPage(endPage);
		pagingVO.setTotalPageCnt(totalPageCnt);	
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setStartRnum(startRnum);
		pagingVO.setEndRnum(endRnum);
		
		System.out.println("\teaLog: controller => PageAction: [page: startRnum: " + startRnum + ", endRnum: " + endRnum + "]");
		
		System.out.println(pagingVO);
		
		return pagingVO;
		
		
	}

}
