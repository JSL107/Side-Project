package com.hdsm.util;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;

import lombok.Builder;
import lombok.extern.log4j.Log4j;

@Builder
@Log4j
public class ProductUtil {
	public String getURLDecode(String url) throws UnsupportedEncodingException {
	    if (url == null) {
	        return null;
	    }
	    return URLDecoder.decode(url, "UTF-8");
	}
	public String[] getCategoryName(String ctg) {
		String[] categoryNames = new String[3];
		
		//여성
		if(ctg.equals("we")){categoryNames[0]="여성";}
		//여성 > 아우터
		else if( ctg.equals("we01")) {categoryNames[0]="여성"; categoryNames[1]="아우터";}
		else if( ctg.equals("we011")) { categoryNames[0]="여성"; categoryNames[1]="아우터";categoryNames[2]="재킷";}
		else if( ctg.equals("we012")) { categoryNames[0]="여성"; categoryNames[1]="아우터";categoryNames[2]="점퍼";}
		else if( ctg.equals("we013")) { categoryNames[0]="여성"; categoryNames[1]="아우터";categoryNames[2]="가디건/베스트";}
		else if( ctg.equals("we014")) { categoryNames[0]="여성"; categoryNames[1]="아우터";categoryNames[2]="트렌치 코트";}
		else if( ctg.equals("we015")) { categoryNames[0]="여성"; categoryNames[1]="아우터";categoryNames[2]="코트";}
		else if( ctg.equals("we016")) { categoryNames[0]="여성"; categoryNames[1]="아우터";categoryNames[2]="다운/패딩";}
		//여성 > 탑		
		else if( ctg.equals("we02")) {categoryNames[0]="여성"; categoryNames[1]="탑";}
		else if( ctg.equals("we021")) { categoryNames[0]="여성"; categoryNames[1]="탑";categoryNames[2]="티셔츠";}
		else if( ctg.equals("we022")) { categoryNames[0]="여성"; categoryNames[1]="탑";categoryNames[2]="블라우스";}
		else if( ctg.equals("we023")) { categoryNames[0]="여성"; categoryNames[1]="탑";categoryNames[2]="셔츠";}
		else if( ctg.equals("we024")) { categoryNames[0]="여성"; categoryNames[1]="탑";categoryNames[2]="니트";}
		//여성 > 드레스
		else if( ctg.equals("we03")) {categoryNames[0]="여성"; categoryNames[1]="드레스";}
		else if( ctg.equals("we031")) { categoryNames[0]="여성"; categoryNames[1]="드레스";categoryNames[2]="미니 드레스";}
		else if( ctg.equals("we032")) { categoryNames[0]="여성"; categoryNames[1]="드레스";categoryNames[2]="미디 드레스";}
		else if( ctg.equals("we033")) { categoryNames[0]="여성"; categoryNames[1]="드레스";categoryNames[2]="롱/맥시 드레스";}
		//여성 > 팬츠
		else if( ctg.equals("we04")) {categoryNames[0]="여성"; categoryNames[1]="팬츠";}
		else if( ctg.equals("we041")) { categoryNames[0]="여성"; categoryNames[1]="팬츠";categoryNames[2]="캐주얼";}
		else if( ctg.equals("we042")) { categoryNames[0]="여성"; categoryNames[1]="팬츠";categoryNames[2]="포멀";}
		else if( ctg.equals("we043")) { categoryNames[0]="여성"; categoryNames[1]="팬츠";categoryNames[2]="데님";}
		else if( ctg.equals("we044")) { categoryNames[0]="여성"; categoryNames[1]="팬츠";categoryNames[2]="쇼츠";}
		//여성 > 스커트
		else if( ctg.equals("we05")) {categoryNames[0]="여성"; categoryNames[1]="스커트";}
		else if( ctg.equals("we051")) { categoryNames[0]="여성"; categoryNames[1]="스커트";categoryNames[2]="미니 스커트";}
		else if( ctg.equals("we052")) { categoryNames[0]="여성"; categoryNames[1]="스커트";categoryNames[2]="펜슬 스커트";}
		else if( ctg.equals("we053")) { categoryNames[0]="여성"; categoryNames[1]="스커트";categoryNames[2]="플레어 스커트";}
		else if( ctg.equals("we054")) { categoryNames[0]="여성"; categoryNames[1]="스커트";categoryNames[2]="롱/맥시 스커트";}		
		
		//남성
		else if(ctg.equals("me")){categoryNames[0]="남성";}
		//남성 > 아우터
		else if( ctg.equals("me01")) {categoryNames[0]="남성"; categoryNames[1]="아우터";}
		else if( ctg.equals("me011")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="재킷";}
		else if( ctg.equals("me012")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="점퍼";}
		else if( ctg.equals("me013")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="가디건/베스트";}
		else if( ctg.equals("me014")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="트렌치코트";}
		else if( ctg.equals("me015")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="코트";}
		else if( ctg.equals("me016")) { categoryNames[0]="남성"; categoryNames[1]="아우터";categoryNames[2]="다운/패딩";}
		//남성 > 탑		
		else if( ctg.equals("me02")) {categoryNames[0]="남성"; categoryNames[1]="탑";}
		else if( ctg.equals("me021")) { categoryNames[0]="남성"; categoryNames[1]="탑";categoryNames[2]="티셔츠";}
		else if( ctg.equals("me022")) { categoryNames[0]="남성"; categoryNames[1]="탑";categoryNames[2]="셔츠";}
		else if( ctg.equals("me023")) { categoryNames[0]="남성"; categoryNames[1]="탑";categoryNames[2]="니트";}
		else if( ctg.equals("me024")) { categoryNames[0]="남성"; categoryNames[1]="탑";categoryNames[2]="스웨터";}
		//남성 > 팬츠
		else if( ctg.equals("me03")) {categoryNames[0]="남성"; categoryNames[1]="팬츠";}
		else if( ctg.equals("me031")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="루즈/테이퍼드";}
		else if( ctg.equals("me032")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="슬림/스트레이트";}
		else if( ctg.equals("me033")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="조거/트랙";}
		else if( ctg.equals("me034")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="데님";}
		else if( ctg.equals("me035")) { categoryNames[0]="남성"; categoryNames[1]="팬츠";categoryNames[2]="쇼츠";}
		//남성 > 수트
		else if( ctg.equals("me04")) {categoryNames[0]="남성"; categoryNames[1]="수트";}
		else if( ctg.equals("me041")) { categoryNames[0]="남성"; categoryNames[1]="수트";categoryNames[2]="드레스셔츠";}
		else if( ctg.equals("me042")) { categoryNames[0]="남성"; categoryNames[1]="수트";categoryNames[2]="수트재킷";}
		else if( ctg.equals("me043")) { categoryNames[0]="남성"; categoryNames[1]="수트";categoryNames[2]="수트팬츠";}
		
		//잡화
		else if (ctg.equals("as")) { categoryNames[0] = "잡화";}
	      // 잡화 > 여성슈즈
		else if (ctg.equals("as01")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; } 
		else if (ctg.equals("as011")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "부츠"; }
		else if (ctg.equals("as012")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "로퍼/블로퍼"; }
		else if (ctg.equals("as013")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "스니커즈"; }
		else if (ctg.equals("as014")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "플랫"; }
		else if (ctg.equals("as015")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "힐/슬링백"; }
		else if (ctg.equals("as016")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "샌들/슬라이드"; }
		else if (ctg.equals("as017")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성슈즈"; categoryNames[2] = "기타 슈즈"; }
		  
		  // 잡화 > 남성슈즈
		else if (ctg.equals("as02")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; }
		else if (ctg.equals("as021")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "부츠"; }
		else if (ctg.equals("as022")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "포멀슈즈"; }
		else if (ctg.equals("as023")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "스니커즈"; }
		else if (ctg.equals("as024")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "샌들/슬라이드"; }
		  else if (ctg.equals("as025")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성슈즈"; categoryNames[2] = "기타 슈즈"; }
		  
		  // 잡화 > 여성백
		  else if (ctg.equals("as03")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성백"; }
		  else if (ctg.equals("as031")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성백"; categoryNames[2] = "토트백"; }
		  else if (ctg.equals("as032")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성백"; categoryNames[2] = "숄더/크로스바디백"; }
		  else if (ctg.equals("as033")) { categoryNames[0] = "잡화"; categoryNames[1] = "여성백"; categoryNames[2] = "기타 백"; }
		
		  // 잡화 > 남성백
		  else if (ctg.equals("as04")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; }
		  else if (ctg.equals("as041")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; categoryNames[2] = "토트백"; }
		  else if (ctg.equals("as042")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; categoryNames[2] = "숄더/크로스바디백"; }
		  else if (ctg.equals("as043")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; categoryNames[2] = "클러치 백"; }
		  else if (ctg.equals("as044")) { categoryNames[0] = "잡화"; categoryNames[1] = "남성백"; categoryNames[2] = "기타 백"; }
		  
		  // 잡화 > 머플러/스카프
		  else if (ctg.equals("as05")) { categoryNames[0] = "잡화"; categoryNames[1] = "머플러/스카프"; }
		  else if (ctg.equals("as051")) { categoryNames[0] = "잡화"; categoryNames[1] = "머플러/스카프"; categoryNames[2] = "머플러"; }
		  else if (ctg.equals("as052")) { categoryNames[0] = "잡화"; categoryNames[1] = "머플러/스카프"; categoryNames[2] = "스카프"; }
		  
		  // 잡화 > 주얼리
		  else if (ctg.equals("as06")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; }
		  else if (ctg.equals("as061")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "이어링/커프"; }
		  else if (ctg.equals("as062")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "목걸이"; }
		  else if (ctg.equals("as063")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "팔찌"; }
		  else if (ctg.equals("as064")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "반지"; }
		  else if (ctg.equals("as065")) { categoryNames[0] = "잡화"; categoryNames[1] = "주얼리"; categoryNames[2] = "기타 주얼리"; }
		  
		  // 잡화 > 기타 ACC
		  else if (ctg.equals("as07")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; }
		  else if (ctg.equals("as071")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "모자"; }
		  else if (ctg.equals("as072")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "양말"; }
		  else if (ctg.equals("as073")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "장갑"; }
		  else if (ctg.equals("as074")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "벨트"; }
		  else if (ctg.equals("as075")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "지갑"; }
		  else if (ctg.equals("as076")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "헤어ACC"; }
		  else if (ctg.equals("as077")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "테크ACC"; }
		  else if (ctg.equals("as078")) { categoryNames[0] = "잡화"; categoryNames[1] = "기타 ACC"; categoryNames[2] = "기타소품"; }

		  // 뷰티
		  else if (ctg.equals("be")) { categoryNames[0] = "뷰티";}
		  // 뷰티 > 메이크업
		  else if (ctg.equals("be01")) { categoryNames[0] = "뷰티"; categoryNames[1] = "메이크업"; } 
		  else if (ctg.equals("be011")) { categoryNames[0] = "뷰티"; categoryNames[1] = "메이크업"; categoryNames[2] = "페이스 메이크업"; }
		  else if (ctg.equals("be012")) { categoryNames[0] = "뷰티"; categoryNames[1] = "메이크업"; categoryNames[2] = "아이 메이크업"; }
		  else if (ctg.equals("be013")) { categoryNames[0] = "뷰티"; categoryNames[1] = "메이크업"; categoryNames[2] = "립 메이크업"; }

		return categoryNames;
	}

	public String[] getSizeList(String sizes) {
		return sizes.split(",");
	}

	
	//------------- 필터관련 부분~~~~~~~~~~~~~~
	public List<String> getBnameFilter(String bf){
		//0일경우 null 미리 넣기
		List<String> filterList = null;

		if(!bf.equals("0")){
			filterList = new ArrayList<String>();
			String[] wantBrand = bf.split("-");
			
			for(int i = 0; i < wantBrand.length ; i++) {
				switch(wantBrand[i]) {
					case "1":
						filterList.add("FOURM THE STORE");
						break;
					case "2":
						filterList.add("O'2nd");
						break;
					case "3":
						filterList.add("the CASHMERE");
						break;
					case "4":
						filterList.add("MUE");
						break;
					case "5":
						filterList.add("TIME");
						break;
					case "6":
						filterList.add("MINE");
						break;
					case "7":
						filterList.add("LANVIN COLLECTION");
						break;
					case "8":
						filterList.add("TOM GREYHOUND");
						break;
					case "9":
						filterList.add("SJSJ");
						break;
					case "10":
						filterList.add("CLUB MONACO");
						break;
					case "11":
						filterList.add("OBZEE");
						break;
					case "12":
						filterList.add("SYSTEM");
						break;
					case "13":
						filterList.add("FOURM STUDIO");
						break;
					case "14":
						filterList.add("3.1 Phillip Lim");
						break;
					case "15":
						filterList.add("LANVIN PARIS");
						break;
					case "16":
						filterList.add("ROCHAS");
						break;
					case "17":
						filterList.add("H : SCENE");
						break;
					case "18":
						filterList.add("TIME HOMME");
						break;
					case "19":
						filterList.add("SYSTEM HOMME");
						break;
					case "20":
						filterList.add("FOURM MEN'S LOUNGE");
						break;
					case "21":
						filterList.add("BALLY");
						break;
				}
			}
		}
		

		return filterList;
	}

	public String getColorFilter(String cf) {
		String colorFilter = null;
		
		switch(cf) {
			case "1":
				colorFilter = "BEIGE";
				break;
			case "2":
				colorFilter = "BLACK";
				break;
			case "3":
				colorFilter = "BLUE";
				break;
			case "4":
				colorFilter = "BROWN";
				break;
			case "5":
				colorFilter = "BURGUNDY";
				break;
			case "6":
				colorFilter = "CAMEL";
				break;
			case "7":
				colorFilter = "GOLD";
				break;
			case "8":
				colorFilter = "GREEN";
				break;
			case "9":
				colorFilter = "GREY";
				break;
			case "10":
				colorFilter = "IVORY";
				break;
			case "11":
				colorFilter = "KHAKI";
				break;
			case "12":
				colorFilter = "LAVENDER";
				break;
			case "13":
				colorFilter = "METAL";
				break;
			case "14":
				colorFilter = "MINT";
				break;
			case "15":
				colorFilter = "MULTI";
				break;
			case "16":
				colorFilter = "NAVY";
				break;
			case "17":
				colorFilter = "OLIVE";
				break;
			case "18":
				colorFilter = "ORANGE";
				break;
			case "19":
				colorFilter = "PINK";
				break;
			case "20":
				colorFilter = "PURPLE";
				break;
			case "21":
				colorFilter = "RED";
				break;
			case "22":
				colorFilter = "SILVER";
				break;
			case "23":
				colorFilter = "SKY";
				break;
			case "24":
				colorFilter = "VIOLET";
				break;
			case "25":
				colorFilter = "WHITE";
				break;
			case "26":
				colorFilter = "YELLOW";
				break;
		}
		
		return colorFilter;
	}
	
	public List<String> getSizeFilter(String sf){
		List<String> filterList = new ArrayList<String>();
		
		if(sf.equals("1")) {
			filterList.add("F");
			filterList.add("FR");
		}
		
		//암것도 없으면 null 가즈아~!
		if(filterList.size() == 0) {
			filterList = null;
		}
		
		return filterList;
	}

	public List<Integer> getPriceFilter(String pf){
		List<Integer> filterList = new ArrayList<Integer>();
		
	    String[] arr = pf.split("-");
	    
	    //구분자로 나눈 배열에서 처음과 끝만 가져옴
	    int s = Integer.parseInt(arr[0]);
	    int e = Integer.parseInt(arr[arr.length-1]);
		
		Integer[] start = {null, 0, 100000, 300000, 500000, 1000000,}; //시작금액 배열(null은 0 일경우 mapper.xml에서 필터링 안하기위함)
		Integer[] end = {null, 100000, 300000, 500000, 1000000, 9000000};// 끝금액 배열(null은 0 일경우 mapper.xml에서 필터링 안하기위함)
		
		//n, n.n+1, n.n+1.n+2  (0<= n <= 5)인자가 들어와도 처음과 끝만 가지고 가서 배열에 맞게 매핑하기 때문에 손쉽게 가능
		filterList.add(start[s]);
		filterList.add(end[e]);
		
		return filterList;
	}

	public String getOrderbyFilter(String of) {
		String orderByFilter = "";
		
		switch(of) {
			case "1":
				orderByFilter = "p_registrationdate";
				break;
			case "2":
				orderByFilter = "p_salesvolume";
				break;
			case "3":
				orderByFilter = "pprice DESC";
				break;
			case "4":
				orderByFilter = "pprice";
				break;
		}
		
		return orderByFilter;
	}

}

