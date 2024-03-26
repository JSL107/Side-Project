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
	
	// ����ID
	private String projectID;
	
	// �л��̸�
	private Student projectStudent;
	
	// ���Ǹ�
	private Lecture projectLecture;
	
	// ��������
	private Professor projectProfessor;
	
	// ��ϳ�¥
	private String projectRegisterDay;
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("[�л� ������ ��������]");
		builder.append(projectID);
		builder.append(" ");
		builder.append("[�л� ����]");
		builder.append(projectStudent);
		builder.append("[���� ���¸�]");
		builder.append(projectLecture);
		builder.append("[��������]");
		builder.append(projectProfessor);
		builder.append("[��ϳ�¥]");
		builder.append(projectRegisterDay);
		builder.append(" ");
		return builder.toString();
	}
	
}