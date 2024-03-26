package service;

import java.util.ArrayList;

import exception.LectureNotFoundException;
import exception.ProfessorNotFoundException;
import exception.ProjectSameException;
import exception.StudentNotFoundException;
import model.dto.Lecture;
import model.dto.Professor;
import model.dto.Student;
import model.dto.StudentCurriculumProject;
import view.EndView;

public class StudentCurriculumProjectService {
	
	private static StudentCurriculumProjectService instance = new StudentCurriculumProjectService();
	
	private ArrayList<StudentCurriculumProject> studentProjectList = new ArrayList<StudentCurriculumProject>();
	
	private StudentCurriculumProjectService() {};
	
	public static StudentCurriculumProjectService getInstance() {
		return instance;
	}
	
	
	//Add project
	public void studentProjectInsert(StudentCurriculumProject project) throws ProjectSameException {
		for(StudentCurriculumProject scp : studentProjectList) {
			if (scp.getProjectID().equals(project.getProjectID())) {
				throw new ProjectSameException("�̹� �����ϴ� Project�Դϴ�.");
			}
		}
		studentProjectList.add(project);
	}
	
	
	//Return all lists
	public ArrayList<StudentCurriculumProject> getStudentProjectList() {
		return studentProjectList;
	}
	
	
	//Return StudentCurriculumProject from lectureName
	public StudentCurriculumProject getStudentProject(String lectureName) throws LectureNotFoundException{
		for(StudentCurriculumProject scp : studentProjectList) {
			if(scp.getProjectLecture().getLname().equals(lectureName)) {
				return scp;				
			}
		}
		throw new LectureNotFoundException("�ش� ���Ǵ� �������� �ʽ��ϴ�.");
	}

	
	//Update student's lecture
	public void studentToLectureUpdate(String studentName, Lecture lecture) throws StudentNotFoundException, LectureNotFoundException {
		int count = 0;
		
		for(StudentCurriculumProject scp : studentProjectList) {
			
			//check studentName
			if(scp.getProjectStudent().getSname().equals(studentName)) {
				
				//check lecture
				if(lecture != null) {
					count++;
					scp.setProjectLecture(lecture);
					EndView.projectView(scp);
				}
				else  {
					throw new LectureNotFoundException("�ش� ���Ǵ� �������� �ʽ��ϴ�.");
				}
								
			}
			
		}
		
		if(count != 0)
			return;
		else
			throw new StudentNotFoundException("�ش� �л��� �������� �ʽ��ϴ�.");
	}

	
	
	//Update lecture's professor
	public void lectureToProfessorUpdate(String lectureName, Professor professor) throws LectureNotFoundException, ProfessorNotFoundException {
		int count = 0;
		
		for(StudentCurriculumProject scp : studentProjectList) {
			
			//check lectureName
			if(scp.getProjectLecture().getLname().equals(lectureName)) {
				
				//check professor
				if(professor != null) {
					count++;
					scp.setProjectProfessor(professor);
					EndView.projectView(scp);
				} 
				else {
					throw new ProfessorNotFoundException("�ش� ������ �������� �ʽ��ϴ�.");		
				}
				
			}
			
		}
		
		if(count != 0)
			return;
		else
			throw new LectureNotFoundException("�ش� ���Ǵ� �������� �ʽ��ϴ�.");
		
	}

	
	//Delete student's curriculum
	public void studentProjectDelete(String studentName) throws StudentNotFoundException {
		
		for(StudentCurriculumProject scp : studentProjectList) {
			
			//check studentName
			if(scp.getProjectStudent().getSname().equals(studentName)) {
				studentProjectList.remove(scp);
				return;			
			}
			
		}
		
		throw new StudentNotFoundException("�ش� �л��� �������� �ʽ��ϴ�.");
	}
	
}