package com.hyundai.handsome.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

//작성자: 김가희 , 김나형
@Data
public class QnaVO {
//    QNA ID
    private int qid;
//    멤버 아이디
    private String mid;
//    QNA 분류
    private String qcategory;
//    QNA 제목
    private String qtitle;
//    QNA 내용
    private String qcontent;
//    QNA 이미지
    private String qimage;
//    QNA 작성 일자
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date qdate;
//    QNA 답변 일자
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date qreplydate;
//    QNA 답변
    private String qreply;
//    현재 상태(답변 대기, 답변 완료)
    private String state;
}
