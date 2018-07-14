package gachon.gtg.Controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import gachon.gtg.dao.CourseDAO;
import gachon.gtg.dao.GnDAO;
import gachon.gtg.dao.MajorDAO;
import gachon.gtg.dao.UserDAO;
import gachon.gtg.domain.CourseVO;
import gachon.gtg.domain.MajorVO;
import gachon.gtg.domain.UserVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	@Inject
	private UserDAO userDAO;
	@Inject
	private CourseDAO courseDAO;
	@Inject
	private MajorDAO majorDAO;
	CourseVO courseVO=new CourseVO();
 	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = { RequestMethod.GET, RequestMethod.POST })
	public String home() {
		return "index";
	}
	
	@RequestMapping(value = "/create", method = { RequestMethod.GET, RequestMethod.POST })
	public String create() {
		return "create";
	}
	
	@RequestMapping(value = "/manage", method = { RequestMethod.GET, RequestMethod.POST })
	public String manage() {
		return "manage";
	}
	
	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String search() {
		return "search";
	}
	@RequestMapping(value = "/crawling", method = { RequestMethod.GET, RequestMethod.POST })
	public String crawling(Model model) throws Exception {
		if(courseDAO.insertCourses()==false) {
			return "userList";
		}
		else {
		return "create";
		}
	}
	@RequestMapping(value = "/userList", method = { RequestMethod.GET, RequestMethod.POST })
	public String userList(Model model) throws Exception {
		List<UserVO> userlist=userDAO.selectUser();
		model.addAttribute("userList", userlist);
		return "userList";
	}
	@RequestMapping(value = "/mjList", method = { RequestMethod.GET, RequestMethod.POST })
	public String mjList(Model model) throws Exception{
		List<MajorVO> mjlist=majorDAO.selectAllMj();
		model.addAttribute("mjlist",mjlist);
		return "mjList";
	}
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
	@RequestMapping(value="/algo",method= {RequestMethod.POST})
	public String algo(Model model,HttpServletRequest request) throws Exception {
		String credit=request.getParameter("credit");
		return "credit";
	}
	@RequestMapping(value="/ex",method= {RequestMethod.GET})
	public String exget(Model model) {
		return "ex";
	}
}
