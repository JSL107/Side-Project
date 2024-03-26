package com.hyundai.handsome.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.hyundai.handsome.vo.Criteria;
import com.hyundai.handsome.vo.QnaVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
        "file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
        "file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j

public class QnaMapperTest {
    @Autowired
    private QnaMapper mapper;
    
    @Test
    public void getQnaListTest() throws Exception {
        Criteria cri = new Criteria();
        cri.setPageNum(3);
        cri.setAmount(10);
        
        mapper.getQnaList(cri);
    }
    
    @Test
    public void getQnaDetailTest() throws Exception {
        int qid = 37;
        mapper.getQnaDetail(qid);
    }
    
    @Test
    public void qnaAddTest() throws Exception {
        QnaVO qna = new QnaVO();
        qna.setQid(188);
        qna.setMid("nadong");
        qna.setQcategory("기타");
        qna.setQtitle("기타문의");
        qna.setQcontent("테스트작성중");
        mapper.qnaAdd(qna);
    }
    
    @Test
    public void qnaGetTotalTest() throws Exception {
        mapper.qnaGetTotal();
    }
    
    @Test
    public void qnaModifyTest() throws Exception {
        QnaVO qna = new QnaVO();
        qna.setQid(188);
        qna.setMid("nadong");
        qna.setQcategory("기타");
        qna.setQtitle("기타문의");
        qna.setQcontent("테스트작성중");
        
        mapper.qnaModify(qna);
    }
    
    @Test
    public void qnaDeleteTest() {
        int qid = 187;
        mapper.qnaDelete(qid);
    }
    
    @Test
    public void qnaReplyAddTest() {
        int qid = 187;
        String reply = "답변완료";
        mapper.qnaReplyAdd(qid, reply);
    }
}
