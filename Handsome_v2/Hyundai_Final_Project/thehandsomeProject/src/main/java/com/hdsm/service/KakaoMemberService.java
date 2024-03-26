package com.hdsm.service;

import com.hdsm.domain.KakaoUserDTO;


public interface KakaoMemberService {
    public void insertMember2(KakaoUserDTO kmember);

    int checkEmail(String email);

    public KakaoUserDTO login(KakaoUserDTO kmember);

    public void deleteKakaoMember(String mid);


}
