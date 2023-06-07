package com.carrot.board.domain;

import java.util.Date;
import java.util.Objects;

public class CommentsDTO {
	private String c_menu;
	private Integer c_pnum;
	private Integer c_num;
	private Integer c_pcnum;
	private String c_email;
	private String c_content;
	private Date c_crdate;
	private Date c_update;
	
	public CommentsDTO() {}

	public CommentsDTO(Integer c_pnum, Integer c_pcnum, String c_email, String c_content) {
		this.c_pnum = c_pnum;
		this.c_pcnum = c_pcnum;
		this.c_email = c_email;
		this.c_content = c_content;
	}

	public CommentsDTO(String c_menu, Integer c_pnum, Integer c_num, Integer c_pcnum, String c_email, String c_content,
			Date c_crdate, Date c_update) {
		this.c_menu = c_menu;
		this.c_pnum = c_pnum;
		this.c_num = c_num;
		this.c_pcnum = c_pcnum;
		this.c_email = c_email;
		this.c_content = c_content;
		this.c_crdate = c_crdate;
		this.c_update = c_update;
	}

	public String getC_menu() {
		return c_menu;
	}

	public void setC_menu(String c_menu) {
		this.c_menu = c_menu;
	}

	public Integer getC_pnum() {
		return c_pnum;
	}

	public void setC_pnum(Integer c_pnum) {
		this.c_pnum = c_pnum;
	}

	public Integer getC_num() {
		return c_num;
	}

	public void setC_num(Integer c_num) {
		this.c_num = c_num;
	}

	public Integer getC_pcnum() {
		return c_pcnum;
	}

	public void setC_pcnum(Integer c_pcnum) {
		this.c_pcnum = c_pcnum;
	}

	public String getC_email() {
		return c_email;
	}

	public void setC_email(String c_email) {
		this.c_email = c_email;
	}

	public String getC_content() {
		return c_content;
	}

	public void setC_content(String c_content) {
		this.c_content = c_content;
	}

	public Date getC_crdate() {
		return c_crdate;
	}

	public void setC_crdate(Date c_crdate) {
		this.c_crdate = c_crdate;
	}

	public Date getC_update() {
		return c_update;
	}

	public void setC_update(Date c_update) {
		this.c_update = c_update;
	}

	@Override
	public String toString() {
		return "CommentsDTO [c_menu=" + c_menu + ", c_pnum=" + c_pnum + ", c_num=" + c_num + ", c_pcnum=" + c_pcnum
				+ ", c_email=" + c_email + ", c_content=" + c_content + ", c_crdate=" + c_crdate + ", c_update="
				+ c_update + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(c_content, c_crdate, c_email, c_menu, c_num, c_pcnum, c_pnum, c_update);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentsDTO other = (CommentsDTO) obj;
		return Objects.equals(c_content, other.c_content) && Objects.equals(c_crdate, other.c_crdate)
				&& Objects.equals(c_email, other.c_email) && Objects.equals(c_menu, other.c_menu)
				&& Objects.equals(c_num, other.c_num) && Objects.equals(c_pcnum, other.c_pcnum)
				&& Objects.equals(c_pnum, other.c_pnum) && Objects.equals(c_update, other.c_update);
	}
	
	
	
	
}
