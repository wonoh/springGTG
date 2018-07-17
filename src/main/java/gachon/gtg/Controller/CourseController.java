package gachon.gtg.Controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gachon.gtg.dao.CourseDAO;
import gachon.gtg.domain.CourseVO;

@Controller
public class CourseController {
	@Autowired
	private CourseDAO courseDAO;
	@RequestMapping(value = "/searchcourse", method = {RequestMethod.POST })
	public String searchcourse(Model model,HttpServletRequest request) throws Exception {
		String coursename=request.getParameter("coursename");
		String major=request.getParameter("major");
		String grade=request.getParameter("grade");
		if(coursename==null || coursename.equals("")) {
			List<CourseVO> cvlist=courseDAO.searchCourse(major,grade);
			model.addAttribute("cvlist",cvlist);
			return "search";
		}
		else {
			List<CourseVO> cvlist=courseDAO.searchCourseName(coursename);
			model.addAttribute("cvlist",cvlist);
			return "search";
		}
	}
}
