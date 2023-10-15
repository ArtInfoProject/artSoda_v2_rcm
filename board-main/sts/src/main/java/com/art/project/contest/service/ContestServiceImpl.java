package com.art.project.contest.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.project.contest.dao.ContestDAO;
import com.art.project.contest.dto.ContestDTO;

@Service
public class ContestServiceImpl implements ContestService {

	@Autowired
	ContestDAO contestDAO;
	
	@Override
	public List<ContestDTO> list() {
		
		return contestDAO.list();
	}

	@Override
	public ContestDTO detail(int idx) {
		
		return contestDAO.detail(idx);
	}

	@Override
	public void write(ContestDTO contestDTO) {
		
		contestDAO.write(contestDTO);
	}

	@Override
	public void update(ContestDTO contestDTO) {
		
		contestDAO.update(contestDTO);
	}

	@Override
	public void delete(int idx) {
		contestDAO.delete(idx);
		
	}

	@Override
	public int count() {
		
		return contestDAO.count();
	}

	@Override
	public List<ContestDTO> listPage(int displayPost, int postNum) {
		
		return contestDAO.listPage(displayPost, postNum);
	}

	@Override
	public List<ContestDTO> listPageSearch(int displayPost, int postNum, String searchType, String keyword) {
		
		return contestDAO.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
	@Override
	   public int searchCount(String searchType, String keyword) {
	      
	      return contestDAO.searchCount(searchType, keyword);
	   }

}
