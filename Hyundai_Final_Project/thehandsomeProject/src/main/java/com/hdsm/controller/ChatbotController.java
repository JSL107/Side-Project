package com.hdsm.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.List;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hdsm.domain.ChatbotStyleVO;
import com.hdsm.domain.EventDTO;
import com.hdsm.domain.OrderUserVO;
import com.hdsm.domain.ProductVO;
import com.hdsm.domain.ThumbnailColorVO;
import com.hdsm.service.EventService;
import com.hdsm.service.OrderService;
import com.hdsm.service.ProductService;

import android.util.Base64;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ChatbotController{
	@Value("${clova_apiURL}")
	String apiURL;
	
	@Value("${clova_secretKey}")
	String secretKey;
	
	@Autowired
	OrderService orderservice;
	
	@Autowired
	EventService eventservice;
	
	@Autowired
	ProductService productservice;
	
	
	@GetMapping("/clova/chatbotForm")
	public String chatbotForm(HttpServletRequest request, Model model) throws Exception {
		HttpSession session = request.getSession(); // 세션
		String mid = "";
		String mname = "";
		
		if((String)session.getAttribute("member") != null) {
			mid = (String)session.getAttribute("member");
			
		}
		
		model.addAttribute("mid", mid);
		model.addAttribute("mname", request.getParameter("mname"));
		
		
		return "/clova/chatbotForm";
	}
	
	
	  @PostMapping(value = "/clova/style", produces = MediaType.APPLICATION_JSON_VALUE)
	  @ResponseBody 
	  public ResponseEntity<List<ChatbotStyleVO>> style (HttpServletRequest request, @RequestParam("style") String style) {
		  log.info("style words : " + style);
	  
		  //회원이 주문한 주문번호를 가져온다. 
		  List<ChatbotStyleVO> product = productservice.getRandomStyleList(style); 
		  log.info("size : " + product.size());
		  return new ResponseEntity<>(product, HttpStatus.OK); 
	  }
	  
	 
	@PostMapping(value = "/clova/orderlist", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<OrderUserVO> orderlist(HttpServletRequest request, @RequestParam("mid") String mid) {
		log.info("orderlist mid : " + mid);
		
		//회원이 주문한 주문번호를 가져온다.
        OrderUserVO ouv = orderservice.getRecentOrderUserVO(mid);

        //ouvl이 비어있다는 것을 알리기 위함
        if(!isStringEmpty(mid)) {
        	if(ouv == null) {
        		return new ResponseEntity<>(null, HttpStatus.OK);
        	} else {
        		return new ResponseEntity<>(ouv, HttpStatus.OK);
        	}
        }else {
        	return new ResponseEntity<>(null, HttpStatus.BAD_REQUEST);
        }
	}
	
	@PostMapping(value = "/clova/event")
	@ResponseBody
	public ResponseEntity<List<EventDTO>> event(HttpServletRequest request, @RequestParam("mid") String mid) throws Exception {
		log.info("orderlist mid : " + mid);
		
		//이벤트 번호를 가져온다.
        List<EventDTO> eventList = eventservice.getEventList();

		return new ResponseEntity<>(eventList, HttpStatus.OK);
	}
	
	@PostMapping(value = "/clova/chatbot", produces = "application/text; charset=UTF-8;")
	@ResponseBody
	public String chatbot(@RequestParam("queryin") String queryin) {
		String chatbotMessage = "";

		try {

			URL url = new URL(apiURL);

			String message = getReqMessage(queryin);
			System.out.println("##" + message);

			String encodeBase64String = makeSignature(message, secretKey);

			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("Content-Type", "application/json;UTF-8");
			con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

			// post request
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.write(message.getBytes("UTF-8"));
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();

			BufferedReader br;
			System.out.println(responseCode);
			
			if (responseCode == 200) { // Normal call
				System.out.println(con.getResponseMessage());

				BufferedReader in = new BufferedReader(
						new InputStreamReader(
								con.getInputStream(), "UTF-8"));
				String decodedString;
				while ((decodedString = in.readLine()) != null) {
					chatbotMessage = decodedString;
				}
				// chatbotMessage = decodedString;
				in.close();

			} else { // Error occurred
				chatbotMessage = con.getResponseMessage();
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		
		log.info("chatbotMessage : " + chatbotMessage);
		return chatbotMessage;
	}
	
	public static String getReqMessage(String voiceMessage) {
		String requestBody = "";
		try {
			JSONObject obj = new JSONObject();
			long timestamp = new Date().getTime();
			System.out.println("##" + timestamp);

			obj.put("version", "v2");
			obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
			//=> userId is a unique code for each chat user, not a fixed value, recommend use UUID. use different id for each user could help you to split chat history for users.
			obj.put("timestamp", timestamp);

			JSONObject bubbles_obj = new JSONObject();
			bubbles_obj.put("type", "text");

			JSONObject data_obj = new JSONObject();
			data_obj.put("description", voiceMessage);
			bubbles_obj.put("type", "text");
			bubbles_obj.put("data", data_obj);

			JSONArray bubbles_array = new JSONArray();
			bubbles_array.put(bubbles_obj);
			obj.put("bubbles", bubbles_array);
			obj.put("event", "send");

			requestBody = obj.toString();

		} catch (Exception e) {
			System.out.println("## Exception : " + e);
		}

		return requestBody;

	}

	// -------------------------------------------------------------

	public static String makeSignature(String message, String secretKey) {
		String encodeBase64String = "";
		try {
			byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

			SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
			Mac mac = Mac.getInstance("HmacSHA256");
			mac.init(signingKey);

			byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
			encodeBase64String = Base64.encodeToString(rawHmac, Base64.NO_WRAP);

			return encodeBase64String;

		} catch (Exception e) {
			System.out.println(e);
		}

		return encodeBase64String;

	}
	
	
	public static boolean isStringEmpty(String str) {
        return str == null || str.isEmpty();
    }
}