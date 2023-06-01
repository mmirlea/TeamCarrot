package com.carrot.board.domain;

public class PageHandler {

	private int totalCnt; // 총 게시물 개수
	private int naviSize = 10; // 페이지 네비게이션의 크기
	private int totalPage; // 전체 페이지 개수
	private int beginPage; // 시작 페이지
	private int endPage; // 마지막 페이지
	private boolean showPrev; // 이전 버튼
	private boolean showNext; // 다음 버튼

	private SearchCondition sc;

	public PageHandler() {
	}

	public PageHandler(int totalCnt, SearchCondition sc) {
		this.totalCnt = totalCnt;
		this.sc = sc;

		doPaging(totalCnt, sc);
	}

	public void doPaging(int totalCnt, SearchCondition sc) {
		this.totalCnt = totalCnt;

		totalPage = (int) Math.ceil((double) totalCnt / sc.getPageSize());

		beginPage = (sc.getPage() - 1) / naviSize * naviSize + 1;

		endPage = Math.min(beginPage + naviSize - 1, totalPage);

		// 페이지 버튼 표시
		showPrev = beginPage != 1;
		showNext = endPage != totalPage;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getNaviSize() {
		return naviSize;
	}

	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public SearchCondition getSc() {
		return sc;
	}

	public void setSc(SearchCondition sc) {
		this.sc = sc;
	}

	@Override
	public String toString() {
		return "PageHandler [totalCnt=" + totalCnt + ", naviSize=" + naviSize + ", totalPage=" + totalPage
				+ ", beginPage=" + beginPage + ", endPage=" + endPage + ", showPrev=" + showPrev + ", showNext="
				+ showNext + ", sc=" + sc + "]";
	}

	void print() {
		System.out.println(showPrev ? "${prev}" : "");
		for (int i = beginPage; i < endPage; i++) {
			System.out.println(i + "${page} ");
		}
		System.out.println(showNext ? "${next}" : "");
	}
}
