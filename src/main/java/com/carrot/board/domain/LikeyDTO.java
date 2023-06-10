package com.carrot.board.domain;

public class LikeyDTO {

	private String l_menu;
	private Integer l_pbnum;
	private String l_email;

	public LikeyDTO(String l_menu, Integer l_pbnum, String l_email) {
		super();
		this.l_menu = l_menu;
		this.l_pbnum = l_pbnum;
		this.l_email = l_email;
	}

	public String getL_menu() {
		return l_menu;
	}

	public void setL_menu(String l_menu) {
		this.l_menu = l_menu;
	}

	public Integer getL_pbnum() {
		return l_pbnum;
	}

	public void setL_pbnum(Integer l_pbnum) {
		this.l_pbnum = l_pbnum;
	}

	public String getL_email() {
		return l_email;
	}

	public void setL_email(String l_email) {
		this.l_email = l_email;
	}

	@Override
	public String toString() {
		return "LikeyDTO [l_menu=" + l_menu + ", l_pbnum=" + l_pbnum + ", l_email=" + l_email + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((l_email == null) ? 0 : l_email.hashCode());
		result = prime * result + ((l_menu == null) ? 0 : l_menu.hashCode());
		result = prime * result + ((l_pbnum == null) ? 0 : l_pbnum.hashCode());
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
		LikeyDTO other = (LikeyDTO) obj;
		if (l_email == null) {
			if (other.l_email != null)
				return false;
		} else if (!l_email.equals(other.l_email))
			return false;
		if (l_menu == null) {
			if (other.l_menu != null)
				return false;
		} else if (!l_menu.equals(other.l_menu))
			return false;
		if (l_pbnum == null) {
			if (other.l_pbnum != null)
				return false;
		} else if (!l_pbnum.equals(other.l_pbnum))
			return false;
		return true;
	}

}
