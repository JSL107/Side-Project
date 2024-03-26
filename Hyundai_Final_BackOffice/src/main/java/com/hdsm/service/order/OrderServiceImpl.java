package com.hdsm.service.order;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.json.JSONException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.hdsm.domain.order.Criteria;
import com.hdsm.domain.order.IamprotDTO;
import com.hdsm.domain.order.OrderUserVO;
import com.hdsm.persistence.OrderMapper;
import com.nimbusds.jose.shaded.json.JSONObject;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper ordermapper;
	    
	//아임포트
	private final String imp_key = "3208835715064343";
	private final String imp_secret = "uHBQfX3XT660UthBkJoyBAirazJEt7UOcloSGkg8DwdYpu1pYaxFwj8psfvkCI19T3exGsSK8LpLq9Hg";
	private RestTemplate restTemplate=new RestTemplate();
	private HttpHeaders headers = new HttpHeaders();
	
	private MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
	private JSONObject body = new JSONObject();
	
    private IamprotDTO getToken() throws JSONException {
        headers.setContentType(MediaType.APPLICATION_JSON);
        body.put("imp_key", imp_key);
        body.put("imp_secret", imp_secret);
        try {
        	System.out.println("1");
//            HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(body, headers);
        	HttpEntity<JSONObject> entity = new HttpEntity<JSONObject>(body, headers);
            System.out.println("2"+entity);
      
            IamprotDTO token = restTemplate.postForObject("https://api.iamport.kr/users/getToken", entity, IamprotDTO.class);
            System.out.println(token+" FULLtoken");
            return token;
        } catch (Exception e) {
            e.printStackTrace();
            
            System.out.println("gettoken에서 오류가 발생");
        }finally{
            headerAndBodyClear();
        }
        return null;
    }

    private void headerAndBodyClear(){
        headers.clear();
        body.clear();
    }
    
	@Override
	public List<OrderUserVO> getList() {
		
		return ordermapper.getOrderList();
	}
	
	@Override
    public void StatusChangeOrderUser(@Param("oid")String oid, @Param("ostatus")int ostatus) {
    	ordermapper.changeStatus(oid, ostatus);
		
    }
    
    
	//주문한 사용자의 정보를 삭제(구영모)
	@Override
	public void paymentCancleOrder(String imp_uid) {
		//주문번호를 통해 주문한 사용자의 정보를 가져온다.
//		OrderUserVO ouv= ordermapper.getOrderUserItem(oid);
							
		//주문한 사용자의 정보를 삭제한다. -> 상태를 변경한다.
//		ordermapper.deleteOrderUser(oid);
		ordermapper.paymentCancle(imp_uid);
		
		//아임포트 결제 취소 부분
//		String imp_uid = ouv.getImp_uid();
//		System.out.println(imp_uid);
		
		try {
			IamprotDTO iamproDto = getToken();
			if (iamproDto == null) {
				throw new Exception();
			}
			String token = (String) iamproDto.getResponse().get("access_token");
			System.out.println("토큰 : " + (String) iamproDto.getResponse().get("access_token"));
			headers.add("Authorization", token);
		
			map.add("imp_uid", imp_uid);
			HttpEntity<MultiValueMap<String, String>> entity = new HttpEntity<>(map, headers);
			System.out.println(entity);
			String cancle = restTemplate.postForObject("https://api.iamport.kr/payments/cancel?_token=" + token, entity,
					String.class);
			System.out.println(cancle + " full cancle");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cancleBuy가 실패 했습니다 직접 환불 바랍니다");
			throw new RuntimeException("환불에 실패 했습니다 다시시도 바랍니다");
		} finally {
			headerAndBodyClear();
		}		
	}

	@Override
	public List<Map<String, Object>> getOrderStatus() {
		return ordermapper.orderStatus();
	}

}
