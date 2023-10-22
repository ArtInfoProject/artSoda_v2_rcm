package com.art.project.artist.service;

import java.util.List;

import com.art.project.artist.dto.ReplyDTO;

public interface ReplyService {
	
	// 댓글 조회
	public List<ReplyDTO> list(int artist_idx) throws Exception;

	// 댓글 조회
	public void write(ReplyDTO replyDTO) throws Exception;

	// 댓글 수정
	public void update(ReplyDTO replyDTO) throws Exception;

	// 댓글 삭제
	public void delete(ReplyDTO replyDTO) throws Exception;
}