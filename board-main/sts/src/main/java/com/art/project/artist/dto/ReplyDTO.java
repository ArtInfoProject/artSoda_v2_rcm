package com.art.project.artist.dto;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class ReplyDTO {

	private int reply_idx;	//rno

	private int artist_idx;	//bord_idx

	private String member_name;	//writer

	private String reply_content;

	private LocalDateTime reply_registDate;
}