package view;

import controller.StudentCurriculumProjectController;
import model.dto.Lecture;
import model.dto.Professor;
import model.dto.Student;
import model.dto.StudentCurriculumProject;

public class StartView {

	public static void main(String[] args) {
		
		//Student db
		Student student1 = new Student("0677444", "�����", "960302", 3, "��ǻ�Ͱ���", "�赶��");
		Student student2 = new Student("1514623", "���ؼ�", "071012", 1, "������Ű���", "������");
		Student student3 = new Student("1537923", "�����", "981129", 2, "�������", "ä��ȭ");
		Student student4 = new Student("2101170", "������", "020723", 4, "������", "�ڵϽ�");
		
		//Professor db
		Professor professor1 = new Professor("A2345", "�赶��", "500923", "��������");
		Professor professor2 = new Professor("C3456", "������", "620115", "����");
		Professor professor3 = new Professor("D1234", "ä��ȭ", "581223", "��ǻ�Ͱ���");
		Professor professor4 = new Professor("B6789", "�ڵϽ�", "530404", "�濵��");
		
		//Lecture db
		Lecture lecture1 = new Lecture("0177888", "�ڷᱸ��", "D1234", "����", "��3-5", "C201");
		Lecture lecture2 = new Lecture("2177666", "�����", "C3456", "����", "ȭ4-5", "T912");
		Lecture lecture3 = new Lecture("3255888", "��Ʈ��ũ�����", "A2345", "����", "��1-3", "A203");
		Lecture lecture4 = new Lecture("4477999", "������", "B6789", "����", "��6-8", "H903");
		
		//Curriculum list db
		StudentCurriculumProject studentCurriculumProject1 = new StudentCurriculumProject("A101", student1, lecture1, professor3, "2020-03-31");
		StudentCurriculumProject studentCurriculumProject2 = new StudentCurriculumProject("A102", student2, lecture2, professor1, "2020-02-28");
		StudentCurriculumProject studentCurriculumProject3 = new StudentCurriculumProject("A103", student3, lecture3, professor2, "2020-03-15");
		

		StudentCurriculumProjectController controller = StudentCurriculumProjectController.getInstance();
		
		System.out.println("*** 01. ������û *** \n");
		controller.studentProjectInsert(studentCurriculumProject1);
		controller.studentProjectInsert(studentCurriculumProject2);
		controller.studentProjectInsert(studentCurriculumProject3);
		
		System.out.println("*** 02. ��� �������� ��� ***");
		controller.studentProjectsList();
		
		
		System.out.println("*** 03. '�ش����' ���� �˻� ***");
		//�ڷᱸ�� �˻�
		controller.getStudentProject("�ڷᱸ��");
		
		System.out.println("*** 03. ������Ȳ ***");
		//���� �߻�(���� ����)
		controller.getStudentProject("�̻����");
		
		
		
		System.out.println("*** 04. '�ش� �л�'�� ���������� ���� ***");
	    //'���ؼ�' �� ���������� lecture4(������)���� ����
		controller.studentToLectureUpdate("���ؼ�", lecture4);
		
		System.out.println("*** 04. ������Ȳ ***");
		//���� �߻�(���� �л�)
		controller.studentToLectureUpdate("������", lecture2);
		
		
		
		System.out.println("*** 05. '�ش����'�� ������ ���� ***");
		//�ڷ� ����(ä��ȭ) -> �赶��
		controller.lectureToProfessorUpdate("�ڷᱸ��", professor4);
		
		System.out.println("*** 05. ������Ȳ ***");
		//���� �߻�(������ �������� ����)
		controller.lectureToProfessorUpdate("�ڷᱸ��", null);
		
		
		
		
		System.out.println("*** 06. '�ش��л�'�� �������� ���� ***");
		//'���ؼ�' �� �������� ����
		controller.studentProjectDelete("���ؼ�");
		
		System.out.println("*** 06. ������Ȳ ***");
		//���� �߻�(���� �л�)
		controller.studentProjectDelete("������");
		
	}

}