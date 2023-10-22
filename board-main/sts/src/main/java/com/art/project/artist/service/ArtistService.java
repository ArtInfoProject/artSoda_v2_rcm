package com.art.project.artist.service;

import java.util.List;

import com.art.project.artist.dto.ArtistDTO;

public interface ArtistService {

	//��Ƽ��Ʈ ���
	List<ArtistDTO> list();

	//��������
	ArtistDTO detailArtist(ArtistDTO artistDTO);
	
	List<ArtistDTO> detailPicture(ArtistDTO artistDTO);

	//��Ƽ��Ʈ ���
	void write(ArtistDTO artistDTO);

	//��Ƽ��Ʈ ����
	void update(ArtistDTO artistDTO);

	//��ǰ���
	void registrationWork(ArtistDTO artistDTO);

	//��ǰ����
	void updatePicture(ArtistDTO artistDTO);
	
	//��ǰ�ϳ���
	ArtistDTO listOnePicture(ArtistDTO artistDTO);

	//��Ƽ��Ʈ ����
	void artistDelete(int idx);
	
	//��ǰ ����
	void pictureDelete(int idx, int artist_idx);
	
	// �Խù� �� ����
	public int count();
	
	// �Խù� ��� + ����¡
	public List<ArtistDTO> listPage(int displayPost, int postNum);
	 
	public List<ArtistDTO> artistSearch(
			   int displayPost, int postNum, String searchType, String keyword);
	
	// �Խù� �� ���� + �˻� ����
	public int searchCount(String searchType, String keyword);
}