package gachon.gtg.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import gachon.gtg.domain.MajorVO;
@Repository
public class MajorDAOlmpl implements MajorDAO {
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace= "gachon.gtg.mapper.majorMapper";

	@Override
	public List<MajorVO> selectAllMj() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectMj");
	}

}
