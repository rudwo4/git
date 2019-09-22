package spring.project.Mybatis.vo;

import java.sql.Timestamp;

public class QnAVO {
	
	private int num;
	private String strId;
	private String kind;
	private String subject;
	private String content;
	private String a_content;
	private Timestamp reg_date;
	
	public QnAVO () {}
	
	public void setA_content(String a_content) {
		this.a_content = a_content;
	}
	public String getA_content() {
		return a_content;
	}
	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getStrId() {
		return strId;
	}

	public void setStrId(String strId) {
		this.strId = strId;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
} 
