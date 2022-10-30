package com.koala.biz.vo;

public class BoardVO {
	private int bnum;
	private String mid;
	private String mnickname;
	private String btitle;
	private String bcontent;
	private int bcnt; // 댓글 수 
	private String bdate;
	private boolean res;			// 게시글 삭제 여부 true이면 전부삭제 false 이면 알수없음
	private int cnt; //더보기용 cnt
	


	public int getBnum() {
		return bnum;
	}

	@Override
	public String toString() {
		return "BoardVO [bnum=" + bnum + ", mid=" + mid + ", mnickname=" + mnickname + ", btitle=" + btitle
				+ ", bcontent=" + bcontent + ", bcnt=" + bcnt + ", bdate=" + bdate + ", res=" + res + ", cnt=" + cnt
				+ "]";
	}

	public void setBnum(int bnum) {
		this.bnum = bnum;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMnickname() {
		return mnickname;
	}

	public void setMnickname(String mnickname) {
		this.mnickname = mnickname;
	}

	public String getBtitle() {
		return btitle;
	}

	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}

	public String getBcontent() {
		return bcontent;
	}

	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}

	public int getBcnt() {
		return bcnt;
	}

	public void setBcnt(int bcnt) {
		this.bcnt = bcnt;
	}

	public String getBdate() {
		return bdate;
	}

	public void setBdate(String bdate) {
		this.bdate = bdate;
	}

	public boolean isRes() {
		return res;
	}

	public void setRes(boolean res) {
		this.res = res;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	}
	
	
	

