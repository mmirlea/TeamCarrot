package com.carrot.board.domain;

import java.util.Date;

public class CommentsbDTO {
	private Integer cb_pnum; //게시글 번호
	private Integer cb_num; //댓글 번호
	private Integer cb_pcnum; //부모 댓글 번호
	private String cb_email;
	private String cb_content;
	private Date cb_crdate;
	private Date cb_update;
	private String cb_nicknm;
	
	public CommentsbDTO() {}

	public CommentsbDTO(Integer cb_pnum, Integer cb_pcnum, String cb_email, String cb_content, String cb_nicknm) {
		this.cb_pnum = cb_pnum;
		this.cb_pcnum = cb_pcnum;
		this.cb_email = cb_email;
		this.cb_content = cb_content;
		this.cb_nicknm = cb_nicknm;
	}

	public CommentsbDTO(Integer cb_pnum, Integer cb_num, Integer cb_pcnum, String cb_email, String cb_content,
			Date cb_crdate, Date cb_update, String cb_nicknm) {
		this.cb_pnum = cb_pnum;
		this.cb_num = cb_num;
		this.cb_pcnum = cb_pcnum;
		this.cb_email = cb_email;
		this.cb_content = cb_content;
		this.cb_crdate = cb_crdate;
		this.cb_update = cb_update;
		this.cb_nicknm = cb_nicknm;
	}
	

	public Integer getCb_pnum() {
		return cb_pnum;
	}

	public void setCb_pnum(Integer cb_pnum) {
		this.cb_pnum = cb_pnum;
	}

	public Integer getCb_num() {
		return cb_num;
	}

	public void setCb_num(Integer cb_num) {
		this.cb_num = cb_num;
	}

	public Integer getCb_pcnum() {
		return cb_pcnum;
	}

	public void setCb_pcnum(Integer cb_pcnum) {
		this.cb_pcnum = cb_pcnum;
	}

	public String getCb_email() {
		return cb_email;
	}

	public void setCb_email(String cb_email) {
		this.cb_email = cb_email;
	}

	public String getCb_content() {
		return cb_content;
	}

	public void setCb_content(String cb_content) {
		this.cb_content = cb_content;
	}

	public Date getCb_crdate() {
		return cb_crdate;
	}

	public void setCb_crdate(Date cb_crdate) {
		this.cb_crdate = cb_crdate;
	}

	public Date getCb_update() {
		return cb_update;
	}

	public void setCb_update(Date cb_update) {
		this.cb_update = cb_update;
	}

	public String getCb_nicknm() {
		return cb_nicknm;
	}

	public void setCb_nicknm(String cb_nicknm) {
		this.cb_nicknm = cb_nicknm;
	}

	@Override
	public String toString() {
		return "Comments_PDTO [cb_pnum=" + cb_pnum + ", cb_num=" + cb_num + ", cb_pcnum=" + cb_pcnum
				+ ", cb_email=" + cb_email + ", cb_content=" + cb_content + ", cb_crdate=" + cb_crdate + ", cb_update="
				+ cb_update + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((cb_content == null) ? 0 : cb_content.hashCode());
		result = prime * result + ((cb_email == null) ? 0 : cb_email.hashCode());
		result = prime * result + ((cb_num == null) ? 0 : cb_num.hashCode());
		result = prime * result + ((cb_pcnum == null) ? 0 : cb_pcnum.hashCode());
		result = prime * result + ((cb_pnum == null) ? 0 : cb_pnum.hashCode());
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
		CommentsbDTO other = (CommentsbDTO) obj;
		if (cb_content == null) {
			if (other.cb_content != null)
				return false;
		} else if (!cb_content.equals(other.cb_content))
			return false;
		if (cb_email == null) {
			if (other.cb_email != null)
				return false;
		} else if (!cb_email.equals(other.cb_email))
			return false;
		if (cb_num == null) {
			if (other.cb_num != null)
				return false;
		} else if (!cb_num.equals(other.cb_num))
			return false;
		if (cb_pcnum == null) {
			if (other.cb_pcnum != null)
				return false;
		} else if (!cb_pcnum.equals(other.cb_pcnum))
			return false;
		if (cb_pnum == null) {
			if (other.cb_pnum != null)
				return false;
		} else if (!cb_pnum.equals(other.cb_pnum))
			return false;
		return true;
	}

	
	
}
