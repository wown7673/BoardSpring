package kr.co.BoardSpring.Board.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.co.BoardSpring.Board.dao.BoardDAO;
import kr.co.BoardSpring.common.to.PageInfo;

@Service("boardService")
public class BoardServiceImpl implements BoardService{

	@Resource(name="boardDAO")
	private BoardDAO boardDAO;
	
	@Override
	public PageInfo selectBoardList(Map<String, Object> map) {
		
		int page = Integer.parseInt((String)map.get("page"));
		int totalCnt = boardDAO.selectBoardCnt();
		PageInfo pageinfo = new PageInfo(page, totalCnt);
		int startRow = pageinfo.getStartRow();
		int endRow = pageinfo.getEndRow();

		map.put("STARTROW", startRow);
		map.put("ENDROW", endRow);
		
		
		
		List<Map<String,Object>> list = boardDAO.selectBoardList(map);
		pageinfo.setList(list);
		
		//System.out.println( boardDAO.selectBoardList(map) );
		
		return pageinfo;
	}

	@Override
	public Map<String, Object> selectBoard(Map<String, Object> map) {
		Map<String,Object> board = boardDAO.selectBoard(map);
		return board;
	}

	@Override
	public void insertBoard(Map<String, Object> map) {
		boardDAO.insertBoard(map);
		
	}


}
