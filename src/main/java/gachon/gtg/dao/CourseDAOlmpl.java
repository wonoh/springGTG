package gachon.gtg.dao;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.springframework.stereotype.Repository;

import gachon.gtg.domain.CourseVO;
import gachon.gtg.domain.GnVO;
import gachon.gtg.domain.MajorVO;
@Repository
public class CourseDAOlmpl implements CourseDAO {

	private static final String BASE_URL = "http://203.249.126.126:9090/servlets/timetable";
	private static final String namespace= "gachon.gtg.mapper.courseMapper";
	@Inject
	private SqlSession sqlSession;
	@Inject
	private GnDAO gnDAO;
	@Inject
	private MajorDAO majorDAO;


	@Override
	public boolean insertCourses() throws Exception {
        Document topDoc = null;
        Document listDoc = null;
        String url = null;
        List<MajorVO> mjRs=majorDAO.selectAllMj();
        List<GnVO> gnRs=gnDAO.selectCor_cd();
        // Use Jsoup for crawling
        url = BASE_URL + "?attribute=top&lang=ko";
        try {
            topDoc = Jsoup.connect(url).get();
        } catch (IOException e) {
            System.err.println(e.getMessage());
        }
        Map<String, String> body = Collections.synchronizedMap(new HashMap<>());
        body.put("attribute", "top");
        body.put("flag", "A");
        body.put("lang", "ko");
        body.put("year", "");
        body.put("hakgi", "");
        body.put("isu_cd", "");
        body.put("cor_cd", "");
        body.put("univ_cd", "");
        body.put("maj_cd", "");
        url = BASE_URL + "?attribute=lists";
        System.out.println(topDoc);
        for (Element yearOpt : topDoc.select("select[name='year']").select("option")) {
        	System.out.println("asd");
            Integer year = Integer.valueOf(yearOpt.attr("value"));
            System.out.println(String.format("[INFO:year] %d Start!", year));
            if (year < 2018)
                break;

            for (Element hakgiOpt : topDoc.select("select[name='hakgi']").select("option")) {
                Integer hakgi = Integer.valueOf(hakgiOpt.attr("value"));

                System.out.println(String.format("[INFO:hakgi] %d Start!", hakgi));
                if (hakgi != 10)
                    continue;

                String univ_cd;
                String maj_cd;
                String cor_cd;
                Elements table;

                body.put("year", year.toString());
                body.put("hakgi", hakgi.toString());

                // Major classification code
                body.put("isu_cd", "1");

                    // The loop for majors
                	for(Object obj:mjRs) {

                		univ_cd=(String)obj;
                		System.out.println("univ"+univ_cd);
                		if(univ_cd.equals("")|| univ_cd==null) {
                			return false;
                		}
                		maj_cd=(String)obj;
                		body.put("univ_cd", univ_cd);
                        body.put("maj_cd", maj_cd);

                        try {
                            listDoc = Jsoup.connect(url)
                                    .data(body)
                                    .post();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }

                        table = listDoc.select("table")
                                .select("table")
                                .eq(2);

                        // insert the subjects
                        for (Element tr : table.select("tr")) {
                            // Pass column labels
                            if (tr.elementSiblingIndex() == 0)
                                continue;

                            try {
                            	insertCourse(year, hakgi,tr.select("td").eq(1).text(),textFilter(tr.select("td").eq(2).text()),
                            			tr.select("td").eq(4).text(), Integer.parseInt(tr.select("td").eq(5).text()),
                            			Integer.parseInt(tr.select("td").eq(6).text()),tr.select("td").eq(7).text(),
                            			tr.select("td").eq(8).text(),tr.select("td").eq(9).text(),
                            			tr.select("td").eq(10).text(),tr.select("td").eq(1).select("a")
                                        .attr("href"),maj_cd,"2");
                            }catch(Exception e) {
                            	e.printStackTrace();
                            }
                        }
                	}
                
                // The classification code for general educations
                body.put("isu_cd", "2");


                	for(Object obj1:gnRs) {

                		cor_cd=(String)obj1;
                		body.put("cor_cd", cor_cd);

                        try {
                            listDoc = Jsoup.connect(url)
                                    .data(body)
                                    .post();
                        } catch (IOException e) {
                            System.err.println(e.getMessage());
                        }

                        table = listDoc.select("table")
                                .select("table")
                                .eq(2);

                        // insert the subjects
                        for (Element tr : table.select("tr")) {
                            // Pass column labels
                            if (tr.elementSiblingIndex() == 0)
                                continue;

                            try {
                                // year, semester, code, title, classification, credit,
                                // quota, time, instructor, room, grade, syllabus, maj_cd, cor_cd (14 columns)
                            	insertCourse(year, hakgi,tr.select("td").eq(1).text(),textFilter(tr.select("td").eq(2).text()),
                            			tr.select("td").eq(4).text(), Integer.parseInt(tr.select("td").eq(5).text()),
                            			Integer.parseInt(tr.select("td").eq(6).text()),tr.select("td").eq(7).text(),
                            			tr.select("td").eq(8).text(),tr.select("td").eq(9).text(),
                            			tr.select("td").eq(10).text(),tr.select("td").eq(1).select("a")
                                        .attr("href"),"3", cor_cd);
                            }catch(Exception e) {
                            	e.printStackTrace();
                            }
                        }
                	}
                	
                    // The loop for general educations
            } 
        }
        	System.out.println("return전");
            return true;

        }

	@Override
	public String textFilter(String text) {
        return text.replaceAll("(&nbsp;)", "");
    }

	@Override
	public void insertCourse(int year,int semester,String code,String title,String classification,
    		int credit,int quota,String time,String instructor,String room,String grade,
    		String syllabus,String maj_cd,String cor_cd) {
    	CourseVO cv=new CourseVO();
    	cv.setYear(year);
    	cv.setSemester(semester);
    	cv.setCode(code);
    	cv.setTitle(title);
    	cv.setClassification(classification);
    	cv.setCredit(credit);
    	cv.setQuota(quota);
    	cv.setTime(time);
    	cv.setInstructor(instructor);
    	cv.setRoom(room);
    	cv.setGrade(grade);
    	cv.setSyllabus(syllabus);
    	cv.setMaj_cd(maj_cd);
    	cv.setCor_cd(cor_cd);
    	sqlSession.insert(namespace+".insertCourse",cv);
    }

	@Override
	public List<CourseVO> searchCourse(String major,String grade) throws Exception {
		 Map<String, Object> parameters = new HashMap<String, Object>();
		 parameters.put("major",major);
		 parameters.put("grade",grade);
		return sqlSession.selectList(namespace+".searchCourse",parameters);
				
	}

	@Override
	public List<CourseVO> searchCourseName(String coursename) throws Exception {
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("coursename",coursename);
		return sqlSession.selectList(namespace+".searchCourseName",parameters);
	}


	
}
