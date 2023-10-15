package com.art.project.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.project.community.dao.CommunityDAO;
import com.art.project.community.dto.CommunityDTO;

@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	private CommunityDAO communityDAO;

	@Override
	public List<CommunityDTO> list() { // ȸ�����

		return communityDAO.list();
	}

	// 글 수정
	@Override
	public void write(CommunityDTO communityDTO) {

		communityDAO.write(communityDTO);
	}

	@Override
	public CommunityDTO detail(int idx) {

		return communityDAO.detail(idx);
	}

	@Override
	public void update(CommunityDTO communityDTO) {

		communityDAO.update(communityDTO);
	}

	@Override
	public void delete(int idx) {

		communityDAO.delete(idx);
	}

	@Override
	public void incrementHitCount(int idx) {

		communityDAO.incrementViewCount(idx);
	}

	@Override
	public int count() {

		return communityDAO.count();
	}

	@Override
	public List<CommunityDTO> listPage(int displayPost, int postNum) {

		return communityDAO.listPage(displayPost, postNum);
	}

	@Override
	public List<CommunityDTO> communitySearch(int displayPost, int postNum, String searchType, String keyword,
			String category) {

		return communityDAO.communitySearch(displayPost, postNum, searchType, keyword, category);
	}

	@Override
	public int searchCount(String searchType, String keyword, String category) {
		return communityDAO.searchCount(searchType, keyword, category);
	}

}
