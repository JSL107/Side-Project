package com.hdsm.persistence;

import com.hdsm.domain.KakaoUserDTO;


public interface KakaoMemberMapper {
    public void insertMember2(KakaoUserDTO kmember);

    public KakaoUserDTO read(String userId);

    public KakaoUserDTO login(KakaoUserDTO kmember);

    public void deleteKakaoMember(String mid);


}
