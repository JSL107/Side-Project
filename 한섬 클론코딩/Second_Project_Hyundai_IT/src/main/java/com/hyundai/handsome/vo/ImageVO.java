package com.hyundai.handsome.vo;

import lombok.Data;

//작성자 : 김찬중, 이준석
@Data
public class ImageVO {
    /* 경로 */
    private String uploadPath;

    /* 파일 이름 */
    private String fileName;
    
    /* 파일 이름 */
    private String Uuid;

    /* 이벤트 id */
    private int eid;
    
    /* qna id */
    private int qid;
}
