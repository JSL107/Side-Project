package com.hdsm.service.member;

import com.hdsm.domain.member.MemberDTO;
import com.hdsm.persistence.MemberMapper;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper mapper;

    @Override
    public MemberDTO adminLogin(String mid) {
        return mapper.adminLogin(mid);
    }

    @Override
    public String read(String mid) {
        return mapper.read(mid);
    }

    @Override
    public Integer countTotalUser() {
        return mapper.countTotalUser();
    }

    @Override
    public Integer countMan() {
        return mapper.countMan();
    }

    @Override
    public Integer countWoman() {
        return mapper.countWoman();
    }

	@Override
	public List<Map<String, Object>> getAgeRange() {
		return mapper.ageRange();
	}

	@Override
	public Integer getTodayOrderCount() {
		return mapper.todayOrderCount();
	}

	@Override
	public Integer getTodayOrderSales() {		
		return mapper.todayOrderSales();
	}

	@Override
	public List<Map<String, Object>> getMonthlyjoin() {
		return mapper.monthlyjoin();
	}
}
