package org.juno.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.juno.domain.BoardVO;
import org.juno.domain.Criteria;
import org.juno.domain.ReplyVO;

public interface BoardMapper {
//	@Select("select * from tbl_board where bno>0")
	public List<BoardVO> getList();	//select
	public void insert(BoardVO board);
	public BoardVO read(long bno);
	public int delete(long bno);
	public int update(BoardVO board);
	public int insertSelectKey(BoardVO board);
	public List<BoardVO> getListWithPaging(Criteria cri);
	public int getTotalCount(Criteria cri);
}
