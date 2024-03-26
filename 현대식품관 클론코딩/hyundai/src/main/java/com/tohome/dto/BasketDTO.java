package com.tohome.dto;

public class BasketDTO {
	private int basket_detail_no;
	private int sale_rate;
	private int prod_no;
	private String prod_img;
	private String prod_name;
	private int price;
	private int prod_quantity;

	public int getBasket_detail_no() {
		return basket_detail_no;
	}

	public void setBasket_detail_no(int basket_detail_no) {
		this.basket_detail_no = basket_detail_no;
	}

	public int getSale_rate() {
		return sale_rate;
	}

	public void setSale_rate(int sale_rate) {
		this.sale_rate = sale_rate;
	}

	public int getProd_no() {
		return prod_no;
	}

	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}

	public String getProd_img() {
		return prod_img;
	}

	public void setProd_img(String prod_img) {
		this.prod_img = prod_img;
	}

	public String getProd_name() {
		return prod_name;
	}

	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getProd_quantity() {
		return prod_quantity;
	}

	public void setProd_quantity(int prod_quantity) {
		this.prod_quantity = prod_quantity;
	}

}
