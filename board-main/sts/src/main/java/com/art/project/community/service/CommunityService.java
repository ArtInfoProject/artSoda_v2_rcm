package com.art.project.community.service;

import java.util.List;

import com.art.project.community.dto.CommunityDTO;

//Service�� �����Ͻ� ������ ���� �κ��̴�.
//controller�� request�� ������ ������ service�� �����ϰ�,
//���޹��� service�� ����Ͻ� ������ ó���Ѵ�. DAO�� �����ͺ��̽��� �����ϰ�, 
//DTO�� �����͸� ���޹��� ����, ������ ó���� �� ��ȯ�Ѵ�
public interface CommunityService {

	// �۸��
	public List<CommunityDTO> list();

	// �۾���
	public void write(CommunityDTO communityDTO);

	// �� �󼼺���
	public CommunityDTO detail(int idx);

	// �ۼ���
	public void update(CommunityDTO community);

	// �ۻ���
	public void delete(int idx);

	// ��ȸ�� ����
	public void incrementHitCount(int idx);

	// �Խù� �� ����
	public int count();

	// �Խù� ��� + ����¡
	public List<CommunityDTO> listPage(int displayPost, int postNum);

	// �Խù� ��� + ����¡ + �˻�
	public List<CommunityDTO> communitySearch(int displayPost, int postNum, String searchType, String keyword,String category);
	
	// �Խù� �� ���� + �˻� ����
	public int searchCount(String searchType, String keyword,String category);
}
