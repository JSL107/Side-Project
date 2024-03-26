package view;

import java.util.ArrayList;

import model.dto.StudentCurriculumProject;

public class EndView {
	
	//print curriculum info
	public static void projectView(StudentCurriculumProject scp) {
		if(scp != null)
			System.out.println(scp);
		else
			System.out.println("존재하지 않는 리스트입니다.");
	}
	
	//print all curriculums
	public static void projectListView(ArrayList<StudentCurriculumProject> allstudentProjects) {
		if(allstudentProjects != null) {
			for(StudentCurriculumProject scp : allstudentProjects) {
				System.out.println(scp);
			}
		} else {
			System.out.println("현재 수강목록이 존재하지 않습니다");
		}
	}

}
