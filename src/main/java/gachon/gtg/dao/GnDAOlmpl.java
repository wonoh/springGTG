package gachon.gtg.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import gachon.gtg.domain.GnVO;
@Repository
public class GnDAOlmpl implements GnDAO {
	private static final String namespace= "gachon.gtg.mapper.gnMapper";
	@Autowired
	private SqlSession sqlSession;
	@Override
	public List<GnVO> selectCor_cd() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".selectGn");
	}

}
