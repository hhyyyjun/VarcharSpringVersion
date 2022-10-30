package com.koala.biz.vo;

public class ReplyVO {
	private int rid;
	private String mid;
	private int bnum;
	private String cmsg;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public int getBnum() {
		return bnum;
	}
	public void setBnum(int bnum) {
		this.bnum = bnum;
	}
	public String getCmsg() {
		return cmsg;
	}
	public void setCmsg(String cmsg) {
		this.cmsg = cmsg;
	}
	@Override
	public String toString() {
		return "Creply [rid=" + rid + ", mid=" + mid + ", bnum=" + bnum + ", cmsg=" + cmsg + "]";
	}
	
	
}
