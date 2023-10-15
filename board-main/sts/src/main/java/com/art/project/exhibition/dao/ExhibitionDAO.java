package com.art.project.exhibition.dao;

import java.util.List;

import com.art.project.exhibition.dto.ExhibitionDTO;

public interface ExhibitionDAO {

	// ���� ���
	public List<ExhibitionDTO> list();

	// ���� �󼼳���
	public ExhibitionDTO detail(int idx);

	// ���õ��
	public void write(ExhibitionDTO exhibitionDTO);

	// ���� �� ����
	public void update(ExhibitionDTO exhibitionDTO);

	// ���� �� ����
	public void delete(int idx);

	// �� ��ü ���� ���ϱ�
	public int count();

	// �Խù� ��� + ����¡
	public List<ExhibitionDTO> listPage(int displayPost, int postNum);

	public List<ExhibitionDTO> exhibitionSearch(int displayPost, int postNum, String searchType, String keyword, String category, String status);

	public int searchCount(String searchType, String keyword, String category, String status);
	
	
}
