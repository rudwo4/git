package spring.project.Mybatis.vo;

import java.sql.Timestamp;

public class faqVO {
	
	private int num;
	private String hostId;
	private String hostPwd;
	private String kind;
	private String subject;
	private String content;
	private int ref;
	private int ref_step;
	private int ref_level;
	private Timestamp reg_date;
	
	public faqVO() {}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public void setHostId(String hostId) {
		this.hostId = hostId;
	}
	public String getHostId() {
		return hostId;
	}
	public void setHostPwd(String hostPwd) {
		this.hostPwd = hostPwd;
	}
	public String getHostPwd() {
		return hostPwd;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getKind() {
		return kind;
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRef_step() {
		return ref_step;
	}

	public void setRef_step(int ref_step) {
		this.ref_step = ref_step;
	}

	public int getRef_level() {
		return ref_level;
	}

	public void setRef_level(int ref_level) {
		this.ref_level = ref_level;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
}
