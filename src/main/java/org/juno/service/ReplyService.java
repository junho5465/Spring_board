package org.juno.service;

import java.util.List;

import org.juno.domain.Criteria;
import org.juno.domain.ReplyVO;

public interface ReplyService {
	public int register(ReplyVO vo);

	public ReplyVO get(Long rno);

	public int modify(ReplyVO vo);

	public int remove(Long rno);

	public List<ReplyVO> getList(Criteria cri, Long bno);
}
