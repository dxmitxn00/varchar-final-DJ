package com.varchar.biz.common;

public class Paging {

	public static PagingVO paging(PagingVO pagingVO) {
		int currentPage = 1;

		String currentPageStr = pagingVO.getCurrentPageStr();

		try {
			if (currentPageStr != null && !currentPageStr.equals("")) {
				currentPage = Integer.parseInt(currentPageStr);
			}
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		
		final int pageSize = pagingVO.getPageSize(); // 한페이지에 보여줄 행
		final int pageBlock = 2; // 페이징에 나타날 페이지 수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 끝 페이지
		int startRnum = 0; // 시작 rnum
		int endRnum = 0; // 끝 rnum
		int totalCnt = 0; // 총 행 수
		
		totalCnt = pagingVO.getTotalCnt();
		
		// 페이징 로직 시작
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
		
		startRnum = (currentPage - 1) * pageSize + 1;
		endRnum = startRnum + pageSize;
		if (endRnum > totalCnt) {
			endRnum = totalCnt;
		}
		// 페이징 로직 끝
		
		pagingVO.setStartPage(startPage);
		pagingVO.setEndPage(endPage);
		pagingVO.setTotalPageCnt(totalPageCnt);	
		pagingVO.setCurrentPage(currentPage);
		pagingVO.setStartRnum(startRnum);
		
		return pagingVO;
	}

}
