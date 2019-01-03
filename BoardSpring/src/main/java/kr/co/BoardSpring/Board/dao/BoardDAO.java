package kr.co.BoardSpring.Board.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.co.BoardSpring.common.common.CommandMap;
import kr.co.BoardSpring.common.dao.AbstractDAO;

@Repository("boardDAO")
public class BoardDAO extends AbstractDAO{

	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) {
		List<Map<String, Object>> list = (List<Map<String, Object>> )selectList("board.selectBoardList", map);
		return list;
	}

	public int selectBoardCnt() {
		// TODO Auto-generated method stub	
		return (Integer) selectOne("board.selectBoardCnt");
	}

	public Map<String, Object> selectBoard(Map<String, Object> map) {
		Map<String,Object> board = (Map<String, Object>)selectOne("board.selectBoard", map);
		System.out.println(board.get("SEQ"));
		return board;
	}

	public void insertBoard(Map<String, Object> map) {
		insert("board.insertBoard", map);
		
	}

	
}
