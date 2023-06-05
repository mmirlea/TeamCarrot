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
	private Date p_crdate;
	private Date p_update;
	private String p_tempsaveyn;
	private int p_price;
	private String p_negoyn;
	private int p_likey;
	private String p_likeyemail;
	private int p_comm;
	private int p_viewcnt;
	private String p_soldoutyn;
	private String p_reserveyn;
	private String p_buyemail;
	private String p_hiddenyn;
	
	private UserDTO userDTO;
	
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
	public Date getP_crdate() {
		return p_crdate;
	}
	public void setP_crdate(Date p_crdate) {
		this.p_crdate = p_crdate;
	}
	public Date getP_update() {
		return p_update;
	}
	public void setP_update(Date p_update) {
		this.p_update = p_update;
	}
	public String getP_tempsaveyn() {
		return p_tempsaveyn;
	}
	public void setP_tempsaveyn(String p_tempsaveyn) {
		this.p_tempsaveyn = p_tempsaveyn;
	}
	public int getP_price() {
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
				+ p_buyemail + ", p_hiddenyn=" + p_hiddenyn + ", userDTO=" + userDTO + "]";
	}

	
	
}
