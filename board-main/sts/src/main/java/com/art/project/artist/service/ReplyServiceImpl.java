package com.art.project.artist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.art.project.artist.dao.ReplyDAO;
import com.art.project.artist.dto.ReplyDTO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Autowired
	private ReplyDAO replyDAO;
	
	@Override
	public List<ReplyDTO> list(int artist_idx) throws Exception {
		return replyDAO.list(artist_idx);
	}

	@Override
	public void write(ReplyDTO replyDTO) throws Exception {
		replyDAO.write(replyDTO);
	}

	@Override
	public void update(ReplyDTO replyDTO) throws Exception {
		replyDAO.update(replyDTO);
	}

	@Override
	public void delete(ReplyDTO replyDTO) throws Exception {
		replyDAO.delete(replyDTO);
	}

}