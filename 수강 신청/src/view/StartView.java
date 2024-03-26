package view;

import controller.StudentCurriculumProjectController;
import model.dto.Lecture;
import model.dto.Professor;
import model.dto.Student;
import model.dto.StudentCurriculumProject;

public class StartView {

	public static void main(String[] args) {
		
		//Student db
		Student student1 = new Student("0677444", "김민준", "960302", 3, "컴퓨터공학", "김독사");
		Student student2 = new Student("1514623", "이준석", "071012", 1, "정보통신공학", "마변수");
		Student student3 = new Student("1537923", "장우재", "981129", 2, "산업공학", "채송화");
		Student student4 = new Student("2101170", "이현빈", "020723", 4, "물리학", "박둑심");
		
		//Professor db
		Professor professor1 = new Professor("A2345", "김독사", "500923", "전자전기");
		Professor professor2 = new Professor("C3456", "마변수", "620115", "수학");
		Professor professor3 = new Professor("D1234", "채송화", "581223", "컴퓨터공학");
		Professor professor4 = new Professor("B6789", "박둑심", "530404", "경영학");
		
		//Lecture db
		Lecture lecture1 = new Lecture("0177888", "자료구조", "D1234", "전공", "월3-5", "C201");
		Lecture lecture2 = new Lecture("2177666", "통계학", "C3456", "전공", "화4-5", "T912");
		Lecture lecture3 = new Lecture("3255888", "네트워크통신학", "A2345", "전공", "금1-3", "A203");
		Lecture lecture4 = new Lecture("4477999", "보건학", "B6789", "교양", "목6-8", "H903");
		
		//Curriculum list db
		StudentCurriculumProject studentCurriculumProject1 = new StudentCurriculumProject("A101", student1, lecture1, professor3, "2020-03-31");
		StudentCurriculumProject studentCurriculumProject2 = new StudentCurriculumProject("A102", student2, lecture2, professor1, "2020-02-28");
		StudentCurriculumProject studentCurriculumProject3 = new StudentCurriculumProject("A103", student3, lecture3, professor2, "2020-03-15");
		

		StudentCurriculumProjectController controller = StudentCurriculumProjectController.getInstance();
		
		System.out.println("*** 01. 수강신청 *** \n");
		controller.studentProjectInsert(studentCurriculumProject1);
		controller.studentProjectInsert(studentCurriculumProject2);
		controller.studentProjectInsert(studentCurriculumProject3);
		
		System.out.println("*** 02. 모든 수강정보 출력 ***");
		controller.studentProjectsList();
		
		
		System.out.println("*** 03. '해당과목' 강의 검색 ***");
		//자료구조 검색
		controller.getStudentProject("자료구조");
		
		System.out.println("*** 03. 오류상황 ***");
		//예외 발생(없는 강의)
		controller.getStudentProject("이산수학");
		
		
		
		System.out.println("*** 04. '해당 학생'의 수강정보를 변경 ***");
	    //'이준석' 의 수강정보는 lecture4(보건학)으로 변경
		controller.studentToLectureUpdate("이준석", lecture4);
		
		System.out.println("*** 04. 오류상황 ***");
		//예외 발생(없는 학생)
		controller.studentToLectureUpdate("김혜경", lecture2);
		
		
		
		System.out.println("*** 05. '해당과목'의 교수명 변경 ***");
		//자료 구조(채송화) -> 김독사
		controller.lectureToProfessorUpdate("자료구조", professor4);
		
		System.out.println("*** 05. 오류상황 ***");
		//예외 발생(교수가 존재하지 않음)
		controller.lectureToProfessorUpdate("자료구조", null);
		
		
		
		
		System.out.println("*** 06. '해당학생'의 수강정보 삭제 ***");
		//'이준석' 의 수강정보 삭제
		controller.studentProjectDelete("이준석");
		
		System.out.println("*** 06. 오류상황 ***");
		//예외 발생(없는 학생)
		controller.studentProjectDelete("김혜경");
		
	}

}