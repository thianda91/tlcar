package com.yxd.obj;

import java.util.Date;

public class applicationtab {
	private long app_uid;
	private Date applydate;
	private int appnameid;
	private int appcount;
	private String beginpoint;
	private int range;
	private String destination;
	private String reason;
	private Date begintime;
	private Date endtime;
	private int acondition;
	private String depoption;
	private String depoption2;
	private String comoption;
	private String appoption;
	private int cuid;
	private int drid;

	public applicationtab() {
		super();
	}

	public applicationtab(long app_uid, Date applydate, int appnameid,
			int appcount, String beginpoint, int range, String destination,
			String reason, Date begintime, Date endtime, int acondition,
			String depoption, String depoption2, String comoption,
			String appoption, int cuid, int drid) {
		super();
		this.app_uid = app_uid;
		this.applydate = applydate;
		this.appnameid = appnameid;
		this.appcount = appcount;
		this.beginpoint = beginpoint;
		this.range = range;
		this.destination = destination;
		this.reason = reason;
		this.begintime = begintime;
		this.endtime = endtime;
		this.acondition = acondition;
		this.depoption = depoption;
		this.depoption2 = depoption2;
		this.comoption = comoption;
		this.appoption = appoption;
		this.cuid = cuid;
		this.drid = drid;
	}

	public long getApp_uid() {
		return app_uid;
	}

	public void setApp_uid(long app_uid) {
		this.app_uid = app_uid;
	}

	public Date getApplydate() {
		return applydate;
	}

	public void setApplydate(Date applydate) {
		this.applydate = applydate;
	}

	public int getAppnameid() {
		return appnameid;
	}

	public void setAppnameid(int appnameid) {
		this.appnameid = appnameid;
	}

	public int getAppcount() {
		return appcount;
	}

	public void setAppcount(int appcount) {
		this.appcount = appcount;
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

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Date getBegintime() {
		return begintime;
	}

	public void setBegintime(Date begintime) {
		this.begintime = begintime;
	}

	public Date getEndtime() {
		return endtime;
	}

	public void setEndtime(Date endtime) {
		this.endtime = endtime;
	}

	public int getAcondition() {
		return acondition;
	}

	public void setAcondition(int acondition) {
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

	public int getCuid() {
		return cuid;
	}

	public void setCuid(int cuid) {
		this.cuid = cuid;
	}

	public int getDrid() {
		return drid;
	}

	public void setDrid(int drid) {
		this.drid = drid;
	}

	@Override
	public String toString() {
		return "applicationtab [app_uid=" + app_uid + ", applydate="
				+ applydate + ", appnameid=" + appnameid + ", appcount="
				+ appcount + ", beginpoint=" + beginpoint + ", range=" + range
				+ ", destination=" + destination + ", reason=" + reason
				+ ", begintime=" + begintime + ", endtime=" + endtime
				+ ", acondition=" + acondition + ", depoption=" + depoption
				+ ", depoption2=" + depoption2 + ", comoption=" + comoption
				+ ", appoption=" + appoption + ", cuid=" + cuid + ", drid="
				+ drid + "]";
	}

}