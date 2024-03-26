package com.hyundai.handsome.security.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

/**
 * @author 김찬중, 이준석
 * @since 2022.10.18
 * 
 *          <pre>
 * 수정일                     수정자                     수정내용
 * ----------     ----------       ---------------------------
 * 2022.10.18     김찬중, 이준석             최초 생성
 *          </pre>
 */

//UserDetails 객체를 구현하는 User 구현체를 상속하는 클래스(사용자 정보를 담는 역할)
public class CustomMember extends User {

    private static final long serialVersionUID = 1L;

//    회원 권한을 저장하는 메소드
    public CustomMember(String username, String password, Collection<? extends GrantedAuthority> authorities) {
        super(username, password, authorities);
    }

}
