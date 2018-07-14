package gachon.gtg.dao;
import java.util.List;

import gachon.gtg.domain.CourseVO;
import gachon.gtg.domain.GnVO;
import gachon.gtg.domain.MajorVO;

public interface CourseDAO {

	public boolean insertCourses() throws Exception;
	 public String textFilter(String text);
	 public void insertCourse(int year,int semester,String code,String title,String classification,
	    		int credit,int quota,String time,String instructor,String room,String grade,
	    		String syllabus,String maj_cd,String cor_cd);
	 public List<CourseVO> searchCourse(String major,String grade) throws Exception;
	 public List<CourseVO> searchCourseName(String coursename) throws Exception;
	 
}
