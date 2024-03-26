package com.tohome.controller;

import com.tohome.controller.action.*;
public class ActionFactory {
  private static ActionFactory instance = new ActionFactory();
  private ActionFactory() {
    super();
  }
  public static ActionFactory getInstance() {
    return instance;
  }

  public Action getAction(String command) {
    Action action = null;
    System.out.println("ActionFactory  :" + command);
    /* 추가된 부분 */
    if (command.equals("main")) {
      action = new MainAction();
    } else if(command.equals("login")){
        action = new LoginAction();
    } else if(command.equals("login_form")){
        action = new LoginFormAction();
    } else if(command.equals("logout")){
        action = new LogoutAction();
    } else if (command.equals("join_form")) {
        action = new JoinFormAction();
    } else if (command.equals("join")) {
        action = new JoinAction();
    } else if (command.equals("id_check_form")) {
        action = new IdCheckFormAction();
    } else if (command.equals("all_productList")) {
        action = new AllProductListAction();
    } else if (command.equals("product_detail")) {
        action = new ProductDetailAction();
    } else if(command.equals("review_delete")) {
    	action = new ReviewDeleteAction(); 
    } else if(command.equals("review_write")) {
    	action = new ReviewWriteAction();
    }else if(command.equals("fruits_vegetables_list")) {
    	action = new CategoryProductListAction();
    } else if(command.equals("grain_nuts_list")) {
    	action = new CategoryProductListAction();
    } else if(command.equals("fish_driedfish_list")) {
    	action = new CategoryProductListAction();
    } else if(command.equals("latest_productList")) {
    	action = new LatestProductListAction();
    } else if(command.equals("Listbest_productList")) {
    	action = new LatestProductListAction();
    } else if(command.equals("basket")) {
    	action = new BasketPageAction();
    } else if(command.equals("basket_insert")) {
    	action = new BasketInsertAction();
    } else if(command.equals("basket_delete")) {
    	action = new BasketDeleteAction();
    } else if(command.equals("order_page")) {
    	action = new OrderPageAction();
    } else if(command.equals("order_action")) {
    	action = new OrderAction();
    } else if(command.equals("my_page")) {
    	action = new MyPageAction();
    } else if(command.equals("my_review")) {
    	action = new MyReviewAction();
    } else if(command.equals("like_page")) {
    	action = new LikePageAction();
    } else if(command.equals("like_click")) {
    	action = new LikeAction();
    } else if(command.equals("to_chart")) {
    	action = new ChartPageAction();
    }
    
    	
    
    return action;
  }
}