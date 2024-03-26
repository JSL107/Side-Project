package com.hyundai.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hyundai.handsome.vo.MemberVO;

import java.util.Date;

/**
 * MemberVO
 * 
 * @author 김찬중, 이준석
 * @since 10.06
 * 
 *        <pre>
 * 수정일                 수정자                         수정내용
 * ----------  ---------------    ---------------------------
 * 2022.10.06    김찬중                         최초 생성
 * 2022.10.06    이준석                         컬럼추가
 * 2022.10.07	  이준석			 로그인 테스트 케이스 생성
 *        </pre>
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberMapperTests {

	@Autowired
	private MemberMapper membermapper; // MemberMapper.java 인터페이스 의존성 주입

//	@Autowired
//	private CouponMapper couponMapper;

//	 회원가입 쿼리 테스트 메서드
//	@Test
//	public void memberJoin() throws Exception {
//		MemberVO member = new MemberVO();
//
//		member.setMid("test10"); // 회원 id
//		member.setMpassword("test10"); // 회원 비밀번호
//		member.setMname("test10"); // 회원 이름
//		member.setMemail("test10"); // 회원 메일
//		member.setMtel("test10"); // 회원 전화번호
//		member.setMaddress1("test10"); // 회원 주소
//		member.setMaddress2("test10"); // 회원 상세주소
//		member.setMaddress3("test10"); // 회원 상세주소
//
//		membermapper.memberJoin(member); // 쿼리 메서드 실행
//
//	}

//	@Test
//	public void memberLogin() throws Exception {
////		올바른 회원정보를 입력하였을 때
//		MemberVO member = new MemberVO();
//		member.setMid("test1");
//		member.setMpassword("test");
//
////		올바르지 않은 회원정보를 입력하였을 때
//		member.setMid("wrong");
//		member.setMpassword("wrong");
//
//		membermapper.memberLogin(member);
//		System.out.println("로그인 Test : " + membermapper.memberLogin(member));
//	}

	// 아이디 중복검사
//	@Test
//	public void memberIdChk() throws Exception {
//		String id = "test1"; // 존재하는 아이디
//		String id2 = "test123"; // 존재하지 않는 아이디
//		membermapper.idCheck(id);
//		membermapper.idCheck(id2);
//	}
	
	// my 페이지 접속 검사
//	@Test
//	public void myPage() throws Exception {
//		String id = "test1";
//		membermapper.myPage(id);
//	}

//	@Test
//	public void count() throws Exception{
//		String mid= "test1";
//		couponMapper.getCouponCount(mid);
//		System.out.println(couponMapper.getCouponCount(mid));
//	}

}