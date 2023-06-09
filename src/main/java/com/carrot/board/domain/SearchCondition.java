package com.carrot.board.domain;

import org.springframework.web.util.UriComponentsBuilder;

public class SearchCondition {

	private Integer page = 1;
	private Integer pageSize = 16;
	private String addr1 = "";
	private String option = "";
	private String keyword = "";

	public SearchCondition() {
	}

	public SearchCondition(Integer page, Integer pageSize, String addr1, String option, String keyword) {
		this.page = page;
		this.pageSize = pageSize;
		this.addr1 = addr1;
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

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
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

	@Override
	public String toString() {
		return "SearchCondition [page=" + page + ", pageSize=" + pageSize + ", addr1=" + addr1 + ", option=" + option
				+ ", keyword=" + keyword + "]";
	}

	// 페이지를 지정하지 않을 때 호출
	public String getQueryString() {
		return getQueryString(page);
	}

	// ex) ?page=1&pageSize=10&option=T&keyword="title"
	public String getQueryString(Integer page) {
		// uriComponentsBuilder : components를 생성함
		return UriComponentsBuilder.newInstance().queryParam("page", page).queryParam("pageSize", pageSize)
				.queryParam("addr1", addr1).queryParam("option", option).queryParam("keyword", keyword).build()
				.toString();
	}

}
