package com.hdsm.persistence;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.member.MemberDTO;

public interface MemberMapper {
    public MemberDTO adminLogin(@Param("mid") String mid);

    public String read(String mid);

    public Integer countTotalUser();

    public Integer countMan();

    public Integer countWoman();
    
    public List<Map<String, Object>> ageRange();

    public Integer todayOrderCount();
    
    public Integer todayOrderSales();
    
    public List<Map<String, Object>> monthlyjoin();
}
