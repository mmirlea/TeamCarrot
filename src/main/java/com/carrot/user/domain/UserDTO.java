package com.carrot.user.domain;

import org.springframework.web.multipart.MultipartFile;

public class UserDTO {
	private String m_email;
	private String m_pw;
	private String m_num;
	private String m_nicknm;
	private String m_proimg;
	private String m_ondo;
	private String m_addr1;
	private String m_addr2;
	private MultipartFile imageFile;

	
	public UserDTO() {}

	public UserDTO(String m_email, String m_pw) {
		this.m_email = m_email;
		this.m_pw = m_pw;
	}

	public UserDTO(String m_email, String m_pw, String m_num, String m_nicknm, String m_proimg, String m_addr1,
			String m_addr2, String m_ondo) {
		this.m_email = m_email;
		this.m_pw = m_pw;
		this.m_num = m_num;
		this.m_nicknm = m_nicknm;
		this.m_proimg = m_proimg;
		this.m_addr1 = m_addr1;
		this.m_addr2 = m_addr2;
		this.m_ondo = m_ondo;
	}


	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_num() {
		return m_num;
	}

	public void setM_num(String m_num) {
		this.m_num = m_num;
	}

	public String getM_nicknm() {
		return m_nicknm;
	}

	public void setM_nicknm(String m_nicknm) {
		this.m_nicknm = m_nicknm;
	}

	public String getM_proimg() {
		return m_proimg;
	}

	public void setM_proimg(String m_proimg) {
		this.m_proimg = m_proimg;
	}

	public String getM_ondo() {
		return m_ondo;
	}

	public void setM_ondo(String m_ondo) {
		this.m_ondo = m_ondo;
	}

	public String getM_addr1() {
		return m_addr1;
	}

	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}

	public String getM_addr2() {
		return m_addr2;
	}

	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}

	@Override
	public String toString() {
		return "UserDTO [m_email=" + m_email + ", m_pw=" + m_pw + ", m_num=" + m_num + ", m_nicknm=" + m_nicknm
				+ ", m_proimg=" + m_proimg + ", m_addr1=" + m_addr1 + ", m_addr2=" + m_addr2 + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((m_addr1 == null) ? 0 : m_addr1.hashCode());
		result = prime * result + ((m_addr2 == null) ? 0 : m_addr2.hashCode());
		result = prime * result + ((m_email == null) ? 0 : m_email.hashCode());
		result = prime * result + ((m_nicknm == null) ? 0 : m_nicknm.hashCode());
		result = prime * result + ((m_num == null) ? 0 : m_num.hashCode());
		result = prime * result + ((m_proimg == null) ? 0 : m_proimg.hashCode());
		result = prime * result + ((m_pw == null) ? 0 : m_pw.hashCode());
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
		UserDTO other = (UserDTO) obj;
		if (m_addr1 == null) {
			if (other.m_addr1 != null)
				return false;
		} else if (!m_addr1.equals(other.m_addr1))
			return false;
		if (m_addr2 == null) {
			if (other.m_addr2 != null)
				return false;
		} else if (!m_addr2.equals(other.m_addr2))
			return false;
		if (m_email == null) {
			if (other.m_email != null)
				return false;
		} else if (!m_email.equals(other.m_email))
			return false;
		if (m_nicknm == null) {
			if (other.m_nicknm != null)
				return false;
		} else if (!m_nicknm.equals(other.m_nicknm))
			return false;
		if (m_num == null) {
			if (other.m_num != null)
				return false;
		} else if (!m_num.equals(other.m_num))
			return false;
		if (m_proimg == null) {
			if (other.m_proimg != null)
				return false;
		} else if (!m_proimg.equals(other.m_proimg))
			return false;
		if (m_pw == null) {
			if (other.m_pw != null)
				return false;
		} else if (!m_pw.equals(other.m_pw))
			return false;
		return true;
	}

	public MultipartFile getImageFile() {
		return imageFile;
	}

	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}

}