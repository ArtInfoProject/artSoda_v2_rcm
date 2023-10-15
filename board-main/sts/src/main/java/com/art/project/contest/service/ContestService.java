package com.art.project.contest.service;

import java.util.List;

import com.art.project.contest.dto.ContestDTO;

public interface ContestService {

	//글목록
	public List<ContestDTO> list();

	//글 상세내용
	public ContestDTO detail(int idx);

	//글 작성
	public void write(ContestDTO contestDTO);

	//글 수정
	public void update(ContestDTO contestDTO);

	//글 삭제
	public void delete(int idx);
	
	//게시물 총 갯수
	public int count();

	// 게시물 목록 + 페이징
	public List<ContestDTO> listPage(int displayPost, int postNum);
	
	public List<ContestDTO> listPageSearch(
			  int displayPost, int postNum, String searchType, String keyword);
	
	public int searchCount(String searchType, String keyword);
}
