package gachon.gtg.dao;

import java.util.ArrayList;

import gachon.gtg.domain.LectureVO;

public interface LectureDAO {
	public boolean duplication_check(ArrayList<LectureVO> f_lecs);
	public double cohesioncheck(ArrayList<String> lectime);
	public boolean compare(String[] lectime,String lecname);
	public ArrayList<LectureVO> result(int credit,int max_credits,String major) throws Exception;
	public double calc(String type);
	public double change(double time);
	public boolean isAlpha(String str);
	public boolean isNumeric(String str);
}
