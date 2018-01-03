package com.yxd.obj;

public class tlcars {
	private int c_uid;
	private String cno;
	private String ctype;
	private String cdept;
	private int ccondition;

	public tlcars() {
		super();
	}

	public tlcars(int c_uid, String cno, String ctype, String cdept,
			int ccondition) {
		super();
		this.c_uid = c_uid;
		this.cno = cno;
		this.ctype = ctype;
		this.cdept = cdept;
		this.ccondition = ccondition;
	}

	public int getC_uid() {
		return c_uid;
	}

	public void setC_uid(int c_uid) {
		this.c_uid = c_uid;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getCtype() {
		return ctype;
	}

	public void setCtype(String ctype) {
		this.ctype = ctype;
	}

	public String getCdept() {
		return cdept;
	}

	public void setCdept(String cdept) {
		this.cdept = cdept;
	}

	public int getCcondition() {
		return ccondition;
	}

	public void setCcondition(int ccondition) {
		this.ccondition = ccondition;
	}

	@Override
	public String toString() {
		return "tlcars [c_uid=" + c_uid + ", cno=" + cno + ", ctype=" + ctype
				+ ", cdept=" + cdept + ", ccondition=" + ccondition + "]";
	}

}
