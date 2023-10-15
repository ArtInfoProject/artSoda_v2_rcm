package com.art.project.contest.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.art.project.contest.dto.ContestDTO;

@Repository
public class ContestDAOImpl implements ContestDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ContestDTO> list() {

		return sqlSession.selectList("contest.list");
	}

	@Override
	public ContestDTO detail(int idx) {

		return sqlSession.selectOne("contest.detail", idx);
	}

	@Override
	public void write(ContestDTO contestDTO) {

		sqlSession.insert("contest.write", contestDTO);
	}

	@Override
	public void update(ContestDTO contestDTO) {

		sqlSession.selectOne("contest.update", contestDTO);
	}

	@Override
	public void delete(int idx) {
		
		sqlSession.selectOne("contest.delete", idx);
	}

	@Override
	public int count() {
		
		return sqlSession.selectOne("contest.count");
	}

	@Override
	public List<ContestDTO> listPage(int displayPost, int postNum) {
		
		Map<String, Integer> data = new HashMap<>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		
		return sqlSession.selectList("contest.listPage", data);
	}

	@Override
	public List<ContestDTO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) {
		
		Map<String, Object> data = new HashMap<>();
		
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sqlSession.selectList("contest.listPageSearch", data);
	}
	
	@Override
	   public int searchCount(String searchType, String keyword) {
	      
	      Map<String, Object> data = new HashMap<>();

	      data.put("searchType", searchType);
	      data.put("keyword", keyword);

	      return sqlSession.selectOne("contest.searchCount", data);
	   }

}
