package com.art.project.exhibition.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.art.project.exhibition.dto.ExhibitionDTO;

@Repository
public class ExhibitionDAOImpl implements ExhibitionDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ExhibitionDTO> list() {

		return sqlSession.selectList("exhibition.list");
	}

	@Override
	public ExhibitionDTO detail(int idx) {

		return sqlSession.selectOne("exhibition.detail", idx);
	}

	@Override
	public void write(ExhibitionDTO exhibitionDTO) {

		sqlSession.insert("exhibition.write", exhibitionDTO);

	}

	@Override
	public void update(ExhibitionDTO exhibitionDTO) {
		sqlSession.update("exhibition.update", exhibitionDTO);

	}

	@Override
	public void delete(int idx) {
		sqlSession.delete("exhibition.delete", idx);
	}

	@Override
	public int count() {

		return sqlSession.selectOne("exhibition.count");
	}

	@Override
	public List<ExhibitionDTO> listPage(int displayPost, int postNum) {
		Map<String, Integer> data = new HashMap<String, Integer>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sqlSession.selectList("exhibition.listPage", data);
	}

	@Override
	public List<ExhibitionDTO> exhibitionSearch(int displayPost, int postNum, String searchType, String keyword, String category, String status) {
		Map<String, Object> data = new HashMap<>();

//		����¡ó��
		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

//		�˻�
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		data.put("category", category);
		data.put("status", status);

		return sqlSession.selectList("exhibition.exhibitionSearch", data);
	}

	@Override
	public int searchCount(String searchType, String keyword, String category, String status) {

		Map<String, Object> data = new HashMap<>();

		data.put("searchType", searchType);
		data.put("keyword", keyword);
		data.put("category", category);
		data.put("status", status);

		return sqlSession.selectOne("exhibition.searchCount", data);
	}

}
