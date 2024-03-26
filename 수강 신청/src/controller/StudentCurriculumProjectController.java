package controller;

import exception.LectureNotFoundException;
import exception.ProfessorNotFoundException;
import exception.StudentNotFoundException;
import model.dto.Lecture;
import model.dto.Professor;
import model.dto.Student;
import model.dto.StudentCurriculumProject;
import service.StudentCurriculumProjectService;
import view.EndFailView;
import view.EndView;

public class StudentCurriculumProjectController {

	private static StudentCurriculumProjectController instance = new StudentCurriculumProjectController();

	private StudentCurriculumProjectController() {};

	public static StudentCurriculumProjectController getInstance() {
		return instance;
	}

	private StudentCurriculumProjectService service = StudentCurriculumProjectService.getInstance();
	
	
	//Add list
	public void studentProjectInsert(StudentCurriculumProject project) {
		if (project != null) {
			try {
				service.studentProjectInsert(project);
			} catch (Exception e) {
				e.printStackTrace();
				EndFailView.failView(e.getMessage());
			}
		} else {
			EndFailView.failView("������ �����Ͱ� ���� ���� �ʽ��ϴ�.");
		}
	}

	
	//Print all lists
	public void studentProjectsList() {
		EndView.projectListView(service.getStudentProjectList());
	}
	
	
	//Print StudentCurriculumProject from lectureName
	public void getStudentProject(String lectureName) {
		try {
			EndView.projectView(service.getStudentProject(lectureName));
		} catch (LectureNotFoundException e) {
			e.printStackTrace();
			EndFailView.failView(e.getMessage());
		}
	}

	
	//Update student's lecture
	public void studentToLectureUpdate(String studentName, Lecture lecture) {
		
		if(studentName != null && lecture != null) {
			try {
				service.studentToLectureUpdate(studentName, lecture);
			} catch (StudentNotFoundException | LectureNotFoundException e) {
				e.printStackTrace();
				EndFailView.failView(e.getMessage());
			}
		}
		else {
			EndFailView.failView("�л� �̸��� �������� �ʰų� ���ǰ� �������� �ʽ��ϴ�." );
		}
	}

	
	//Update lecture's professor
	public void lectureToProfessorUpdate(String lectureName, Professor professor) {
		
		if(lectureName != null && professor != null) {
			try {
				service.lectureToProfessorUpdate(lectureName, professor);
			} catch (LectureNotFoundException | ProfessorNotFoundException e) {
				e.printStackTrace();
				EndFailView.failView(e.getMessage());
			}
		}
		else {
			EndFailView.failView("���� �̸��� �������� �ʰų� ������ �������� �ʽ��ϴ�." );
		}
		
	}
	
	
	//Delete student's curriculum
	public void studentProjectDelete(String studentName) {
		
		if(studentName != null) {
			try {
				service.studentProjectDelete(studentName);
				EndView.projectListView(service.getStudentProjectList());
			} catch (StudentNotFoundException e) {
				e.printStackTrace();
				EndFailView.failView(e.getMessage());
			}

		}
		else {
			EndFailView.failView("�л� �̸��� �������� �ʽ��ϴ�.");
		}
	}
	
}