package com.tohome.dto;

public class LikeDTO {
	private int prod_no;
	private String prod_img;
	private String prod_name;
	private int price;

	public int getProd_no() {
		return prod_no;
	}

	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public String getProd_img() {
		return prod_img;
	}

	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

}
