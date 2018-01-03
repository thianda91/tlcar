package com.yxd.obj;

public class drivers {
	private int d_uid;
	private String driname;
	private String driphone;
	private String ddept;
	private int dricondition;

	public drivers() {
		super();
	}

	public drivers(int d_uid, String driname, String driphone, String ddept,
			int dricondition) {
		super();
		this.d_uid = d_uid;
		this.driname = driname;
		this.driphone = driphone;
		this.ddept = ddept;
		this.dricondition = dricondition;
	}

	public int getD_uid() {
		return d_uid;
	}

	public void setD_uid(int d_uid) {
		this.d_uid = d_uid;
	}

	public String getDriname() {
		return driname;
	}

	public void setDriname(String driname) {
		this.driname = driname;
	}

	public String getDriphone() {
		return driphone;
	}

	public void setDriphone(String driphone) {
		this.driphone = driphone;
	}

	public String getDdept() {
		return ddept;
	}

	public void setDdept(String ddept) {
		this.ddept = ddept;
	}

	public int getDricondition() {
		return dricondition;
	}

	public void setDricondition(int dricondition) {
		this.dricondition = dricondition;
	}

	@Override
	public String toString() {
		return "drivers [d_uid=" + d_uid + ", driname=" + driname
				+ ", driphone=" + driphone + ", ddept=" + ddept
				+ ", dricondition=" + dricondition + "]";
	}

}
