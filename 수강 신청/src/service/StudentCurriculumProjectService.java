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
				throw new ProjectSameException("이미 존재하는 Project입니다.");
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
		throw new LectureNotFoundException("해당 강의는 존재하지 않습니다.");
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
					throw new LectureNotFoundException("해당 강의는 존재하지 않습니다.");
				}
								
			}
			
		}
		
		if(count != 0)
			return;
		else
			throw new StudentNotFoundException("해당 학생은 존재하지 않습니다.");
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
					throw new ProfessorNotFoundException("해당 교수는 존재하지 않습니다.");		
				}
				
			}
			
		}
		
		if(count != 0)
			return;
		else
			throw new LectureNotFoundException("해당 강의는 존재하지 않습니다.");
		
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
		
		throw new StudentNotFoundException("해당 학생은 존재하지 않습니다.");
	}
	
}