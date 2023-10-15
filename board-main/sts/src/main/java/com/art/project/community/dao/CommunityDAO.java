package com.art.project.community.dao;

import java.util.List;

import com.art.project.community.dto.CommunityDTO;

public interface CommunityDAO { // db�� ���� sql��

	public List<CommunityDTO> list(); // ��ȸ

	public void write(CommunityDTO communityDTO); // �۾���

	public CommunityDTO detail(int idx); // �� �󼼺���

	public void update(CommunityDTO communityDTO); // �ۼ���

	public void delete(int idx); // �� ����

	public void incrementViewCount(int idx); // ��ȸ�� ����

	public int count(); // �� ��ü ���� ���ϱ�

	public List<CommunityDTO> listPage(int displayPost, int postNum);

	public List<CommunityDTO> communitySearch(int displayPost, int postNum, String searchType, String keyword, String category);

	public int searchCount(String searchType, String keyword,String category);

}
