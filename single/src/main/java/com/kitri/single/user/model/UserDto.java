package com.kitri.single.user.model;

import com.kitri.single.sns.model.SnsDto;

public class UserDto {

	private String userId;
	private String userPassword;
	private String userNickname;
	private String userProfile;	
	private String userName;
	private String userBirthday;
	private String userGender;
	private String userPhone;
	private String userZipcode;
	private String userAddress;
	private String userAddressDetail;
	private String userJoindate;
	private String userOutdate;
	private String userStatecode;
	
	private SnsDto snsDto;

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(String userProfile) {
		this.userProfile = userProfile;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(String userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserZipcode() {
		return userZipcode;
	}

	public void setUserZipcode(String userZipcode) {
		this.userZipcode = userZipcode;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserAddressDetail() {
		return userAddressDetail;
	}

	public void setUserAddressDetail(String userAddressDetail) {
		this.userAddressDetail = userAddressDetail;
	}

	public String getUserJoindate() {
		return userJoindate;
	}

	public void setUserJoindate(String userJoindate) {
		this.userJoindate = userJoindate;
	}

	public String getUserOutdate() {
		return userOutdate;
	}

	public void setUserOutdate(String userOutdate) {
		this.userOutdate = userOutdate;
	}

	public String getUserStatecode() {
		return userStatecode;
	}

	public void setUserStatecode(String userStatecode) {
		this.userStatecode = userStatecode;
	}

	public SnsDto getSnsDto() {
		return snsDto;
	}

	public void setSnsDto(SnsDto snsDto) {
		this.snsDto = snsDto;
	}

	@Override
	public String toString() {
		return "UserDto [userId=" + userId + ", userPassword=" + userPassword + ", userNickname=" + userNickname
				+ ", userProfile=" + userProfile + ", userName=" + userName + ", userBirthday=" + userBirthday
				+ ", userGender=" + userGender + ", userPhone=" + userPhone + ", userZipcode=" + userZipcode
				+ ", userAddress=" + userAddress + ", userAddressDetail=" + userAddressDetail + ", userJoindate="
				+ userJoindate + ", userOutdate=" + userOutdate + ", userStatecode=" + userStatecode + ", snsDto="
				+ snsDto + "]";
	}

	
	
	
	
	


	
	
	
	
	

}
