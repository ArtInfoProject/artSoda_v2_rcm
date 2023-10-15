package com.art.project.contest.dao;

import java.util.List;

import com.art.project.contest.dto.ContestDTO;

public interface ContestDAO {
	
	//글 목록
	public List<ContestDTO> list();

	//글 상세내용
	public ContestDTO detail(int idx);

	//글 쓰기
	public void write(ContestDTO contestDTO);

	//글 수정
	public void update(ContestDTO contestDTO);

	//글 삭제
	public void delete(int idx);

	//글 삭제
	public int count();
	
	//게시물 목록 + 페이징
	public List<ContestDTO> listPage(int displayPost, int postNum);
	
	// 게시물 목록 + 페이징 + 검색
	 public List<ContestDTO> listPageSearch(
	   int displayPost, int postNum, String searchType, String keyword);
	 
	 public int searchCount(String searchType, String keyword);
}
