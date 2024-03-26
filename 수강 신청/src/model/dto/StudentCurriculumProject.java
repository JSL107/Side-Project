package model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class StudentCurriculumProject {
	
	// 강의ID
	private String projectID;
	
	// 학생이름
	private Student projectStudent;
	
	// 강의명
	private Lecture projectLecture;
	
	// 지도교수
	private Professor projectProfessor;
	
	// 등록날짜
	private String projectRegisterDay;
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("[학생 개인의 수강정보]");
		builder.append(projectID);
		builder.append(" ");
		builder.append("[학생 정보]");
		builder.append(projectStudent);
		builder.append("[수강 강좌명]");
		builder.append(projectLecture);
		builder.append("[지도교수]");
		builder.append(projectProfessor);
		builder.append("[등록날짜]");
		builder.append(projectRegisterDay);
		builder.append(" ");
		return builder.toString();
	}
	
}