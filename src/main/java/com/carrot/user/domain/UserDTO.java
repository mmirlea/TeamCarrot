package com.carrot.user.domain;

import oracle.sql.BLOB;

public class UserDTO {
	private String mEmail;
	private String mPw; 
	private String mNum;
	private String mNicknm;
	private BLOB mProimg;
	private Number mOndo;
	private String mAddr1;
	private String mAddr2;
	
	public UserDTO() {}

	public UserDTO(String mEmail, String mPw, String mNum, String mNicknm, BLOB mProimg, Number mOndo, String mAddr1,
			String mAddr2) {
		super();
		this.mEmail = mEmail;
		this.mPw = mPw;
		this.mNum = mNum;
		this.mNicknm = mNicknm;
		this.mProimg = mProimg;
		this.mOndo = mOndo;
		this.mAddr1 = mAddr1;
		this.mAddr2 = mAddr2;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmNum() {
		return mNum;
	}

	public void setmNum(String mNum) {
		this.mNum = mNum;
	}

	public String getmNicknm() {
		return mNicknm;
	}

	public void setmNicknm(String mNicknm) {
		this.mNicknm = mNicknm;
	}

	public BLOB getmProimg() {
		return mProimg;
	}

	public void setmProimg(BLOB mProimg) {
		this.mProimg = mProimg;
	}

	public Number getmOndo() {
		return mOndo;
	}

	public void setmOndo(Number mOndo) {
		this.mOndo = mOndo;
	}

	public String getmAddr1() {
		return mAddr1;
	}

	public void setmAddr1(String mAddr1) {
		this.mAddr1 = mAddr1;
	}

	public String getmAddr2() {
		return mAddr2;
	}

	public void setmAddr2(String mAddr2) {
		this.mAddr2 = mAddr2;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((mAddr1 == null) ? 0 : mAddr1.hashCode());
		result = prime * result + ((mAddr2 == null) ? 0 : mAddr2.hashCode());
		result = prime * result + ((mEmail == null) ? 0 : mEmail.hashCode());
		result = prime * result + ((mNicknm == null) ? 0 : mNicknm.hashCode());
		result = prime * result + ((mNum == null) ? 0 : mNum.hashCode());
		result = prime * result + ((mOndo == null) ? 0 : mOndo.hashCode());
		result = prime * result + ((mProimg == null) ? 0 : mProimg.hashCode());
		result = prime * result + ((mPw == null) ? 0 : mPw.hashCode());
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
		if (mAddr1 == null) {
			if (other.mAddr1 != null)
				return false;
		} else if (!mAddr1.equals(other.mAddr1))
			return false;
		if (mAddr2 == null) {
			if (other.mAddr2 != null)
				return false;
		} else if (!mAddr2.equals(other.mAddr2))
			return false;
		if (mEmail == null) {
			if (other.mEmail != null)
				return false;
		} else if (!mEmail.equals(other.mEmail))
			return false;
		if (mNicknm == null) {
			if (other.mNicknm != null)
				return false;
		} else if (!mNicknm.equals(other.mNicknm))
			return false;
		if (mNum == null) {
			if (other.mNum != null)
				return false;
		} else if (!mNum.equals(other.mNum))
			return false;
		if (mOndo == null) {
			if (other.mOndo != null)
				return false;
		} else if (!mOndo.equals(other.mOndo))
			return false;
		if (mProimg == null) {
			if (other.mProimg != null)
				return false;
		} else if (!mProimg.equals(other.mProimg))
			return false;
		if (mPw == null) {
			if (other.mPw != null)
				return false;
		} else if (!mPw.equals(other.mPw))
			return false;
		return true;
	}
}