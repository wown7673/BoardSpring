package kr.co.BoardSpring.Board.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.BoardSpring.Board.service.BoardService;

@Controller
public class Boardcontroller {
	Logger log = Logger.getLogger(this.getClass());

	@Resource(name = "boardService")
	private BoardService boardService;

	@RequestMapping(value = "/board/openBoardList.do")
	public ModelAndView openSampleList(Map<String, Object> commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("/board/boardList");
		log.debug("인터셉터 테스트");

		List<Map<String,Object>> list = boardService.selectBoardList(commandMap);
		log.debug("TEST : "+ list.get(1).get("SEQ"));
		
		mv.addObject("list", list);
		
		return mv;
	}
}
