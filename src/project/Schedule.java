package project;

import java.sql.Date;

public class Schedule {
	private String writer; 
	private String content;
	private String title;
	private int seq; 
	private String reg_date1;
	private String reg_date2;
	
	public String getReg_date1() {
		return reg_date1;
	}
	public void setReg_date1(String reg_date1) {
		this.reg_date1 = reg_date1;
	}
	public String getReg_date2() {
		return reg_date2;
	}
	public void setReg_date2(String reg_date2) {
		this.reg_date2 = reg_date2;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
}
