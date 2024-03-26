package com.hdsm.util;

import java.io.File;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Builder;
import lombok.extern.log4j.Log4j;

@Builder
@Log4j
public class ReviewUtil {
	private String getFolder() {   //날짜 구분자 대소문자 구별
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);//OS구별없이 구분자로 대체		
	}//
	
	//책 소스 원본
	public boolean checkImageType(File file) {
		try { //파일 타입 체크
			String contenType = Files.probeContentType(file.toPath());
			log.info(contenType);
			return contenType.startsWith("image");			
		}catch (Exception e) {
			e.printStackTrace();		
		}//end try		
		return false;		
	}//
	
	//파일 삭제
	public void deleteCancleImage(String path) {
	File file = new File(path);
        
    	if( file.exists() ){
    		if(file.delete()){
    			System.out.println("파일삭제 성공");
    		}else{
    			System.out.println("파일삭제 실패");
    		}
    	}else{
    		System.out.println("파일이 존재하지 않습니다.");
    	}
        	
	}

}
