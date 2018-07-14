package gachon.gtg.dao;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;


import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gachon.gtg.domain.UserVO;

@Repository
public class UserDAOlmpl implements UserDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace= "gachon.gtg.mapper.userMapper";

	@Override
	public void insertUser(UserVO vo) {
		sqlSession.insert(namespace+".insertUser",vo );
		// TODO Auto-generated method stub
	}

	@Override
	public boolean checkUser(String id){
			if(sqlSession.selectOne(namespace+".checkUser",id) != null) {
				return true;
			}
			else {
				return false;
			}
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<UserVO> selectUser() throws Exception {
		
		return sqlSession.selectList(namespace+".selectUser");
	}



}
