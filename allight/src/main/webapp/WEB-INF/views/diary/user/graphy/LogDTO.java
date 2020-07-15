package com.webjjang.log.dto;

import java.util.Date;

public class LogDTO {

	private String module;
	private String uri;
	private Date logDate;
	
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getUri() {
		return uri;
	}
	public void setUri(String uri) {
		this.uri = uri;
	}
	public Date getLogDate() {
		return logDate;
	}
	public void setLogDate(Date logDate) {
		this.logDate = logDate;
	}
	
	// 데이터 확인용 메서드
	@Override
	public String toString() {
		return "LogDTO [module=" + module + ", uri=" + uri + ", logDate=" + logDate + "]";
	}
	
}