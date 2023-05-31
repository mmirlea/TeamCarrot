package com.carrot.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchConditionP {

	private Integer page=1;
	private Integer pageSize=16;
	private String option="";
	private String keyword="";
	
	public SearchConditionP() {}

	public SearchConditionP(Integer page, Integer pageSize, String option, String keyword) {
		
		this.page = page;
		this.pageSize = pageSize;
		this.option = option;
		this.keyword = keyword;
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

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
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
	// ?page=1&pageSize=10&option=T&keyword="title"
	public String getQueryString(Integer page) {
		//uriComponentsBuilder : components를 생성함
		
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.queryParam("opiton", option)
				.queryParam("keyword", keyword)
				.build().toString();				
	}

	@Override
	public String toString() {
		return "SearchCondition [page=" + page + ", pageSize=" + pageSize + ", option=" + option + ", keyword="
				+ keyword + "]";
	}
	
	
}
