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

	// ���� ��ȣ
	private String pid;

	// ���� �̸�
	private String pname;

	// ���� �������
	private String pbirthday;

	// ���� �а�
	private String pdepartment;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("[������ȣ : ");
		builder.append(pid);
		builder.append(" ���� �̸� : ");
		builder.append(pname);
		builder.append(" ������ ���� : ");
		builder.append(pbirthday);
		builder.append(" ���� �ҼӰ� : ");
		builder.append(pdepartment);
		builder.append("]");
		return builder.toString();
	}

}
