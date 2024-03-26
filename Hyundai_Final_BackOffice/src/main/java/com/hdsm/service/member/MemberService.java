package com.hdsm.service.member;

import java.util.List;
import java.util.Map;

import com.hdsm.domain.member.MemberDTO;

public interface MemberService {
    public MemberDTO adminLogin(String mid);

    public String read(String mid);
    public Integer countTotalUser();

    public Integer countMan();

    public Integer countWoman();
    
    public List<Map<String, Object>> getAgeRange();
    
    public Integer getTodayOrderCount();
    
    public Integer getTodayOrderSales();
    
    public List<Map<String, Object>> getMonthlyjoin();
}
