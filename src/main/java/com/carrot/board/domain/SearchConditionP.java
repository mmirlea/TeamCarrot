package com.carrot.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchConditionP {

	private Integer page=1;
	private Integer pageSize=16;
	private String addr1="";
	private String keyword="";
	private String cate="";
	
	public SearchConditionP() {}

	
	public SearchConditionP(Integer page, Integer pageSize, String addr1, String keyword, String cate) {
		super();
		this.page = page;
		this.pageSize = pageSize;
		this.addr1 = addr1;
		this.keyword = keyword;
		this.cate = cate;
	}

	
	public String getCate() {
		return cate;
	}


	public void setCate(String cate) {
		this.cate = cate;
	}


	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	// 페이지를 지정하지 않으면 SearchCondition의 현재 페이지를 가지고 쿼리스트링을 만드는 메서드
	public String getQueryString() {
		return getQueryString(page);
	}
	// 컨트롤러에서 검색어를 처리할 때 SearchCondtion이 계속해서 정보를 저장하면서 쿼리스트링으로 넘겨줘야 하기 때문에 
	// 이를 처리하기 위한 메서드
	// ?page=1&pageSize=10&addr1="ulsanNamgu"&addr2="samsan"&cate="도서"&keyword="title"
	public String getQueryString(Integer page) {
		//uriComponentsBuilder : components를 생성함
		
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.queryParam("addr1", addr1)
				.queryParam("cate", cate)
				.queryParam("keyword", keyword)
				.build().toString();				
	}


	@Override
	public String toString() {
		return "SearchConditionP [page=" + page + ", pageSize=" + pageSize + ", addr1=" + addr1 + ", keyword=" + keyword
				+ ", cate=" + cate + "]";
	}

}
