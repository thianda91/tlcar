package com.yxd.obj;

public class Uusers {
	private int u_uid;
	private String uloginname;
	private String uname;
	private String upwd;
	private String udept;
	private String udept2;
	private String uoffice;
	private String uphoneno;
	private String uvphone;
	private int uauthority;
	private long ulogintimes;

	public Uusers() {
		super();
	}

	public Uusers(int u_uid, String uloginname, String uname, String upwd,
			String udept, String udept2, String uoffice, String uphoneno,
			String uvphone, int uauthority, long ulogintimes) {
		super();
		this.u_uid = u_uid;
		this.uloginname = uloginname;
		this.uname = uname;
		this.upwd = upwd;
		this.udept = udept;
		this.udept2 = udept2;
		this.uoffice = uoffice;
		this.uphoneno = uphoneno;
		this.uvphone = uvphone;
		this.uauthority = uauthority;
		this.ulogintimes = ulogintimes;
	}

	public int getU_uid() {
		return u_uid;
	}

	public void setU_uid(int u_uid) {
		this.u_uid = u_uid;
	}

	public String getUloginname() {
		return uloginname;
	}

	public void setUloginname(String uloginname) {
		this.uloginname = uloginname;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpwd() {
		return upwd;
	}

	public void setUpwd(String upwd) {
		this.upwd = upwd;
	}

	public String getUdept() {
		return udept;
	}

	public void setUdept(String udept) {
		this.udept = udept;
	}

	public String getUdept2() {
		return udept2;
	}

	public void setUdept2(String udept2) {
		this.udept2 = udept2;
	}

	public String getUoffice() {
		return uoffice;
	}

	public void setUoffice(String uoffice) {
		this.uoffice = uoffice;
	}

	public String getUphoneno() {
		return uphoneno;
	}

	public void setUphoneno(String uphoneno) {
		this.uphoneno = uphoneno;
	}

	public String getUvphone() {
		return uvphone;
	}

	public void setUvphone(String uvphone) {
		this.uvphone = uvphone;
	}

	public int getUauthority() {
		return uauthority;
	}

	public void setUauthority(int uauthority) {
		this.uauthority = uauthority;
	}

	public long getUlogintimes() {
		return ulogintimes;
	}

	public void setUlogintimes(long ulogintimes) {
		this.ulogintimes = ulogintimes;
	}

	@Override
	public String toString() {
		return "Uusers [u_uid=" + u_uid + ", uloginname=" + uloginname
				+ ", uname=" + uname + ", upwd=" + upwd + ", udept=" + udept
				+ ", udept2=" + udept2 + ", uoffice=" + uoffice + ", uphoneno="
				+ uphoneno + ", uvphone=" + uvphone + ", uauthority="
				+ uauthority + ", ulogintimes=" + ulogintimes + "]";
	}

}
