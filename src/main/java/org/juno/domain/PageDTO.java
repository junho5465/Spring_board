package org.juno.domain;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class PageDTO {
	private int startPage; // 화면에 보여지는 페이지의 시작번호
	private int endPage; // 화면에 보여지는 페이지의 끝번호
	private boolean prev, next; // 이전 혹은 다음 페이지 존재 여부
	private int total; // 전체 데이터 수
	private Criteria cri;

	public PageDTO(Criteria cri, int total) {
		this.cri = cri;
		this.total = total;
		this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.)) * 10;
		this.startPage = this.endPage - 9;
		//끝 페이지 번호 = (현재 페이지 번호 / 화면에 보여질 페이지 번호의 갯수) * 화면에 보여질 페이지 번호의 갯수
		int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));
		if (realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
