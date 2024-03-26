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

	// �й�
	private String stuid;

	// �л� �̸�
	private String sname;

	// �л� �������
	private String sbirthday;

	// �л� �г�
	private int sgrade;

	// �л��� ����
	private String smajor;

	// �л��� �������� �̸�
	private String advpname;

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append(" [�й� : ");
		builder.append(stuid);
		builder.append(", �л��̸� : ");
		builder.append(sname);
		builder.append(", ������� : ");
		builder.append(sbirthday);
		builder.append(", ");
		builder.append(sgrade);
		builder.append("�г� , ");
		builder.append("�а� : ");
		builder.append(smajor);
		builder.append(", �������� : ");
		builder.append(advpname);
		builder.append("] ");
		return builder.toString();
	}

}
