package com.tohome.dto;

public class OrderDTO {
	private int prod_no;
	private int prod_quantity;
	private int user_no;
	
	//기본값이 0 인 이유는 order_insert에 이 값이 들어갈때 0이면 그냥 바로구매인거고 0보다 크면 장바구니에 담긴 놈을 사는거라 
	//트리거 대신 프로시저안에서 같이 basket_detail_no와 같은 row를 delete하려고 한거임 (트리거로 해야하지만 컬럼 추가해야하고 시간이 없기때문에 일단 이렇게 처리) 
	private int basket_detail_no = 0;

	public int getBasket_detail_no() {
		return basket_detail_no;
	}

	public void setBasket_detail_no(int basket_detail_no) {
		this.basket_detail_no = basket_detail_no;
	}

	public int getProd_no() {
		return prod_no;
	}

	public void setProd_no(int prod_no) {
		this.prod_no = prod_no;
	}

	public int getProd_quantity() {
		return prod_quantity;
	}

	public void setProd_quantity(int prod_quantity) {
		this.prod_quantity = prod_quantity;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

}
