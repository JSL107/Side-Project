package com.tohome.dto;

public class MemberDTO {
    private int user_no;
    private String user_id;
    private String pwd;
    private String birth_ymd;

    private String user_name;
    private String mobile_num;
    private int gender;
    private String grade;
    private int sale_rate;
    private int buy_sum;


    public String getUser_id() {
        return user_id;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }
    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }
    public String getBirth_ymd() {
        return birth_ymd;
    }

    public void setBirth_ymd(String birth_ymd) {
        this.birth_ymd = birth_ymd;
    }

    public String getMobile_num() {
        return mobile_num;
    }

    public void setMobile_num(String mobile_num) {
        this.mobile_num = mobile_num;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public int getSale_rate() {
        return sale_rate;
    }

    public void setSale_rate(int sale_rate) {
        this.sale_rate = sale_rate;
    }

    public int getBuy_sum() {
        return buy_sum;
    }

    public void setBuy_sum(int buy_sum) {
        this.buy_sum = buy_sum;
    }

    public int getUser_no() {
        return user_no;
    }

    public void setUser_no(int user_no) {
        this.user_no = user_no;
    }
}
