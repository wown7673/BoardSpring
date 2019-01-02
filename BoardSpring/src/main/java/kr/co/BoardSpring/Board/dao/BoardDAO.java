package kr.co.BoardSpring.Board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.BoardSpring.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) {
		List<Map<String, Object>> list = (List<Map<String, Object>> )selectList("board.selectBoardList", commandMap);
		return list;
	}

	
}
