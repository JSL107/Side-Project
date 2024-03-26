package com.hyundai.handsome.service;

import com.hyundai.handsome.vo.MemberVO;

/**
 * MemberService
 *
 * @author 김찬중, 이준석
 * @since 10.06

 */
public interface MemberService {
// 회원 정보를 가져오기 위한 메서드
    public MemberVO selectMember(MemberVO member) throws Exception;

//    회원 가입
    public void memberJoin(MemberVO member) throws Exception;

    // 아이디 중복 검사
    public int idCheck(String mid) throws Exception;

    // 로그인
    public MemberVO memberLogin(MemberVO member) throws Exception;

//    시큐리티 적용이 이루어진 로그인
    public MemberVO memberLogin2(String mid) throws Exception;

//    회원별 마이페이지
    public MemberVO myPage(String mid) throws Exception;

   //아이디 찾기
    public MemberVO findID(MemberVO member) throws Exception;
    
//    회원 삭제
    public void deleteMember(String mid) throws Exception;
    
//    회원 수정
    public void updateMember(MemberVO member) throws Exception;

}
