package kr.co.BoardSpring.Board.service;

import java.util.List;
import java.util.Map;

import kr.co.BoardSpring.common.common.CommandMap;

public interface BoardService {

	List<Map<String, Object>> selectBoardList(CommandMap commandMap);

}
