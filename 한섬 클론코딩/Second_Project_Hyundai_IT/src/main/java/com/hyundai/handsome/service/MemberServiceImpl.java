package com.hyundai.handsome.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hyundai.handsome.mapper.MemberMapper;
import com.hyundai.handsome.vo.MemberVO;

/**
 * MemberServiceImpl
 *
 * @author 김찬중, 이준석
 * @since 10.06

 */
@Service
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper memberMapper;

//    회원가입
    @Override
    public void memberJoin(MemberVO member) throws Exception {
        memberMapper.memberJoin(member);

    }

    // 회원 정보를 가져오기 위한 메서드
    @Override
    public MemberVO selectMember(MemberVO member) throws Exception {
        return memberMapper.selectMember(member);
    }

    // 로그인
    @Override
    public MemberVO memberLogin(MemberVO member) throws Exception {
        return memberMapper.memberLogin(member);
    }

//    시큐리티 적용이 이루어진 로그인
    @Override
    public MemberVO memberLogin2(String mid) throws Exception {
        return memberMapper.memberLogin2(mid);
    }

//    아이디 중복
    @Override
    public int idCheck(String mid) throws Exception {
        return memberMapper.idCheck(mid);
    }

//    마이페이지
    @Override
    public MemberVO myPage(String mid) throws Exception {
        return memberMapper.myPage(mid);
    }

    // 아이디 찾기
    @Override
    public MemberVO findID(MemberVO member) throws Exception {
        return memberMapper.findID(member);
    }

    // 아이디 삭제
    @Override
    public void deleteMember(String mid) throws Exception {
        memberMapper.deleteMember(mid);
    }
    //회원정보 수정
    @Override
    public void updateMember(MemberVO member) throws Exception {
        memberMapper.updateMember(member);
    }
}
