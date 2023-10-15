package com.art.project.contest.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ContestDTO {

	private int contest_idx; // 게시글 번호(PK)

	private String contest_title; // 제목

	private LocalDateTime contest_registDate; // 게시글 등록일자

	private String contest_url; // 링크

	private Date contest_start; // 공모전시작날짜

	private Date contest_end; // 공모전종료날짜

	private String contest_region; // 공모전지역

	private String contest_location;// 공모전장소

	private String contest_file; // 공모이미지

	private String contest_contents; // 공모내용
	
	private String contest_writer; // 참여작가
	
	private String contestThumbImg;	//썸네일 이미지
	
	private String contest_status;	//공모전 진행 상태
}
