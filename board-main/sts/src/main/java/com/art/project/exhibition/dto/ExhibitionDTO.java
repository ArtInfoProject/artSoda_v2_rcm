package com.art.project.exhibition.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ExhibitionDTO {

	private int exhibition_idx; // �Խñ� ��ȣ(PK)

	private String exhibition_title; // ����ȸ ����
	
	private String exhibition_writer; // �۰�

	private LocalDateTime exhibition_registDate; // �Խñ� �������

	private Date exhibition_start; // ���ý��۳�¥

	private Date exhibition_end; // �������ᳯ¥

	private String exhibition_region; // ��������

	private String exhibition_location; // �������

	private String exhibition_img; // �����̹���

	private String exhibition_contents; // ���ó���

	private String exhibition_url; // ��ũ

	private String exhibition_category; // ����(����/��ü)

	private int exhibition_hits; // ��ȸ��

	private String exhibitionThumbImg;
}
