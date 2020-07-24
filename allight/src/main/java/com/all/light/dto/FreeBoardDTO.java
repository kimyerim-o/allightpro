package com.all.light.dto;

import java.sql.Date;

public class FreeBoardDTO {
	//자유게시판 DB
	private int fno;
	private String ftype;
	private String ftitle;
	private String fid;
	private String fnick;
	private Date fdate;
	private String fcontent;
	private int fhit;
	//자유게시판 댓글 DB
	private int fcno;
	private String fcid;
	private String fcnick;
	private String fccontent;
	private String fcdate;
	//자유게시판 댓글 좋아요DB
	private String flno;
	private String flid;
	private String flnick;
	
	
	public Date getFdate() {
		return fdate;
	}
	public void setFdate(Date fdate) {
		this.fdate = fdate;
	}
	public void setFcontent(String fcontent) {
		this.fcontent = fcontent;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getFtype() {
		return ftype;
	}
	public void setFtype(String ftype) {
		this.ftype = ftype;
	}
	public String getFtitle() {
		return ftitle;
	}
	public void setFtitle(String ftitle) {
		this.ftitle = ftitle;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getFnick() {
		return fnick;
	}
	public void setFnick(String fnick) {
		this.fnick = fnick;
	}
	public int getFhit() {
		return fhit;
	}
	public void setFhit(int fhit) {
		this.fhit = fhit;
	}
	public int getFcno() {
		return fcno;
	}
	public void setFcno(int fcno) {
		this.fcno = fcno;
	}
	public String getFcid() {
		return fcid;
	}
	public void setFcid(String fcid) {
		this.fcid = fcid;
	}
	public String getFcnick() {
		return fcnick;
	}
	public void setFcnick(String fcnick) {
		this.fcnick = fcnick;
	}
	public String getFccontent() {
		return fccontent;
	}
	public void setFccontent(String fccontent) {
		this.fccontent = fccontent;
	}
	public String getFcdate() {
		return fcdate;
	}
	public void setFcdate(String fcdate) {
		this.fcdate = fcdate;
	}
	public String getFlno() {
		return flno;
	}
	public void setFlno(String flno) {
		this.flno = flno;
	}
	public String getFlid() {
		return flid;
	}
	public void setFlid(String flid) {
		this.flid = flid;
	}
	public String getFlnick() {
		return flnick;
	}
	public void setFlnick(String flnick) {
		this.flnick = flnick;
	}
	@Override
	public String toString() {
		return "FreeBoardDTO [fno=" + fno + ", ftype=" + ftype + ", ftitle=" + ftitle + ", fid=" + fid + ", fnick="
				+ fnick + ", fcontent=" + fcontent + ", fhit=" + fhit + ", fcno=" + fcno + ", fcid=" + fcid
				+ ", fcnick=" + fcnick + ", fccontent=" + fccontent + ", fcdate=" + fcdate + ", flno=" + flno
				+ ", flid=" + flid + ", flnick=" + flnick + "]";
	}
}