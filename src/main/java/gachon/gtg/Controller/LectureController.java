package gachon.gtg.Controller;

import java.util.ArrayList;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gachon.gtg.dao.LectureDAO;
import gachon.gtg.domain.LectureVO;

@Controller
public class LectureController {
	@Autowired
	private LectureDAO lectureDAO;
	
	@RequestMapping(value="/algo",method= {RequestMethod.POST})
	public String algo(Model model,HttpServletRequest request) throws Exception {
		int mincredit=Integer.parseInt(request.getParameter("mincredit"));
		int maxcredit=Integer.parseInt(request.getParameter("maxcredit"));
		String major=request.getParameter("major");
		ArrayList<LectureVO> lvlist=lectureDAO.result(mincredit,maxcredit,major);
		model.addAttribute("lvlist",lvlist);
		return "manage"; //테스트용
	}

}
