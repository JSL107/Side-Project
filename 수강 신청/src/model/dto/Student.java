package model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class Student {

	// 학번
	private String stuid;

	// 학생 이름
	private String sname;

	// 학생 생년월일
	private String sbirthday;

	// 학생 학년
	private int sgrade;

	// 학생의 전공
	private String smajor;

	// 학생의 지도교수 이름
	private String advpname;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(" [학번 : ");
		builder.append(stuid);
		builder.append(", 학생이름 : ");
		builder.append(sname);
		builder.append(", 생년월일 : ");
		builder.append(sbirthday);
		builder.append(", ");
		builder.append(sgrade);
		builder.append("학년 , ");
		builder.append("학과 : ");
		builder.append(smajor);
		builder.append(", 지도교수 : ");
		builder.append(advpname);
		builder.append("] ");
		return builder.toString();
	}

}
