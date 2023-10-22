package com.art.project.artist.dao;

import java.util.List;

import com.art.project.artist.dto.ArtistDTO;

public interface ArtistDAO {

	//��Ƽ��Ʈ �۸��
	List<ArtistDTO> list();

	//��������
	ArtistDTO listArtist(ArtistDTO artistDTO);
	
	List<ArtistDTO> listPicture(ArtistDTO artistDTO);

	//��Ƽ��Ʈ �����ϱ�
	void artistDelete(int idx);
	
	//��ǰ �����ϱ�
	void pictureDelete(int idx, int artist_idx);

	//��Ƽ��Ʈ �۾���
	void write(ArtistDTO artistDTO);

	//��Ƽ��Ʈ �۾��� ����
	void update(ArtistDTO artistDTO);

	//��Ƽ��Ʈ ��ǰ ���
	void registrationWork(ArtistDTO artistDTO);

	//��ǰ ����
	void updatePicture(ArtistDTO artistDTO);
	
	//�� ��Ƽ��Ʈ�� ����ǰ �󼼺���
	ArtistDTO listOnePicture(ArtistDTO artistDTO);

	// �Խù� �� ����
	public int count();
	
	// �Խù� ��� + ����¡
	public List<ArtistDTO> listPage(int displayPost, int postNum);
	
	public List<ArtistDTO> artistSearch(
			   int displayPost, int postNum, String searchType, String keyword);

	int searchCount(String searchType, String keyword);

}