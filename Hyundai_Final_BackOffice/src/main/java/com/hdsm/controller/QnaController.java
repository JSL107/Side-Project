package com.hdsm.controller;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.beans.factory.annotation.Value;

import com.hdsm.domain.qna.QnaDTO;
import com.hdsm.service.qna.QnaService;

import lombok.extern.log4j.Log4j;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;


import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@Log4j
@RequestMapping("/qna/*")
public class QnaController {
	@Value("${cool-api-key}")
	String api_key;
	@Value("${cool-api-secret}")
	String api_secret;
	
	@Autowired
	QnaService qnaservice;
	
	@Autowired
    private JavaMailSender mailSender;
	
	@RequestMapping("/qnalist")
	public String qnalist(Model model, HttpSession session) {
		List<Map<String, Object>> list = qnaservice.getQnaStatus();
		model.addAttribute("qnalist", qnaservice.getQnaList());
		if(list.size()==2) {			
			model.addAttribute("qnastatus1", list.get(0).get("COUNT"));
			model.addAttribute("qnastatus2", list.get(1).get("COUNT"));			
		}
		else if(list.size()==1) {
			if(list.get(0).get("QSTATE").equals("답변대기중")) {
				model.addAttribute("qnastatus1", list.get(0).get("COUNT"));
				model.addAttribute("qnastatus2", 0);
			}
			else {
				model.addAttribute("qnastatus2", list.get(0).get("COUNT"));
				model.addAttribute("qnastatus1", 0);
			}
		}
		else if(list.size()==0) {
			model.addAttribute("qnastatus1", 0);
			model.addAttribute("qnastatus2", 0);
		}
		
		return "qna/productqna";
	}
	
	@PostMapping("/getQuestion")
	public QnaDTO getquestion(@RequestParam("qno")String qno) {
		int qnumber = Integer.parseInt(qno);
		QnaDTO qnadto = qnaservice.getqnaRead(qnumber);
		return qnadto;		 
	}
	
	@PostMapping("/adminreply")
	@ResponseBody
	public String adminReply(@RequestBody QnaDTO qna) {
		System.out.println("답변달기 시작");
		//답변달기
		qnaservice.replyQuestion(qna);
		
		//이메일 발송
		String qcontent = qna.getQcontent();
		//문의 내용
		if(qcontent.length()>12) {
			qcontent = qcontent.substring(0,12);
			qcontent = qcontent+"...";
		}
		//답변 날짜
		Date questionDate = qna.getQdate();
		String email = qna.getQemail();
		
		MimeMessage message = mailSender.createMimeMessage();
		try {
			String text="<div class=\"\"><div class=\"aHl\"></div><div id=\":n7\" tabindex=\"-1\"></div><div id=\":oj\" class=\"ii gt\" jslog=\"20277; u014N:xr6bB; 4:W251bGwsbnVsbCxbXV0.\"><div id=\":ok\" class=\"a3s aiL \"><u></u>\r\n" + 
					"  <div>\r\n" + 
					"  <table style=\"width:760px;padding:60px 20px 30px;margin:0 auto\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
					"    <tbody>\r\n" + 
					"      <tr>\r\n" + 
					"        <td style=\"border:0;padding:0;margin:0\">\r\n" + 
					"          <table style=\"width:760px;padding:0;margin:0\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
					"            <colgroup>\r\n" + 
					"              <col style=\"width:380px\">\r\n" + 
					"              <col style=\"width:380px\">\r\n" + 
					"            </colgroup>\r\n" + 
					"            <tbody>\r\n" + 
					"              <tr>\r\n" + 
					"                <td style=\"text-align:left;border:0;padding:0 0 5px\">\r\n" + 
					"                  <a href=\"http://www.thehandsome.com\" style=\"border:0;padding:0 0 5px;margin:0\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://www.thehandsome.com&amp;source=gmail&amp;ust=1674975174992000&amp;usg=AOvVaw058atEX8_3g2h2-q95XzcE\"><img src=\"https://ci5.googleusercontent.com/proxy/X5B6mn8H3_MGqtKZlWDClYuVuxSy6HRc5spBA_THHbq91e9cmv-D07cAjtXuhdvI_Y-bOkVAy96NGuHw3mVYt0qBbgnoDp8JmCLPyWgvp9EbV_a5pfs=s0-d-e1-ft#http://www.thehandsome.com/_ui/desktop/common/images/email/logo.gif\" alt=\"thehandsome.com\" border=\"0\" class=\"CToWUd\" data-bit=\"iit\"></a>\r\n" + 
					"                </td>\r\n" + 
					"                <td style=\"text-align:right;border:0;padding:0 0 5px\">\r\n" + 
					"                  <a href=\"http://www.thehandsome.com/ko/member/login\" style=\"color:#363636;font-size:11px;line-height:11px;font-family:Dotum,sans-serif;font-weight:normal;text-decoration:none;border:0;padding:0;margin:0\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://www.thehandsome.com/ko/member/login&amp;source=gmail&amp;ust=1674975174992000&amp;usg=AOvVaw1hbgZhQ9WNWMWIriUbXBAs\">로그인</a>\r\n" + 
					"                  <span>│</span>\r\n" + 
					"                  <a href=\"http://www.thehandsome.com/ko/svcenter/submain\" style=\"color:#363636;font-size:11px;line-height:11px;font-family:Dotum,sans-serif;font-weight:normal;text-decoration:none;border:0;padding:0;margin:0\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://www.thehandsome.com/ko/svcenter/submain&amp;source=gmail&amp;ust=1674975174992000&amp;usg=AOvVaw2pPanoyqI0wxi4vWku8pic\">고객센터</a>\r\n" + 
					"                </td>\r\n" + 
					"              </tr>\r\n" + 
					"            </tbody>\r\n" + 
					"          </table>\r\n" + 
					"          <hr width=\"760px\">\r\n" + 
					"        </td>\r\n" + 
					"      </tr>\r\n" + 
					"  \r\n" + 
					"      <tr>\r\n" + 
					"        <td style=\"color:#222;font-size:28px;line-height:40px;font-family:Malgun Gothic,Dotum,sans-serif;font-weight:bold;border:0;padding:50px 0 10px;margin:0\">QnA 답변 안내</td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"        <td style=\"color:#222;font-size:14px;line-height:20px;font-family:'MalgunSemilight',sans-serif;font-weight:lighter;border:0;padding:15px 0 0;line-height:1.7em\">\r\n" + 
					"        고객님, 안녕하십니까? 더한섬닷컴을 이용해주셔서 감사합니다.<br>\r\n" + 
					"        <br>\r\n" + 
					"        <strong>고객님의 소중한 질문에 대한 답변이 등록되었습니다.</strong><br>\r\n" + 
					"        더한섬닷컴 고객님의 질문 내용을 다음과 같이 안내드립니다.			\r\n" + 
					"        </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"        <td style=\"height:50px;border:0;padding:0;margin:0\"></td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"        <td>\r\n" + 
					"          <table style=\"border-top:1px solid #414040;border-collapse:collapse;border-spacing:0;margin-bottom:30px\">\r\n" + 
					"            <tbody><tr><td><u></u>\r\n" + 
					"             \r\n" + 
					"            <u></u>\r\n" + 
					"            </td></tr></tbody><colgroup>\r\n" + 
					"              <col style=\"width:190px\">\r\n" + 
					"              <col style=\"width:190px\">\r\n" + 
					"              <col style=\"width:190px\">\r\n" + 
					"              <col style=\"width:190px\">\r\n" + 
					"            </colgroup>\r\n" + 
					"            <thead>\r\n" + 
					"              <tr>\r\n" + 
					"                <th scope=\"col\" style=\"padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#f5f5f5;font-size:12px\">전송자</th>\r\n" + 
					"                <th scope=\"col\" style=\"padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#f5f5f5;font-size:12px\">문의 내용</th>                \r\n" + 
					"                <th scope=\"col\" style=\"padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#f5f5f5;font-size:12px\">문의 날짜</th>\r\n" + 
					"                <th scope=\"col\" style=\"padding:11px 0;color:#222;font-size:11px;font-family:'MalgunSemilight',sans-serif;text-align:center;background:#f5f5f5;font-size:12px\">답변 상태</th>\r\n" + 
					"              </tr>\r\n" + 
					"            </thead>\r\n" + 
					"            <tbody>\r\n" + 
					"              <tr style=\"font-size:11px;text-align:center\">\r\n" + 
					"                <td rowspan=\"2\" style=\"padding:15px;color:#222;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:13px\">더한섬닷컴</td>\r\n" + 
					"                <td style=\"padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px\">"+qcontent+"</td>\r\n" + 
					"                <td style=\"padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px\"><span>"+questionDate+"</span></td>\r\n" + 
					"                <td style=\"padding:15px;color:#222;border-left:1px solid #e5e5e5;border-bottom:1px solid #e5e5e5;font-family:'MalgunSemilight',sans-serif;font-size:12px\"><span>답변 완료</span></td>\r\n" + 
					"                \r\n" + 
					"              </tr>\r\n" + 
					"              <tr style=\"font-size:11px;text-align:center\">\r\n" + 
					"                \r\n" + 
					"              </tr>\r\n" + 
					"            </tbody>\r\n" + 
					"          </table>\r\n" + 
					"        </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"        \r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"        <td style=\"font-size:14px;font-family:'MalgunSemilight',sans-serif;padding-bottom:40px;line-height:1.7em\">\r\n" + 
					"          <strong>수신동의 설정 변경 방법</strong><br>더한섬닷컴 마이페이지 &gt; 나의 정보관리 &gt; 개인정보 변경/탈퇴 &gt; 이메일/SMS 수신여부\r\n" + 
					"        </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"              <td style=\"font-size:12px;font-family:'MalgunSemilight',sans-serif;padding-bottom:40px;line-height:1.7em;text-align:center\">\r\n" + 
					"                  ※ 본 메일은 법령에 따른 통지 의무사항으로 메일 수신동의 여부와 관계없이 발송되는 메일입니다.\r\n" + 
					"              </td>\r\n" + 
					"          </tr>\r\n" + 
					"      <tr>\r\n" + 
					"        <td style=\"text-align:center;padding-bottom:60px\">\r\n" + 
					"          <a href=\"http://localhost:8080/\" style=\"display:inline-block;color:#fff;font-size:14px;line-height:14px;font-family:Dotum,sans-serif;font-weight:normal;text-decoration:none;background-color:#4a4a4a;border:0;padding:14px 48px;margin:0\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://thehandsome.com/ko/mypage&amp;source=gmail&amp;ust=1674975174992000&amp;usg=AOvVaw2P6iykn2Wx7ssj5ZrJzgjy\">\r\n" + 
					"            한섬 홈페이지로 이동\r\n" + 
					"          </a>\r\n" + 
					"        </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"        <td style=\"border:0;padding:0;margin:0\">\r\n" + 
					"          <table style=\"width:760px;background:#f5f5f5;padding:0;margin:0\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
					"            <colgroup>\r\n" + 
					"              <col style=\"width:10px\">\r\n" + 
					"              <col style=\"width:700px\">\r\n" + 
					"            </colgroup>\r\n" + 
					"            <tbody>\r\n" + 
					"              <tr>\r\n" + 
					"                <td style=\"color:#999;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;vertical-align:top;border:0;padding:15px 0 0 20px\">ㆍ</td>\r\n" + 
					"                <td style=\"color:#999;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;text-align:left;border:0;padding:15px 25px 0 0\">본 메일은 정보통신망 이용촉진 및 정보보호 등에 관한 법률에 근거하여 수신동의 여부와 관계없이 법적 의무사항으로 발송된 메일입니다.</td>\r\n" + 
					"              </tr>\r\n" + 
					"              <tr>\r\n" + 
					"                <td style=\"color:#999;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;vertical-align:top;border:0;padding:0 0 0 20px\">ㆍ</td>\r\n" + 
					"                <td style=\"color:#999;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;border:0;padding:0 25px 0 0\">본 메일은 발신전용 메일이므로 회신되지 않습니다. 문의사항은 고객센터를 이용해주시기 바랍니다.</td>\r\n" + 
					"              </tr>\r\n" + 
					"              <tr>\r\n" + 
					"                <td colspan=\"2\" style=\"text-align:right;border:0;padding:0 25px 15px 20px\">\r\n" + 
					"                  <a href=\"http://www.thehandsome.com/ko/svcenter/submain\" style=\"display:inline-block;color:#999;font-size:11px;line-height:11px;font-family:Dotum,sans-serif;font-weight:normal;text-align:center;text-decoration:none;background-color:#fff;border:0;border:1px solid #e3e3e3;padding:5px 10px;margin:0\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://www.thehandsome.com/ko/svcenter/submain&amp;source=gmail&amp;ust=1674975174992000&amp;usg=AOvVaw2pPanoyqI0wxi4vWku8pic\">고객센터</a>\r\n" + 
					"                </td>\r\n" + 
					"              </tr>\r\n" + 
					"            </tbody>\r\n" + 
					"          </table>\r\n" + 
					"        </td>\r\n" + 
					"      </tr>\r\n" + 
					"      <tr>\r\n" + 
					"        <td style=\"border:0;padding:0;margin:0\">\r\n" + 
					"          <table style=\"width:760px;border-top:1px solid #e3e3e3;padding:0;margin:0\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n" + 
					"              <colgroup>\r\n" + 
					"                <col style=\"width:555px\">\r\n" + 
					"                <col style=\"width:205px\">\r\n" + 
					"              </colgroup>\r\n" + 
					"            <tbody>\r\n" + 
					"              <tr>\r\n" + 
					"                <td colspan=\"2\" style=\"border:0;padding:30px 0 0 20px\">\r\n" + 
					"                  <img src=\"https://ci4.googleusercontent.com/proxy/im055-0mYfUIyNPJCeObX3qpNs6miPYH4r-xPUVk0YBvNKVo8Aqrupp87Gcw1lCTZRuQJmg22c1ISSohnc2kUHFeGkrGOwBGaf9N-sy6vXaTQH6px2Sm6aaFf3fs=s0-d-e1-ft#http://www.thehandsome.com/_ui/desktop/common/images/email/footer_logo.gif\" alt=\"thehandsome.com\" border=\"0\" class=\"CToWUd\" data-bit=\"iit\">\r\n" + 
					"                </td>\r\n" + 
					"              </tr>\r\n" + 
					"              <tr>\r\n" + 
					"                <td style=\"color:#424242;font-size:10px;line-height:18px;font-family:Malgun Gothic,Dotum,sans-serif;font-weight:normal;border:0;padding:10px 0 0 20px\">\r\n" + 
					"                  (주)한섬\r\n" + 
					"                  <span style=\"color:#e7e4d7;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;vertical-align:middle;border:0;padding:0;margin:0\">│</span>\r\n" + 
					"                  대표이사 김형종\r\n" + 
					"                  <span style=\"color:#e7e4d7;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;vertical-align:middle;border:0;padding:0;margin:0\">│</span>\r\n" + 
					"                  서울시 강남구 도산대로 523 한섬빌딩\r\n" + 
					"                  <span style=\"color:#e7e4d7;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;vertical-align:middle;border:0;padding:0;margin:0\">│</span>\r\n" + 
					"                  TEL 02.3416.2000\r\n" + 
					"                                  <span style=\"color:#e7e4d7;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;vertical-align:middle;border:0;padding:0;margin:0\">│</span>\r\n" + 
					"                                  FAX 02.516.7028\r\n" + 
					"                  <br>\r\n" + 
					"                  사업자등록번호 120-81-26337\r\n" + 
					"                  <span style=\"color:#e7e4d7;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;vertical-align:middle;border:0;padding:0;margin:0\">│</span>\r\n" + 
					"                  통신판매업신고번호 강남 제 00826호\r\n" + 
					"                  <span style=\"color:#e7e4d7;font-size:11px;line-height:18px;font-family:Dotum,sans-serif;font-weight:normal;vertical-align:middle;border:0;padding:0;margin:0\">│</span>\r\n" + 
					"                  개인정보보호책임자 윤인수\r\n" + 
					"                </td>\r\n" + 
					"                <td style=\"border:0;padding:10px 0 0 0;margin:0\">\r\n" + 
					"                  <a href=\"http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no=1208126337\" style=\"color:#999;font-size:11px;line-height:11px;font-family:Dotum,sans-serif;font-weight:normal;text-align:center;text-decoration:none;background-color:#fff;border:0;border:1px solid #e3e3e3;padding:5px 10px;margin:0\" target=\"_blank\" data-saferedirecturl=\"https://www.google.com/url?q=http://www.ftc.go.kr/info/bizinfo/communicationViewPopup.jsp?wrkr_no%3D1208126337&amp;source=gmail&amp;ust=1674975174992000&amp;usg=AOvVaw3mGJAaFK2auWV182vF26RM\">사업자정보확인</a>\r\n" + 
					"                </td>\r\n" + 
					"              </tr>\r\n" + 
					"              <tr>\r\n" + 
					"                <td colspan=\"2\" style=\"color:#363636;font-size:10px;line-height:10px;font-family:Malgun Gothic,sans-serif;font-weight:normal;text-align:left;letter-spacing:1px;border:0;padding:10px 0 0 20px;margin:0\">COPYRIGHT @ 2017 HANDSOME. ALL RIGHT RESERVED.</td>\r\n" + 
					"              </tr>\r\n" + 
					"            </tbody>\r\n" + 
					"          </table>\r\n" + 
					"        </td>\r\n" + 
					"      </tr>\r\n" + 
					"    </tbody>\r\n" + 
					"  </table><div class=\"yj6qo\"></div><div class=\"adL\">\r\n" + 
					"  \r\n" + 
					"  </div></div><div class=\"adL\">\r\n" + 
					"  \r\n" + 
					"  </div></div></div><div id=\":op\" class=\"ii gt\" style=\"display:none\"><div id=\":p5\" class=\"a3s aiL \"></div></div><div class=\"hi\"></div></div>";
			
			
			message.setSubject("[더한섬닷컴] 고객님이 질문한 QnA 답변알림 입니다");
			message.setContent(text, "text/html;charset=UTF-8");			
			message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(email));
			mailSender.send(message);
			System.out.println("성공");
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		 
		//sms발송
		String idsmsSend = qna.getQsmssend();
		if(idsmsSend.equals("Y")) {
			String phonenum = qna.getQphonenum();
			System.out.println(phonenum); 
			String sendtext = "문의 하신 QnA에 대한 답변이 등록 되었습니다.";
			Message coolsms = new Message(api_key, api_secret);
			HashMap<String, String> set = new HashMap<String, String>();
			set.put("to", phonenum); // 수신번호
			set.put("from", "01037199935"); // 발신번호
			set.put("text", sendtext); // 문자내용
			set.put("type", "sms"); // 문자 타입
			set.put("app_version", "test app 1.2");

			System.out.println(set);
			try {
				JSONObject result = coolsms.send(set); // 보내기&전송결과받기

				System.out.println(result.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
		}
		   		
		return "success";
	}
	
}
