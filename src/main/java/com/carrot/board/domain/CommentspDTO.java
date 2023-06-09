package com.carrot.board.domain;

import java.util.Date;

public class CommentspDTO {
	private Integer cp_pnum; //게시글 번호
	private Integer cp_num; //댓글 번호
	private Integer cp_pcnum; //부모 댓글 번호
	private String cp_email;
	private String cp_content;
	private Date cp_crdate;
	private Date cp_update;
	
	public CommentspDTO() {}

	public CommentspDTO(Integer cp_pnum, Integer cp_pcnum, String cp_email, String cp_content) {
		this.cp_pnum = cp_pnum;
		this.cp_pcnum = cp_pcnum;
		this.cp_email = cp_email;
		this.cp_content = cp_content;
	}

	public CommentspDTO(Integer cp_pnum, Integer cp_num, Integer cp_pcnum, String cp_email, String cp_content,
			Date cp_crdate, Date cp_update) {
		this.cp_pnum = cp_pnum;
		this.cp_num = cp_num;
		this.cp_pcnum = cp_pcnum;
		this.cp_email = cp_email;
		this.cp_content = cp_content;
		this.cp_crdate = cp_crdate;
		this.cp_update = cp_update;
	}
	
	public Integer getCp_pnum() {
		return cp_pnum;
	}

	public void setCp_pnum(Integer cp_pnum) {
		this.cp_pnum = cp_pnum;
	}

	public Integer getCp_num() {
		return cp_num;
	}

	public void setCp_num(Integer cp_num) {
		this.cp_num = cp_num;
	}

	public Integer getCp_pcnum() {
		return cp_pcnum;
	}

	public void setCp_pcnum(Integer cp_pcnum) {
		this.cp_pcnum = cp_pcnum;
	}

	public String getCp_email() {
		return cp_email;
	}

	public void setCp_email(String cp_email) {
		this.cp_email = cp_email;
	}

	public String getCp_content() {
		return cp_content;
	}

	public void setCp_content(String cp_content) {
		this.cp_content = cp_content;
	}

	public Date getCp_crdate() {
		return cp_crdate;
	}

	public void setCp_crdate(Date cp_crdate) {
		this.cp_crdate = cp_crdate;
	}

	public Date getCp_update() {
		return cp_update;
	}

	public void setCp_update(Date cp_update) {
		this.cp_update = cp_update;
	}

	@Override
	public String toString() {
		return "Comments_PDTO [cp_pnum=" + cp_pnum + ", cp_num=" + cp_num + ", cp_pcnum=" + cp_pcnum
				+ ", cp_email=" + cp_email + ", cp_content=" + cp_content + ", cp_crdate=" + cp_crdate + ", cp_update="
				+ cp_update + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cp_content == null) ? 0 : cp_content.hashCode());
		result = prime * result + ((cp_email == null) ? 0 : cp_email.hashCode());
		result = prime * result + ((cp_num == null) ? 0 : cp_num.hashCode());
		result = prime * result + ((cp_pcnum == null) ? 0 : cp_pcnum.hashCode());
		result = prime * result + ((cp_pnum == null) ? 0 : cp_pnum.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CommentspDTO other = (CommentspDTO) obj;
		if (cp_content == null) {
			if (other.cp_content != null)
				return false;
		} else if (!cp_content.equals(other.cp_content))
			return false;
		if (cp_email == null) {
			if (other.cp_email != null)
				return false;
		} else if (!cp_email.equals(other.cp_email))
			return false;
		if (cp_num == null) {
			if (other.cp_num != null)
				return false;
		} else if (!cp_num.equals(other.cp_num))
			return false;
		if (cp_pcnum == null) {
			if (other.cp_pcnum != null)
				return false;
		} else if (!cp_pcnum.equals(other.cp_pcnum))
			return false;
		if (cp_pnum == null) {
			if (other.cp_pnum != null)
				return false;
		} else if (!cp_pnum.equals(other.cp_pnum))
			return false;
		return true;
	}

	
	
	
	
	
}
