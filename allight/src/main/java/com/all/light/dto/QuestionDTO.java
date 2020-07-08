package com.all.light.dto;

import java.util.Date;

public class QuestionDTO {
	private int qno;
	private String qtitle;
	private String qid;
	private Date qdate;
	private String qcontent;
	private int qtype;
	private int qcno;
	private String acid;
	private String qccontent;
	private Date qcdate;
	
	public int getQno() {
		return qno;
	}
	public void setQno(int qno) {
		this.qno = qno;
	}
	public String getQtitle() {
		return qtitle;
	}
	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
	}
	public String getQid() {
		return qid;
	}
	public void setQid(String qid) {
		this.qid = qid;
	}
	public Date getQdate() {
		return qdate;
	}
	public void setQdate(Date qdate) {
		this.qdate = qdate;
	}
	public String getQcontent() {
		return qcontent;
	}
	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}
	public int getQtype() {
		return qtype;
	}
	public void setQtype(int qtype) {
		this.qtype = qtype;
	}
	public int getQcno() {
		return qcno;
	}
	public void setQcno(int qcno) {
		this.qcno = qcno;
	}
	public String getAcid() {
		return acid;
	}
	public void setAcid(String acid) {
		this.acid = acid;
	}
	public String getQccontent() {
		return qccontent;
	}
	public void setQccontent(String qccontent) {
		this.qccontent = qccontent;
	}
	public Date getQcdate() {
		return qcdate;
	}
	public void setQcdate(Date qcdate) {
		this.qcdate = qcdate;
	}
	
	@Override
	public String toString() {
		return "QuestionDTO [qno=" + qno + ", qtitle=" + qtitle + ", qid=" + qid + ", qdate=" + qdate + ", qcontent="
				+ qcontent + ", qtype=" + qtype + ", qcno=" + qcno + ", acid=" + acid + ", qccontent=" + qccontent
				+ ", qcdate=" + qcdate + "]";
	}
	
	
}
