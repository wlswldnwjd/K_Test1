package org.zerock.domain;

import lombok.Data;

@Data
public class PageDTO {
	//페이지바 이전가기, 이후가기, 시작값, 끝값
	private boolean prev,next;
	private int startPage; 
	private int endPage;
	
	private Long total; 	//전체개수
	private Criteria cri;	//몇 개씩 보여줄지, 현재 페이지
	
	public PageDTO(Criteria cri, Long total) {
		this.cri=cri;
		this.total=total;
		
		//endPage = 올림처리(현재페이지/10) * 10
		endPage= (int)Math.ceil( cri.getPageNum()/10.0 ) * 10;		//10.0 double(소수점)값
		
		startPage = endPage-9;
		
		prev = startPage > 1;   // != 첫 번째 페이지바가 아니라면 (시작값이 1이 아님)
		
		//진짜 마지막 페이지바 번호 =  올림처리(전체 글 개수 / 한 페이지에 보여줄 개수)
		int realEnd = (int)Math.ceil((double)total / cri.getAmount());
		//							=(total*1.0)
		
		if(endPage > realEnd) {	//마지막 페이지바 번호가 실제페이지바 번호보다 크다면
			endPage = realEnd;	//마지막 페이지바 번호를 실제페이지바 값으로 변경
		
		}
			next = endPage < realEnd;
		
	}
}
