package com.art.project.exhibition.service;

import java.util.List;

import com.art.project.exhibition.dto.ExhibitionDTO;

public interface ExhibitionService {

	//���ø��
	public List<ExhibitionDTO> list();

	//���û󼼳���
	public ExhibitionDTO detail(int idx);
	
	//���� ���
	public void write(ExhibitionDTO exhibitionDTO);

	//���ñ� ����
	public void update(ExhibitionDTO exhibitionDTO);

	//���ñ� ����
	public void delete(int idx);
	
	public int count();
	
	public List<ExhibitionDTO> listPage(int displayPost, int postNum);
	
	public List<ExhibitionDTO> exhibitionSearch(int displayPost, int postNum, String searchType, String keyword, String category, String status);
	
	public int searchCount(String searchType, String keyword, String category, String status);
}
