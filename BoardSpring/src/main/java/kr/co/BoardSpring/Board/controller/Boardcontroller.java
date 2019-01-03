package kr.co.BoardSpring.Board.controller;

import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.BoardSpring.Board.service.BoardService;
import kr.co.BoardSpring.common.common.CommandMap;
import kr.co.BoardSpring.common.to.PageInfo;

@Controller
public class Boardcontroller {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/board/openBoardList.do")
	public ModelAndView openBoardList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");

		return mv;
	}
	
	
	@RequestMapping(value = "/board/selectBoardList.do")
	public ModelAndView selectBoardList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		Map<String,Object> map = commandMap.getMap();
		
		PageInfo pageInfo = boardService.selectBoardList(map);
		log.debug("게시판목록 갯수 : "+ pageInfo.getList().size());
	
		mv.addObject("paging", pageInfo);
		return mv;
	}	
	
	@RequestMapping(value = "/board/selectBoardDetail.do")
	public ModelAndView selectBoardDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardDetail");

		Map<String,Object> map = commandMap.getMap();
		
		Map<String,Object> board = boardService.selectBoard(map);
		
		mv.addObject("board", board);
		
		return mv;
	}	
	
	
	@RequestMapping(value = "/board/writeBoard.do")
	public ModelAndView writeBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/board/writeBoard");

		return mv;
	}		
	
	
	@RequestMapping(value = "/board/insertBoard.do")
	public ModelAndView insertBoard(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");

		Map<String,Object> map = commandMap.getMap();
		
		boardService.insertBoard(map);
			
		return mv;
	}	
}
