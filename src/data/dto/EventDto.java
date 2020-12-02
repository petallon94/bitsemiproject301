package data.dto;

import java.sql.Timestamp;

public class EventDto {
	private int eventnum;
	private String id;
	private String evsubject;
	private String evlistimage;
	private String evcontent;
	private String evcontentimage;
	private String evstartday;
	private String evendday;
	private int evreadcount;
	private Timestamp evwriteday;
	
	
	
	public int getEventnum() {
		return eventnum;
	}
	public void setEventnum(int eventnum) {
		this.eventnum = eventnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEvsubject() {
		return evsubject;
	}
	public void setEvsubject(String evsubject) {
		this.evsubject = evsubject;
	}
	public String getEvlistimage() {
		return evlistimage;
	}
	public void setEvlistimage(String evlistimage) {
		this.evlistimage = evlistimage;
	}
	public String getEvcontent() {
		return evcontent;
	}
	public void setEvcontent(String evcontent) {
		this.evcontent = evcontent;
	}
	public String getEvcontentimage() {
		return evcontentimage;
	}
	public void setEvcontentimage(String evcontentimage) {
		this.evcontentimage = evcontentimage;
	}
	public String getEvstartday() {
		return evstartday;
	}
	public void setEvstartday(String evstartday) {
		this.evstartday = evstartday;
	}
	public String getEvendday() {
		return evendday;
	}
	public void setEvendday(String evendday) {
		this.evendday = evendday;
	}
	public int getEvreadcount() {
		return evreadcount;
	}
	public void setEvreadcount(int evreadcount) {
		this.evreadcount = evreadcount;
	}
	public Timestamp getEvwriteday() {
		return evwriteday;
	}
	public void setEvwriteday(Timestamp evwriteday) {
		this.evwriteday = evwriteday;
	}
	
	
	
	
	
	
	
	
}
