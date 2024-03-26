package com.tohome.dto;


//Written  by 미림
public class ReviewDTO {
  private int review_no;
  private int review_star;
  private String review_images_address;
  private String review_upload_date;
  private int user_user_no;
  private int product_detail_prod_no;
  private String review_write;
  private String user_id;

	public String getUser_id() {
	return user_id;
}
public void setUser_id(String user_id) {
	this.user_id = user_id;
}
	public String getReview_write() {
		return review_write;
	}
	public void setReview_write(String review_write) {
		this.review_write = review_write;
	}
	public int getReview_no() {
		return review_no;
	}
	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}
	public int getReview_star() {
		return review_star;
	}
	public void setReview_star(int review_star) {
		this.review_star = review_star;
	}
	public String getReview_images_address() {
		return review_images_address;
	}
	public void setReview_images_address(String review_images_address) {
		this.review_images_address = review_images_address;
	}
	public String getReview_upload_date() {
		return review_upload_date;
	}
	public void setReview_upload_date(String review_upload_date) {
		this.review_upload_date = review_upload_date;
	}
	public int getUser_user_no() {
		return user_user_no;
	}
	public void setUser_user_no(int user_user_no) {
		this.user_user_no = user_user_no;
	}
	public int getProduct_detail_prod_no() {
		return product_detail_prod_no;
	}
	public void setProduct_detail_prod_no(int product_detail_prod_no) {
		this.product_detail_prod_no = product_detail_prod_no;
	}
	 
  
  
}
