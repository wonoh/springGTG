package gachon.gtg.dao;
import java.util.ArrayList;
import java.util.List;

import gachon.gtg.domain.UserVO;

public interface UserDAO {
	public void insertUser(UserVO vo);
	public boolean checkUser(String id);
	public List<UserVO> selectUser() throws Exception;


}
