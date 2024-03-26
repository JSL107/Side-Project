package com.hdsm.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.AddressVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberSbagDTOForJsp;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.MemberWishListDTOforJsp;


public interface MemberService {

    // 회원가 입
    public void insertMember(MemberVO member);

    // 아이디 중복 확인
    public int idCheck(String memberId);

    // 아이디 중복 확인
    public int telCheck(String memberTel);

    // 로그인
    public MemberVO login(MemberVO member);

    public MemberVO pwcheck(String member);

    public MemberVO getMember(String memberId);

    // 유저의 장바구니에 담긴 정보들 가져오기
    public List<MemberSbagDTOForJsp> getMemberShoppingBag(String mid);

    // 장바구니 담기
    public void insertShoppingBags(MemberSbagDTO msVO);


    // 장바구니 변경
    public int updateShoppingBag(MemberSbagDTO msVO);

    // 장바구니 내역 조회
    public int selectShoppingBag(MemberSbagDTO msVO);

    // 장바구니 삭제
    public int deleteShoppingBag(List<MemberSbagDTO> msList);

    //장바구니 개수 가져오기
    public int getShoppingBagCount(String mid);

    //위시리스트 갯수 가져오기
    public int getWishListCount(String mid);

    //위시리스트 넣기
    public int insertWishList(MemberWishListDTO wsDTO);

    //해당유저와 물건이 위시리스트에 있는지 확인
    public int isinWishList(MemberWishListDTO wsDTO);

    // 위시리스트에 목록들 가져오기
    public List<MemberWishListDTOforJsp> getUsersWishList(MemberWishListDTO wsDTO);

    //유저가 위시리스트 아이템 지울때
    public int deleteWishListItem(@Param("wsList") List<MemberWishListDTO> wsList);

    //회원 탈퇴
    public void deleteuser(String mid);

    //유저 권한 삭제
    public void deleteuserAuth(String username);

    //유저 권한 조회
    public String getMemberAuth(String username);

    //비밀번호 변경
    public void updateuser(MemberVO member);

    public List<AddressVO> getAddressList(String mid);

    public int checkEmail(String email);

}
