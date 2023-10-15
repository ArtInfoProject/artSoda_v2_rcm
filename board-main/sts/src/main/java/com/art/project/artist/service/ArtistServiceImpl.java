package com.art.project.artist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.art.project.artist.dao.ArtistDAO;
import com.art.project.artist.dto.ArtistDTO;

@Service
public class ArtistServiceImpl implements ArtistService{

	@Autowired
	private ArtistDAO artistDAO;
	
	@Override
	public List<ArtistDTO> list() {
		
		return artistDAO.list();
	}

	@Override
	public ArtistDTO detailArtist(ArtistDTO artistDTO) {
		return artistDAO.listArtist(artistDTO);
	}
	
	@Override
	public List<ArtistDTO> detailPicture(ArtistDTO artistDTO) {
		return artistDAO.listPicture(artistDTO);
	}

	@Override
	public void write(ArtistDTO artistDTO) {
		
		artistDAO.write(artistDTO);
			
	}

	@Override
	public void update(ArtistDTO artistDTO) {
		
		artistDAO.update(artistDTO);
	}

	@Override
	public void registrationWork(ArtistDTO artistDTO) {
		
		artistDAO.registrationWork(artistDTO);
	}

	@Override
	public void updatePicture(ArtistDTO artistDTO) {
		
		artistDAO.updatePicture(artistDTO);
	}

	//selectOne
	@Override
	public ArtistDTO listOnePicture(ArtistDTO artistDTO) {
	
		return artistDAO.listOnePicture(artistDTO);
	}

	@Override
	public void artistDelete(int idx) {
	
		artistDAO.artistDelete(idx);
	}

	@Override
	public void pictureDelete(int idx, int artist_idx) {
		
		artistDAO.pictureDelete(idx, artist_idx);
	}

	@Override
	public int count() {
		
		return artistDAO.count();
	}

	@Override
	public List<ArtistDTO> listPage(int displayPost, int postNum) {
		 
		return artistDAO.listPage(displayPost, postNum);
	}

	@Override
	public List<ArtistDTO> artistSearch(int displayPost, int postNum, String searchType, String keyword) {
		
		 return  artistDAO.artistSearch(displayPost, postNum, searchType, keyword);
	}

	@Override
	public int searchCount(String searchType, String keyword) {
	
		return artistDAO.searchCount(searchType, keyword);
	}

}
