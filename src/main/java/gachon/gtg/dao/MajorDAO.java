package gachon.gtg.dao;

import java.util.List;

import gachon.gtg.domain.MajorVO;

public interface MajorDAO {
	public List<MajorVO> selectAllMj() throws Exception;
}
