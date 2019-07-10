package com.kitri.single.sns.model;

import oracle.sql.DATE;

public class SnsDto {

	private String snsId;
	private String snsType;
	private String userId; //snsEmail과 동일
	private String snsToken;
	private String snsConnectDate;
	private String snsEmail;

	
	//우선 아래 내용은 모두 null로 입력할 예정
	private String snsNickname;
	private String snsProfile;
	private String snsAge;
	private String snsBirthday;
	private String snsName;
	private String snsGender;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getSnsType() {
		return snsType;
	}
	public void setSnsType(String snsType) {
		this.snsType = snsType;
	}
	public String getSnsToken() {
		return snsToken;
	}
	public void setSnsToken(String snsToken) {
		this.snsToken = snsToken;
	}
	public String getSnsId() {
		return snsId;
	}
	public void setSnsId(String snsId) {
		this.snsId = snsId;
	}
	public String getSnsConnectDate() {
		return snsConnectDate;
	}
	public void setSnsConnectDate(String snsConnectDate) {
		this.snsConnectDate = snsConnectDate;
	}
	public String getSnsEmail() {
		return snsEmail;
	}
	public void setSnsEmail(String snsEmail) {
		this.snsEmail = snsEmail;
	}
	public String getSnsNickname() {
		return snsNickname;
	}
	public void setSnsNickname(String snsNickname) {
		this.snsNickname = snsNickname;
	}

	public String getSnsProfile() {
		return snsProfile;
	}
	public void setSnsProfile(String snsProfile) {
		this.snsProfile = snsProfile;
	}
	public String getSnsAge() {
		return snsAge;
	}
	public void setSnsAge(String snsAge) {
		this.snsAge = snsAge;
	}
	public String getSnsBirthday() {
		return snsBirthday;
	}
	public void setSnsBirthday(String snsBirthday) {
		this.snsBirthday = snsBirthday;
	}
	public String getSnsName() {
		return snsName;
	}
	public void setSnsName(String snsName) {
		this.snsName = snsName;
	}
	public String getSnsGender() {
		return snsGender;
	}
	public void setSnsGender(String snsGender) {
		this.snsGender = snsGender;
	}
	@Override
	public String toString() {
		return "SnsDto [snsId=" + snsId + ", snsType=" + snsType + ", userId=" + userId + ", snsToken=" + snsToken
				+ ", snsConnectDate=" + snsConnectDate + ", snsEmail=" + snsEmail + ", snsNickname=" + snsNickname
				+ ", snsProfile=" + snsProfile + ", snsAge=" + snsAge + ", snsBirthday=" + snsBirthday + ", snsName="
				+ snsName + ", snsGender=" + snsGender + "]";
	}
	
	
	
	


}
