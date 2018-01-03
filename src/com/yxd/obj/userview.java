package com.yxd.obj;

public class userview {
	private long appid;
	private String applydate;
	private String begintime;
	private String endtime;
	private String appname;
	private String appdept;
	private String appdept2;
	private String appoffice;
	private int mancount;
	private String beginpoint;
	private int range;
	private String go_to;
	private String reason;
	private String cno;
	private String driverinfo;
	private String acondition;
	private String depoption;
	private String depoption2;
	private String comoption;
	private String appoption;

	public userview() {
		super();
	}

	

	public userview(long appid, String applydate, String begintime,
			String endtime, String appname, String appdept, String appdept2,
			String appoffice, int mancount, String beginpoint, int range,
			String go_to, String reason, String cno, String driverinfo,
			String acondition, String depoption, String depoption2,
			String comoption, String appoption) {
		super();
		this.appid = appid;
		this.applydate = applydate;
		this.begintime = begintime;
		this.endtime = endtime;
		this.appname = appname;
		this.appdept = appdept;
		this.appdept2 = appdept2;
		this.appoffice = appoffice;
		this.mancount = mancount;
		this.beginpoint = beginpoint;
		this.range = range;
		this.go_to = go_to;
		this.reason = reason;
		this.cno = cno;
		this.driverinfo = driverinfo;
		this.acondition = acondition;
		this.depoption = depoption;
		this.depoption2 = depoption2;
		this.comoption = comoption;
		this.appoption = appoption;
	}



	public long getAppid() {
		return appid;
	}

	public void setAppid(long appid) {
		this.appid = appid;
	}

	public String getApplydate() {
		return applydate;
	}

	public void setApplydate(String applydate) {
		this.applydate = applydate;
	}

	public String getAppdept() {
		return appdept;
	}

	public void setAppdept(String appdept) {
		this.appdept = appdept;
	}

	public String getAppdept2() {
		return appdept2;
	}

	public void setAppdept2(String appdept2) {
		this.appdept2 = appdept2;
	}

	public String getAppoffice() {
		return appoffice;
	}

	public void setAppoffice(String appoffice) {
		this.appoffice = appoffice;
	}

	public String getBegintime() {
		return begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getAppname() {
		return appname;
	}

	public void setAppname(String appname) {
		this.appname = appname;
	}

	public int getMancount() {
		return mancount;
	}

	public void setMancount(int mancount) {
		this.mancount = mancount;
	}

	public String getBeginpoint() {
		return beginpoint;
	}

	public void setBeginpoint(String beginpoint) {
		this.beginpoint = beginpoint;
	}

	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}

	public String getGo_to() {
		return go_to;
	}

	public void setGo_to(String go_to) {
		this.go_to = go_to;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getCno() {
		return cno;
	}

	public void setCno(String cno) {
		this.cno = cno;
	}

	public String getDriverinfo() {
		return driverinfo;
	}

	public void setDriverinfo(String driverinfo) {
		this.driverinfo = driverinfo;
	}

	public String getAcondition() {
		return acondition;
	}

	public void setAcondition(String acondition) {
		this.acondition = acondition;
	}

	public String getDepoption() {
		return depoption;
	}

	public void setDepoption(String depoption) {
		this.depoption = depoption;
	}

	public String getDepoption2() {
		return depoption2;
	}

	public void setDepoption2(String depoption2) {
		this.depoption2 = depoption2;
	}

	public String getComoption() {
		return comoption;
	}

	public void setComoption(String comoption) {
		this.comoption = comoption;
	}

	public String getAppoption() {
		return appoption;
	}

	public void setAppoption(String appoption) {
		this.appoption = appoption;
	}

	@Override
	public String toString() {
		return "userview [appid=" + appid + ", applydate=" + applydate
				+ ", begintime=" + begintime + ", endtime=" + endtime
				+ ", appname=" + appname + ", appdept=" + appdept
				+ ", appdept2=" + appdept2 + ", appoffice=" + appoffice
				+ ", mancount=" + mancount + ", beginpoint=" + beginpoint
				+ ", range=" + range + ", go_to=" + go_to + ", reason="
				+ reason + ", cno=" + cno + ", driverinfo=" + driverinfo
				+ ", acondition=" + acondition + ", depoption=" + depoption
				+ ", depoption2=" + depoption2 + ", comoption=" + comoption
				+ ", appoption=" + appoption + "]";
	}

}