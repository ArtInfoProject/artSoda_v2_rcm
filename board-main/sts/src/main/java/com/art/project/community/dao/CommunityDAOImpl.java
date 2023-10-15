package com.art.project.community.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.art.project.community.dto.CommunityDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<CommunityDTO> list() {

		return sqlSession.selectList("community.list");
	}

	// 글 수정
	@Override
	public void write(CommunityDTO communityDTO) {
		sqlSession.insert("community.write", communityDTO);
	}

	@Override
	public CommunityDTO detail(int idx) {
		return sqlSession.selectOne("community.detail", idx);
	}

	@Override
	public void update(CommunityDTO communityDTO) {
		sqlSession.update("community.update", communityDTO);
	}

	@Override
	public void delete(int idx) {
		sqlSession.delete("community.delete", idx);

	}

	@Override
	public void incrementViewCount(int idx) {
		sqlSession.update("community.incrementHitCount", idx);

	}

	@Override
	public int count() {

		return sqlSession.selectOne("community.count");
	}

	@Override
	public List<CommunityDTO> listPage(int displayPost, int postNum) { // �����͸� 2�� �����ؾ� �ؼ� HashMap �̿�
		HashMap<String, Integer> data = new HashMap<>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sqlSession.selectList("community.listPage", data);
	}

	@Override
	public List<CommunityDTO> communitySearch(int displayPost, int postNum, String searchType, String keyword,
			String category) {

		HashMap<String, Object> data = new HashMap<>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		data.put("searchType", searchType);
		data.put("keyword", keyword);
		data.put("category", category);

		return sqlSession.selectList("community.communitySearch", data);
	}

	@Override
	public int searchCount(String searchType, String keyword, String category) {

		HashMap<String, Object> data = new HashMap<>();

		data.put("searchType", searchType);
		data.put("keyword", keyword);
		data.put("category", category);

		return sqlSession.selectOne("community.searchCount", data);
	}

}
