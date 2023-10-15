package com.art.project.common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Page {

	// 현재 페이지번호
	private int listPageNum;

	// 게시글 총 갯수
	private int count;

	// 1page에 보여지는 게시글 수
	private int postNum = 8;

	// 하단 페이징 번호
	private int pageNum;

	// 출력할 게시물
	private int displayPost;

	// 한번에 표시할 페이징 번호의 갯수
	private int pageNumCnt = 5;

	// 표시되는 페이지 번호 중 첫번째 번호
	private int startPageNum;

	// 표시 페이징 마지막 번호
	private int endPageNum;

	// 이전 표시
	private boolean prev;

	// 다음 표시
	private boolean next;

	// 검색할 내용 카테고리 ex) 글쓴이, 내용, 전체
	private String searchType;

	// 검색할 내용
	private String keyword;

	  
	public void updateCount(int count) { // getter/setter부분 안건드리기위해 만든 메소드
		this.count = count;
		dataCalc();
	}

	public void dataCalc() {

		// 마지막 번호
		this.endPageNum = (int) (Math.ceil((double) this.listPageNum / (double) this.pageNumCnt) * this.pageNumCnt);

		// 시작 번호
		this.startPageNum = this.endPageNum - (this.pageNumCnt - 1);

		// 마지막 번호 재계산
		int endPageNum_tmp = (int) (Math.ceil((double) this.count / (double) this.postNum));

		if (this.endPageNum > endPageNum_tmp) {
			this.endPageNum = endPageNum_tmp;
		}

		this.prev = this.startPageNum == 1 ? false : true;
		this.next = this.endPageNum * this.postNum >= this.count ? false : true;

		this.displayPost = (this.listPageNum - 1) * this.postNum;

	}

	public String getSearchTypeKeyword() {
		if (searchType.equals("") || keyword.equals("")) {
			return "";
		} else {
			return "&searchType=" + searchType + "&keyword=" + keyword;
		}
	}
	  
}
