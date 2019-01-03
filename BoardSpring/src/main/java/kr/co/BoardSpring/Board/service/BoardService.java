package kr.co.BoardSpring.Board.service;

import java.util.List;
import java.util.Map;

import kr.co.BoardSpring.common.common.CommandMap;
import kr.co.BoardSpring.common.to.PageInfo;

public interface BoardService {

	PageInfo selectBoardList(Map<String, Object> map);

	Map<String, Object> selectBoard(Map<String, Object> map);

	void insertBoard(Map<String, Object> map);

}
