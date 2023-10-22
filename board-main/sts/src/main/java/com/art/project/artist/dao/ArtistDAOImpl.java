package com.art.project.artist.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.art.project.artist.dto.ArtistDTO;

@Repository
public class ArtistDAOImpl implements ArtistDAO {

	@Autowired
	SqlSession sqlSession;

	@Override
	public List<ArtistDTO> list() {

		return sqlSession.selectList("artist.list");
	}

	@Override
	public ArtistDTO listArtist(ArtistDTO artistDTO) {
		return sqlSession.selectOne("artist.detail_artist", artistDTO);
	}

	@Override
	public List<ArtistDTO> listPicture(ArtistDTO artistDTO) {
		return sqlSession.selectList("artist.detail_picture", artistDTO);
	}

	@Override
	public void write(ArtistDTO artistDTO) {
		sqlSession.insert("artist.artist_write", artistDTO);

	}

	@Override
	public void update(ArtistDTO artistDTO) {

		sqlSession.update("artist.update_artist", artistDTO);
	}

	@Override
	public void registrationWork(ArtistDTO artistDTO) {
		sqlSession.insert("artist.pictures_write", artistDTO);
	}

	@Override
	public void updatePicture(ArtistDTO artistDTO) {

		sqlSession.update("artist.update_pictures", artistDTO);
	}

	@Override
	public ArtistDTO listOnePicture(ArtistDTO artistDTO) {

		return sqlSession.selectOne("artist.selectOnePicture", artistDTO);
	}

	@Override
	public void artistDelete(int idx) {

		sqlSession.delete("artist.artistDelete", idx);
	}

	@Override
	public void pictureDelete(int idx, int artist_idx) {
		Map<String, Object> data = new HashMap<>();
		data.put("picture_idx", idx);
		data.put("artist_idx", artist_idx);
		
		sqlSession.delete("artist.pictureDelete", data);

	}

	@Override
	public int count() {

		return sqlSession.selectOne("artist.count");
	}

	@Override
	public List<ArtistDTO> listPage(int displayPost, int postNum) {
		Map<String, Object> data = new HashMap<>();

		data.put("displayPost", displayPost);
		data.put("postNum", postNum);

		return sqlSession.selectList("artist.listPage", data);
	}

	@Override
	public List<ArtistDTO> artistSearch(int displayPost, int postNum, String searchType, String keyword) {
		
		 Map<String, Object> data = new HashMap<String, Object>();
		  
		  data.put("displayPost", displayPost);
		  data.put("postNum", postNum);
		  
		  data.put("searchType", searchType);
		  data.put("keyword", keyword);
		  
		  return sqlSession.selectList("artist.artistSearch", data);
	}

	@Override
	public int searchCount(String searchType, String keyword) {
		Map<String, Object> data = new HashMap<>();
		
		data.put("searchType", searchType);
		data.put("keyword", keyword);
		
		return sqlSession.selectOne("artist.searchCount", data);
	}
}