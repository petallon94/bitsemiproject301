package data.dto;

import java.sql.Timestamp;

public class GonjiDto {
	private String gonnum;
	private String gonid;
	private String gonsubject;
	private String goncontent;
	private int gonreadcount;
	private Timestamp gonwriteday;
	
	public String getGonnum() {
		return gonnum;
	}
	public void setGonnum(String gonnum) {
		this.gonnum = gonnum;
	}
	public String getGonid() {
		return gonid;
	}
	public void setGonid(String gonid) {
		this.gonid = gonid;
	}
	public String getGonsubject() {
		return gonsubject;
	}
	public void setGonsubject(String gonsubject) {
		this.gonsubject = gonsubject;
	}
	public String getGoncontent() {
		return goncontent;
	}
	public void setGoncontent(String goncontent) {
		this.goncontent = goncontent;
	}
	public int getGonreadcount() {
		return gonreadcount;
	}
	public void setGonreadcount(int gonreadcount) {
		this.gonreadcount = gonreadcount;
	}
	public Timestamp getGonwriteday() {
		return gonwriteday;
	}
	public void setGonwriteday(Timestamp gonwriteday) {
		this.gonwriteday = gonwriteday;
	}
	
	
	

}
