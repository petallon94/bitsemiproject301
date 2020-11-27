package data.dto;

import com.sun.jmx.snmp.Timestamp;

public class OrderDto {
	private int ordernum;
	private String id;
	private String mnname;
	private String size;
	private String temp;
	private String takeout;
	private String price;
	private Timestamp orderdate;
	public int getOrdernum() {
		return ordernum;
	}
	public void setOrdernum(int ordernum) {
		this.ordernum = ordernum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMnname() {
		return mnname;
	}
	public void setMnname(String mnname) {
		this.mnname = mnname;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getTakeout() {
		return takeout;
	}
	public void setTakeout(String takeout) {
		this.takeout = takeout;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public Timestamp getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(Timestamp orderdate) {
		this.orderdate = orderdate;
	}
	
}
