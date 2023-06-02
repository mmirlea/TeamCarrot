package com.carrot.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchConditionM {

	private Integer page=1;
	private Integer pageSize=4;
	
	public SearchConditionM() {}

	public SearchConditionM(Integer page, Integer pageSize) {
		super();
		this.page = page;
		this.pageSize = pageSize;
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

	@Override
	public String toString() {
		return "SearchConditionM [page=" + page + ", pageSize=" + pageSize + "]";
	}
	// 페이지를 지정하지 않으면 SearchCondition의 현재 페이지를 가지고 쿼리스트링을 만드는 메서드
	public String getQueryString() {
		return getQueryString(page);
	}
	// 컨트롤러에서 검색어를 처리할 때 SearchCondtion이 계속해서 정보를 저장하면서 쿼리스트링으로 넘겨줘야 하기 때문에 
	// 이를 처리하기 위한 메서드
	// ?page=1&pageSize=10
	
	public String getQueryString(Integer page) {
		//uriComponentsBuilder : components를 생성함
		
		return UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("pageSize", pageSize)
				.build().toString();				
	}
	
	
}
