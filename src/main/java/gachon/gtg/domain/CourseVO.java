package gachon.gtg.domain;

import java.util.List;

public class CourseVO {
	/*public CourseVO(int year, int semester, String title, String classification, int credit, int quota, String time,
			String instructor, String room, String grade, String syllabus, String maj_cd, String cor_cd) {
		super();
		this.year = year;
		this.semester = semester;
		this.title = title;
		this.classification = classification;
		this.credit = credit;
		this.quota = quota;
		this.time = time;
		this.instructor = instructor;
		this.room = room;
		this.grade = grade;
		this.syllabus = syllabus;
		this.maj_cd = maj_cd;
		this.cor_cd = cor_cd;
	}*/
	private List<CourseVO> courseList;
	private int year;
	private int semester;
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	private String title;
	private String classification;
	private int credit;
	private int quota;
	private String time;
	private String instructor;
	private String room;
	private String grade;
	private String syllabus;
	private String maj_cd;
	private String cor_cd;
	private String name;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getClassification() {
		return classification;
	}
	public void setClassification(String classification) {
		this.classification = classification;
	}
	public int getCredit() {
		return credit;
	}
	public void setCredit(int credit) {
		this.credit = credit;
	}
	public int getQuota() {
		return quota;
	}
	public void setQuota(int quota) {
		this.quota = quota;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getInstructor() {
		return instructor;
	}
	public void setInstructor(String instructor) {
		this.instructor = instructor;
	}
	public String getRoom() {
		return room;
	}
	public void setRoom(String room) {
		this.room = room;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getSyllabus() {
		return syllabus;
	}
	public void setSyllabus(String syllabus) {
		this.syllabus = syllabus;
	}
	public String getMaj_cd() {
		return maj_cd;
	}
	public void setMaj_cd(String maj_cd) {
		this.maj_cd = maj_cd;
	}
	public String getCor_cd() {
		return cor_cd;
	}
	public void setCor_cd(String cor_cd) {
		this.cor_cd = cor_cd;
	}
	public List<CourseVO> getCourseList() {
		return courseList;
	}
	public void setCourseList(List<CourseVO> courseList) {
		this.courseList = courseList;
	}
}
