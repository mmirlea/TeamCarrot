package com.carrot.board.domain;

import org.springframework.web.multipart.MultipartFile;

import com.carrot.user.domain.UserDTO;

public class BoardDTO {

	private String b_menu;
	private Integer b_num;
	private String b_cate;
	private String b_email;
	private String b_title;
	private String b_content;
	private String b_img;
	private String b_crDate;
	private String b_upDate;
	private String b_tempSaveYn;
	private Integer b_likey;
	private String b_likeyEmail;
	private Integer b_comm;
	private Integer b_viewCnt;

	private String b_likeYN;
	private UserDTO userDTO;
	private LikeyDTO likeyDTO;

	private MultipartFile fileUpload;

	public BoardDTO() {
	}

	public BoardDTO(String b_cate, String b_email, String b_title, String b_content) {
		this.b_cate = b_cate;
		this.b_email = b_email;
		this.b_title = b_title;
		this.b_content = b_content;
	}

	public BoardDTO(String b_cate, String b_email, String b_title, String b_content, String b_tempSaveYn) {
		this.b_cate = b_cate;
		this.b_email = b_email;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_tempSaveYn = b_tempSaveYn;
	}

	public MultipartFile getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(MultipartFile fileUpload) {
		this.fileUpload = fileUpload;
	}

	public LikeyDTO getLikeyDTO() {
		return likeyDTO;
	}

	public void setLikeyDTO(LikeyDTO likeyDTO) {
		this.likeyDTO = likeyDTO;
	}

	public UserDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}

	public String getB_likeYN() {
		return b_likeYN;
	}

	public void setB_likeYN(String b_likeYN) {
		this.b_likeYN = b_likeYN;
	}

	public String getB_menu() {
		return b_menu;
	}

	public void setB_menu(String b_menu) {
		this.b_menu = b_menu;
	}

	public Integer getB_num() {
		return b_num;
	}

	public void setB_num(Integer b_num) {
		this.b_num = b_num;
	}

	public String getB_cate() {
		return b_cate;
	}

	public void setB_cate(String b_cate) {
		this.b_cate = b_cate;
	}

	public String getB_email() {
		return b_email;
	}

	public void setB_email(String b_emial) {
		this.b_email = b_emial;
	}

	public String getB_title() {
		return b_title;
	}

	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

	public String getB_content() {
		return b_content;
	}

	public void setB_content(String b_content) {
		this.b_content = b_content;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img;
	}

	public String getB_crDate() {
		return b_crDate;
	}

	public void setB_crDate(String b_crDate) {
		this.b_crDate = b_crDate;
	}

	public String getB_upDate() {
		return b_upDate;
	}

	public void setB_upDate(String b_upDate) {
		this.b_upDate = b_upDate;
	}

	public String getB_tempSaveYn() {
		return b_tempSaveYn;
	}

	public void setB_tempSaveYn(String b_tempSaveYn) {
		this.b_tempSaveYn = b_tempSaveYn;
	}

	public Integer getB_likey() {
		return b_likey;
	}

	public void setB_likey(Integer b_likey) {
		this.b_likey = b_likey;
	}

	public String getB_likeyEmail() {
		return b_likeyEmail;
	}

	public void setB_likeyEmail(String b_likeyEmail) {
		this.b_likeyEmail = b_likeyEmail;
	}

	public Integer getB_comm() {
		return b_comm;
	}

	public void setB_comm(Integer b_comm) {
		this.b_comm = b_comm;
	}

	public Integer getB_viewCnt() {
		return b_viewCnt;
	}

	public void setB_viewCnt(Integer b_viewCnt) {
		this.b_viewCnt = b_viewCnt;
	}

	@Override
	public String toString() {
		return "BoardDTO [b_menu=" + b_menu + ", b_num=" + b_num + ", b_cate=" + b_cate + ", b_email=" + b_email
				+ ", b_title=" + b_title + ", b_content=" + b_content + ", b_img=" + b_img + ", b_crDate=" + b_crDate
				+ ", b_upDate=" + b_upDate + ", b_tempSaveYn=" + b_tempSaveYn + ", b_likey=" + b_likey
				+ ", b_likeyEmail=" + b_likeyEmail + ", b_comm=" + b_comm + ", b_viewCnt=" + b_viewCnt + ", b_likeYN="
				+ b_likeYN + ", userDTO=" + userDTO + ", likeyDTO=" + likeyDTO + ", fileUpload=" + fileUpload + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((b_cate == null) ? 0 : b_cate.hashCode());
		result = prime * result + ((b_comm == null) ? 0 : b_comm.hashCode());
		result = prime * result + ((b_content == null) ? 0 : b_content.hashCode());
		result = prime * result + ((b_crDate == null) ? 0 : b_crDate.hashCode());
		result = prime * result + ((b_email == null) ? 0 : b_email.hashCode());
		result = prime * result + ((b_img == null) ? 0 : b_img.hashCode());
		result = prime * result + ((b_likey == null) ? 0 : b_likey.hashCode());
		result = prime * result + ((b_likeyEmail == null) ? 0 : b_likeyEmail.hashCode());
		result = prime * result + ((b_menu == null) ? 0 : b_menu.hashCode());
		result = prime * result + ((b_num == null) ? 0 : b_num.hashCode());
		result = prime * result + ((b_tempSaveYn == null) ? 0 : b_tempSaveYn.hashCode());
		result = prime * result + ((b_title == null) ? 0 : b_title.hashCode());
		result = prime * result + ((b_upDate == null) ? 0 : b_upDate.hashCode());
		result = prime * result + ((b_viewCnt == null) ? 0 : b_viewCnt.hashCode());
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
		BoardDTO other = (BoardDTO) obj;
		if (b_cate == null) {
			if (other.b_cate != null)
				return false;
		} else if (!b_cate.equals(other.b_cate))
			return false;
		if (b_comm == null) {
			if (other.b_comm != null)
				return false;
		} else if (!b_comm.equals(other.b_comm))
			return false;
		if (b_content == null) {
			if (other.b_content != null)
				return false;
		} else if (!b_content.equals(other.b_content))
			return false;
		if (b_crDate == null) {
			if (other.b_crDate != null)
				return false;
		} else if (!b_crDate.equals(other.b_crDate))
			return false;
		if (b_email == null) {
			if (other.b_email != null)
				return false;
		} else if (!b_email.equals(other.b_email))
			return false;
		if (b_img == null) {
			if (other.b_img != null)
				return false;
		} else if (!b_img.equals(other.b_img))
			return false;
		if (b_likey == null) {
			if (other.b_likey != null)
				return false;
		} else if (!b_likey.equals(other.b_likey))
			return false;
		if (b_likeyEmail == null) {
			if (other.b_likeyEmail != null)
				return false;
		} else if (!b_likeyEmail.equals(other.b_likeyEmail))
			return false;
		if (b_menu == null) {
			if (other.b_menu != null)
				return false;
		} else if (!b_menu.equals(other.b_menu))
			return false;
		if (b_num == null) {
			if (other.b_num != null)
				return false;
		} else if (!b_num.equals(other.b_num))
			return false;
		if (b_tempSaveYn == null) {
			if (other.b_tempSaveYn != null)
				return false;
		} else if (!b_tempSaveYn.equals(other.b_tempSaveYn))
			return false;
		if (b_title == null) {
			if (other.b_title != null)
				return false;
		} else if (!b_title.equals(other.b_title))
			return false;
		if (b_upDate == null) {
			if (other.b_upDate != null)
				return false;
		} else if (!b_upDate.equals(other.b_upDate))
			return false;
		if (b_viewCnt == null) {
			if (other.b_viewCnt != null)
				return false;
		} else if (!b_viewCnt.equals(other.b_viewCnt))
			return false;
		return true;
	}

}
