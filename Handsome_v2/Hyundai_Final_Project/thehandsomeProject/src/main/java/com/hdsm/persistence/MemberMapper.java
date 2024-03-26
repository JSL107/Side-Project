package com.hdsm.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.hdsm.domain.MemberAuthVO;
import com.hdsm.domain.MemberSbagDTO;
import com.hdsm.domain.MemberVO;
import com.hdsm.domain.MemberWishListDTO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;

public interface MemberMapper {

    // 회원가입
    public void insertMember(MemberVO member);

    // 회원가입때 권한관련 정보도 같이 넣어주기
    public void insertMemberAutority(MemberAuthVO auto);

    // 회원의 모든 정보(권한까지)읽어오기
    public MemberVO read(String userid);

    // 아이디 중복 확인
    public int idCheck(String memberId);

    // 아이디 중복 확인
    public int telCheck(String memberTel);

    // 로그인
    public MemberVO login(MemberVO member);

    public MemberVO pwcheck(String member);

    public MemberVO getMember(String memberId);

    //회원 장바구니 목록
    public List<MemberSbagDTO> getMembersShoppingBag(@Param("mid") String mid);

    //장바구니에 있는 물건들의 정보들 가져오기
    public ProductVO getShoppingBagsProduct(@Param("pid") String pid);

    //그물건들의 각각 colorVO 값들
    public List<ThumbnailColorVO> getProductsColor(@Param("pid") String pid);

    // 장바구니 담기
    public int insertShoppingBags(MemberSbagDTO msVO);

    // 장바구니 갯수 가져오기
    public int getShoppingBagCount(@Param("mid") String mid);

    // 장바구니 변경
    public int updateShoppingBag(MemberSbagDTO msVO);

    // 장바구니 내역 조회
    public int selectShoppingBag(MemberSbagDTO msVO);

    // 장바구니 삭제
    public int deleteShoppingBag(@Param("msList") List<MemberSbagDTO> msList);

    //위시리스트 갯수 가져오기
    public int getWishListCount(String mid);

    //위시리스트 넣기
    public int insertWishList(MemberWishListDTO wsDTO);

    //해당유저와 물건이 위시리스트에 있는지 확인
    public int isinWishList(MemberWishListDTO wsDTO);

    //해당 유저가 담아놓은 위시리스트목록들 가져오기
    public List<MemberWishListDTO> getUsersWishList(MemberWishListDTO wsDTO);

    //장바구니에 있는 물건들의 정보들 가져오기
    public ProductVO getWishListProduct(@Param("pid") String pid);

    //유저가 위시리스트 아이템 지울때
    public int deleteWishListItem(@Param("wsList") List<MemberWishListDTO> wsList);

    //유저 탈퇴
    public void deleteuser(String mid);

    //유저 권한 삭제
    public void deleteuserAuth(String username);

    //유저 권한 조회
    public String getMemberAuth(String username);

    //유저 비밀번호 변경
    public void updateuser(MemberVO mid);

    //유저의 포인트 수정
    public void updateHSpoint(MemberVO member);

    public int checkEmail(String email);
}
