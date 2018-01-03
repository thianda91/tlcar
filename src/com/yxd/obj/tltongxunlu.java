package com.yxd.obj;

public class tltongxunlu {

	private int txlid;
	private String txlname;
	private String txldept;
	private String txlvno;
	private String txlbno;
	private String txlphone;

	public tltongxunlu() {
		super();
	}

	public tltongxunlu(int txlid, String txlname, String txldept,
			String txlvno, String txlbno, String txlphone) {
		super();
		this.txlid = txlid;
		this.txlname = txlname;
		this.txldept = txldept;
		this.txlvno = txlvno;
		this.txlbno = txlbno;
		this.txlphone = txlphone;
	}

	public int getTxlid() {
		return txlid;
	}

	public void setTxlid(int txlid) {
		this.txlid = txlid;
	}

	public String getTxlname() {
		return txlname;
	}

	public void setTxlname(String txlname) {
		this.txlname = txlname;
	}

	public String getTxldept() {
		return txldept;
	}

	public void setTxldept(String txldept) {
		this.txldept = txldept;
	}

	public String getTxlvno() {
		return txlvno;
	}

	public void setTxlvno(String txlvno) {
		this.txlvno = txlvno;
	}

	public String getTxlbno() {
		return txlbno;
	}

	public void setTxlbno(String txlbno) {
		this.txlbno = txlbno;
	}

	public String getTxlphone() {
		return txlphone;
	}

	public void setTxlphone(String txlphone) {
		this.txlphone = txlphone;
	}

	@Override
	public String toString() {
		return "tltongxunlu [txlid=" + txlid + ", txlname=" + txlname
				+ ", txldept=" + txldept + ", txlvno=" + txlvno + ", txlbno="
				+ txlbno + ", txlphone=" + txlphone + "]";
	}

}
