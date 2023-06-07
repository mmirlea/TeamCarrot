package com.carrot.board.domain;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import com.carrot.user.domain.UserDTO;

public class ProductDTO {
	private String p_menu;
	private Integer p_num;
	private String p_cate;
	private String p_email;
	private String p_title;
	private String p_content;
	private String p_crdate;
	private String p_update;
	private String p_tempsaveyn;
	private Integer p_price;
	private String p_negoyn;
	private int p_likey;
	private String p_likeyemail;
	private int p_comm;
	private int p_viewcnt;
	private String p_soldoutyn;
	private String p_reserveyn;
	private String p_buyemail;
	private String p_hiddenyn;
	private String p_img;
	
	private UserDTO userDTO;
	
	private MultipartFile fileUpload_p;
	
	public ProductDTO() {}
	
	public ProductDTO(String p_menu, String p_cate, String p_email, String p_title, String p_content,
			String p_tempsaveyn, int p_price) {
		this.p_menu = p_menu;
		this.p_cate = p_cate;
		this.p_email = p_email;
		this.p_title = p_title;
		this.p_content = p_content;
		this.p_tempsaveyn = p_tempsaveyn;
		this.p_price = p_price;
	}


	
	public MultipartFile getFileUpload_p() {
		return fileUpload_p;
	}

	public void setFileUpload_p(MultipartFile fileUpload_p) {
		this.fileUpload_p = fileUpload_p;
	}

	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public UserDTO getUserDTO() {
		return userDTO;
	}

	public void setUserDTO(UserDTO userDTO) {
		this.userDTO = userDTO;
	}

	public String getP_menu() {
		return p_menu;
	}
	public void setP_menu(String p_menu) {
		this.p_menu = p_menu;
	}
	public Integer getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getP_cate() {
		return p_cate;
	}
	public void setP_cate(String p_cate) {
		this.p_cate = p_cate;
	}
	public String getP_email() {
		return p_email;
	}
	public void setP_email(String p_email) {
		this.p_email = p_email;
	}
	public String getP_title() {
		return p_title;
	}
	public void setP_title(String p_title) {
		this.p_title = p_title;
	}
	public String getP_content() {
		return p_content;
	}
	public void setP_content(String p_content) {
		this.p_content = p_content;
	}
	public String getP_crdate() {
		return p_crdate;
	}
	public void setP_crdate(String p_crdate) {
		this.p_crdate = p_crdate;
	}
	public String getP_update() {
		return p_update;
	}
	public void setP_update(String p_update) {
		this.p_update = p_update;
	}
	public String getP_tempsaveyn() {
		return p_tempsaveyn;
	}
	public void setP_tempsaveyn(String p_tempsaveyn) {
		this.p_tempsaveyn = p_tempsaveyn;
	}
	public Integer getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public String getP_negoyn() {
		return p_negoyn;
	}
	public void setP_negoyn(String p_negoyn) {
		this.p_negoyn = p_negoyn;
	}
	public int getP_likey() {
		return p_likey;
	}
	public void setP_likey(int p_likey) {
		this.p_likey = p_likey;
	}
	public String getP_likeyemail() {
		return p_likeyemail;
	}
	public void setP_likeyemail(String p_likeyemail) {
		this.p_likeyemail = p_likeyemail;
	}
	public int getP_comm() {
		return p_comm;
	}
	public void setP_comm(int p_comm) {
		this.p_comm = p_comm;
	}
	public int getP_viewcnt() {
		return p_viewcnt;
	}
	public void setP_viewcnt(int p_viewcnt) {
		this.p_viewcnt = p_viewcnt;
	}
	public String getP_soldoutyn() {
		return p_soldoutyn;
	}
	public void setP_soldoutyn(String p_soldoutyn) {
		this.p_soldoutyn = p_soldoutyn;
	}
	public String getP_reserveyn() {
		return p_reserveyn;
	}
	public void setP_reserveyn(String p_reserveyn) {
		this.p_reserveyn = p_reserveyn;
	}
	public String getP_buyemail() {
		return p_buyemail;
	}
	public void setP_buyemail(String p_buyemail) {
		this.p_buyemail = p_buyemail;
	}
	public String getP_hiddenyn() {
		return p_hiddenyn;
	}
	public void setP_hiddenyn(String p_hiddenyn) {
		this.p_hiddenyn = p_hiddenyn;
	}

	@Override
	public String toString() {
		return "ProductDTO [p_menu=" + p_menu + ", p_num=" + p_num + ", p_cate=" + p_cate + ", p_email=" + p_email
				+ ", p_title=" + p_title + ", p_content=" + p_content + ", p_crdate=" + p_crdate + ", p_update="
				+ p_update + ", p_tempsaveyn=" + p_tempsaveyn + ", p_price=" + p_price + ", p_negoyn=" + p_negoyn
				+ ", p_likey=" + p_likey + ", p_likeyemail=" + p_likeyemail + ", p_comm=" + p_comm + ", p_viewcnt="
				+ p_viewcnt + ", p_soldoutyn=" + p_soldoutyn + ", p_reserveyn=" + p_reserveyn + ", p_buyemail="
				+ p_buyemail + ", p_hiddenyn=" + p_hiddenyn + ", p_img=" + p_img + ", userDTO=" + userDTO
				+ ", fileUpload=" + fileUpload_p + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((fileUpload_p == null) ? 0 : fileUpload_p.hashCode());
		result = prime * result + ((p_buyemail == null) ? 0 : p_buyemail.hashCode());
		result = prime * result + ((p_cate == null) ? 0 : p_cate.hashCode());
		result = prime * result + p_comm;
		result = prime * result + ((p_content == null) ? 0 : p_content.hashCode());
		result = prime * result + ((p_crdate == null) ? 0 : p_crdate.hashCode());
		result = prime * result + ((p_email == null) ? 0 : p_email.hashCode());
		result = prime * result + ((p_hiddenyn == null) ? 0 : p_hiddenyn.hashCode());
		result = prime * result + ((p_img == null) ? 0 : p_img.hashCode());
		result = prime * result + p_likey;
		result = prime * result + ((p_likeyemail == null) ? 0 : p_likeyemail.hashCode());
		result = prime * result + ((p_menu == null) ? 0 : p_menu.hashCode());
		result = prime * result + ((p_negoyn == null) ? 0 : p_negoyn.hashCode());
		result = prime * result + ((p_num == null) ? 0 : p_num.hashCode());
		result = prime * result + ((p_price == null) ? 0 : p_price.hashCode());
		result = prime * result + ((p_reserveyn == null) ? 0 : p_reserveyn.hashCode());
		result = prime * result + ((p_soldoutyn == null) ? 0 : p_soldoutyn.hashCode());
		result = prime * result + ((p_tempsaveyn == null) ? 0 : p_tempsaveyn.hashCode());
		result = prime * result + ((p_title == null) ? 0 : p_title.hashCode());
		result = prime * result + ((p_update == null) ? 0 : p_update.hashCode());
		result = prime * result + p_viewcnt;
		result = prime * result + ((userDTO == null) ? 0 : userDTO.hashCode());
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
		ProductDTO other = (ProductDTO) obj;
		if (fileUpload_p == null) {
			if (other.fileUpload_p != null)
				return false;
		} else if (!fileUpload_p.equals(other.fileUpload_p))
			return false;
		if (p_buyemail == null) {
			if (other.p_buyemail != null)
				return false;
		} else if (!p_buyemail.equals(other.p_buyemail))
			return false;
		if (p_cate == null) {
			if (other.p_cate != null)
				return false;
		} else if (!p_cate.equals(other.p_cate))
			return false;
		if (p_comm != other.p_comm)
			return false;
		if (p_content == null) {
			if (other.p_content != null)
				return false;
		} else if (!p_content.equals(other.p_content))
			return false;
		if (p_crdate == null) {
			if (other.p_crdate != null)
				return false;
		} else if (!p_crdate.equals(other.p_crdate))
			return false;
		if (p_email == null) {
			if (other.p_email != null)
				return false;
		} else if (!p_email.equals(other.p_email))
			return false;
		if (p_hiddenyn == null) {
			if (other.p_hiddenyn != null)
				return false;
		} else if (!p_hiddenyn.equals(other.p_hiddenyn))
			return false;
		if (p_img == null) {
			if (other.p_img != null)
				return false;
		} else if (!p_img.equals(other.p_img))
			return false;
		if (p_likey != other.p_likey)
			return false;
		if (p_likeyemail == null) {
			if (other.p_likeyemail != null)
				return false;
		} else if (!p_likeyemail.equals(other.p_likeyemail))
			return false;
		if (p_menu == null) {
			if (other.p_menu != null)
				return false;
		} else if (!p_menu.equals(other.p_menu))
			return false;
		if (p_negoyn == null) {
			if (other.p_negoyn != null)
				return false;
		} else if (!p_negoyn.equals(other.p_negoyn))
			return false;
		if (p_num == null) {
			if (other.p_num != null)
				return false;
		} else if (!p_num.equals(other.p_num))
			return false;
		if (p_price == null) {
			if (other.p_price != null)
				return false;
		} else if (!p_price.equals(other.p_price))
			return false;
		if (p_reserveyn == null) {
			if (other.p_reserveyn != null)
				return false;
		} else if (!p_reserveyn.equals(other.p_reserveyn))
			return false;
		if (p_soldoutyn == null) {
			if (other.p_soldoutyn != null)
				return false;
		} else if (!p_soldoutyn.equals(other.p_soldoutyn))
			return false;
		if (p_tempsaveyn == null) {
			if (other.p_tempsaveyn != null)
				return false;
		} else if (!p_tempsaveyn.equals(other.p_tempsaveyn))
			return false;
		if (p_title == null) {
			if (other.p_title != null)
				return false;
		} else if (!p_title.equals(other.p_title))
			return false;
		if (p_update == null) {
			if (other.p_update != null)
				return false;
		} else if (!p_update.equals(other.p_update))
			return false;
		if (p_viewcnt != other.p_viewcnt)
			return false;
		if (userDTO == null) {
			if (other.userDTO != null)
				return false;
		} else if (!userDTO.equals(other.userDTO))
			return false;
		return true;
	}


}
