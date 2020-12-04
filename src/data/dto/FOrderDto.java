package data.dto;

import java.sql.Timestamp;

public class FOrderDto {
	private int fordernum;
	private String forderid;
	private String fmnname;
	private String fsize;
	private String ftemp;
	private Timestamp forderdate;
	private int forderprice;
	
	public int getFordernum() {
		return fordernum;
	}
	public void setFordernum(int fordernum) {
		this.fordernum = fordernum;
	}
	public String getForderid() {
		return forderid;
	}
	public void setForderid(String forderid) {
		this.forderid = forderid;
	}
	public String getFmnname() {
		return fmnname;
	}
	public void setFmnname(String fmnname) {
		this.fmnname = fmnname;
	}
	public String getFsize() {
		return fsize;
	}
	public void setFsize(String fsize) {
		this.fsize = fsize;
	}
	public String getFtemp() {
		return ftemp;
	}
	public void setFtemp(String ftemp) {
		this.ftemp = ftemp;
	}
	public Timestamp getForderdate() {
		return forderdate;
	}
	public void setForderdate(Timestamp forderdate) {
		this.forderdate = forderdate;
	}
	public int getForderprice() {
		return forderprice;
	}
	public void setForderprice(int forderprice) {
		this.forderprice = forderprice;
	}
	
}
