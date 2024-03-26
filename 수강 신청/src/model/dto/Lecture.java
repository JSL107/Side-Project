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
	
	// ���ǹ�ȣ
	private String lecid;
	
	// ���Ǹ�
	private String lname;
	
	// ������ȣ
	private String proid;
	
	// ���񱸺�
	private String ltype;
	
	// ����, �ð�
	private String ltime;
	
	// ����
	private String classroom;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("[�м� ��ȣ : ");
		builder.append(lecid);
		builder.append(" ");
		builder.append("���Ǹ� : ");
		builder.append(lname);
		builder.append(", ������ȣ : ");
		builder.append(proid);
		builder.append(", ���񱸺� : ");
		builder.append(ltype);
		builder.append(", ����/�ð� : ");
		builder.append(ltime);
		builder.append(", ���ǽ� : ");
		builder.append(classroom);
		builder.append("]");
		return builder.toString();
	}
	
}
