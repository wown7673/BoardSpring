package kr.co.BoardSpring.Board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.BoardSpring.Board.dao.BoardDAO;
import kr.co.BoardSpring.common.common.CommandMap;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(CommandMap commandMap) {
		
		List<Map<String,Object>> list = boardDAO.selectBoardList(commandMap);
		
		return list;
	}

}
