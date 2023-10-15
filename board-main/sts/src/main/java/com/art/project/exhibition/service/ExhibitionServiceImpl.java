package com.art.project.exhibition.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.project.exhibition.dao.ExhibitionDAO;
import com.art.project.exhibition.dto.ExhibitionDTO;

@Service
public class ExhibitionServiceImpl implements ExhibitionService {

	@Autowired
	private ExhibitionDAO exhibitionDAO;

	@Override
	public List<ExhibitionDTO> list() {

		return exhibitionDAO.list();
	}

	@Override
	public ExhibitionDTO detail(int idx) {

		return exhibitionDAO.detail(idx);
	}

	@Override
	public void write(ExhibitionDTO exhibitionDTO) {

		exhibitionDAO.write(exhibitionDTO);
	}

	@Override
	public void update(ExhibitionDTO exhibitionDTO) {

		exhibitionDAO.update(exhibitionDTO);
	}

	@Override
	public void delete(int idx) {

		exhibitionDAO.delete(idx);
	}

	@Override
	public int count() {

		return exhibitionDAO.count();
	}

	@Override
	public List<ExhibitionDTO> listPage(int displayPost, int postNum) {

		return exhibitionDAO.listPage(displayPost, postNum);
	}

	@Override
	public List<ExhibitionDTO> exhibitionSearch(int displayPost, int postNum, String searchType, String keyword, String category, String status) {

		return exhibitionDAO.exhibitionSearch(displayPost, postNum, searchType, keyword, category, status);
	}

	@Override
	public int searchCount(String searchType, String keyword, String category, String status) {

		return exhibitionDAO.searchCount(searchType, keyword, category, status);
	}

}
