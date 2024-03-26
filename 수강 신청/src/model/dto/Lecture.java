package model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class Lecture {
	
	// 강의번호
	private String lecid;
	
	// 강의명
	private String lname;
	
	// 교수번호
	private String proid;
	
	// 과목구분
	private String ltype;
	
	// 요일, 시간
	private String ltime;
	
	// 교실
	private String classroom;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("[학수 번호 : ");
		builder.append(lecid);
		builder.append(" ");
		builder.append("강의명 : ");
		builder.append(lname);
		builder.append(", 교수번호 : ");
		builder.append(proid);
		builder.append(", 과목구분 : ");
		builder.append(ltype);
		builder.append(", 요일/시간 : ");
		builder.append(ltime);
		builder.append(", 강의실 : ");
		builder.append(classroom);
		builder.append("]");
		return builder.toString();
	}
	
}
