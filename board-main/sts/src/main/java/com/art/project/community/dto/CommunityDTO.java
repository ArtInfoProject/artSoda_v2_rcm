package com.art.project.community.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class CommunityDTO {
	

	private int community_idx; // �Խñ۹�ȣ(PK)

	private int member_idx; // ������Թ�ȣ(FK)

	private LocalDateTime community_registDate; // �����

	private String community_title; // ����

	private String member_name; // �ۼ���(FK)

	private String community_contents; // ����

	private String community_category; // ī�װ�

	private String community_file; // ���ε�(����)

	private String community_url; // ���ε�(��ũ)

	private int community_hits; // ��ȸ��
		
	private String communityThumbImg;
	
//	private int prevNum; //이전글의 글번호
//	
//	private int nextNum; //다음글의 글번호
//	
//	private String prevTitle; //이전글의 제목
//	
//	private String nextTitle; //다음글의 제목
}
