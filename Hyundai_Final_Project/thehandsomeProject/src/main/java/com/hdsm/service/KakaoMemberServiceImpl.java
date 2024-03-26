package com.hdsm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hdsm.domain.KakaoUserDTO;
import com.hdsm.persistence.KakaoMemberMapper;
import com.hdsm.persistence.MemberMapper;

import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor
public class KakaoMemberServiceImpl implements KakaoMemberService {
    @Autowired
    private KakaoMemberMapper mapper;

    @Autowired
    private MemberMapper memberMapper;


    @Override
    public void insertMember2(KakaoUserDTO kmember) {
        mapper.insertMember2(kmember);
    }

    @Override
    public int checkEmail(String email) {
        int cnt = memberMapper.checkEmail(email);
        return cnt;
    }

    @Override
    public KakaoUserDTO login(KakaoUserDTO kmember) {
        return mapper.login(kmember);
    }

    @Override
    public void deleteKakaoMember(String mid) {
        mapper.deleteKakaoMember(mid);
    }

}
