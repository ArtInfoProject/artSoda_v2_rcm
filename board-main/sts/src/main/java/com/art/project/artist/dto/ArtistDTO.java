package com.art.project.artist.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ArtistDTO {

	private int artist_idx; // ��Ƽ��Ʈ ��ȣ(PK)

	private String artist_name; // �̸�

	private String artist_note; // �۰���Ʈ

	private String artist_career; // ���/�̷�

	private String artist_photo;	//�۰������ʻ���
	
	private String artist_nationality;	// �۰� ����

	private String artist_edu;	// �۰� �з�

	private String artistThumbImg;	// 썸네일이미지
	
	//artist_pictures table column
	private int picture_idx; // ��ǰ��ȣ(PK)

	private String picture_title; // ��ǰ����

	private String picture_file; // ��ǰ����1

	private String picture_size;	// ��ǰ ũ��
	
	private String picture_supplies;	// ��ǰ �����
	
	private String pictureThumbImg;	// 썸네일이미지
}
