package model.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor

public class Professor {

	// 교수 번호
	private String pid;

	// 교수 이름
	private String pname;

	// 교수 생년월일
	private String pbirthday;

	// 교수 학과
	private String pdepartment;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("[교수번호 : ");
		builder.append(pid);
		builder.append(" 교수 이름 : ");
		builder.append(pname);
		builder.append(" 교직원 생일 : ");
		builder.append(pbirthday);
		builder.append(" 교수 소속과 : ");
		builder.append(pdepartment);
		builder.append("]");
		return builder.toString();
	}

}
