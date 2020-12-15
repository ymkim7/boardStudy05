package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.BoardService;
import kr.co.util.Pagination;
import kr.co.util.Search;
import kr.co.vo.BoardVO;
import kr.co.vo.ReplyVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	@RequestMapping(value = "/getBoardList", method = RequestMethod.GET)
	public String getBoardList(@RequestParam(required = false, defaultValue = "1") int page
							 , @RequestParam(required = false, defaultValue = "1") int range
							 , @RequestParam(required = false, defaultValue = "title") String searchType
							 , @RequestParam(required = false) String keyword
							 , Model model) throws Exception {
		logger.info("getBoardList");
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//전체 게시글 갯수
		int listCnt = service.getBoardListCnt(search);

		search.pageInfo(page, range, listCnt);
		
		model.addAttribute("boardList", service.getBoardList(search));
		model.addAttribute("pagination", search);
		
		return "board/index";
	}
	
	@RequestMapping(value = "/boardForm", method = RequestMethod.GET)
	public String boardForm(@ModelAttribute("boardVO") BoardVO boardVO, Model model) throws Exception {
		logger.info("boardForm");
		
		return "board/boardForm";
	}
	
	@RequestMapping(value = "/saveBoard", method = RequestMethod.POST)
	public String saveBoard(@ModelAttribute("boardVO") BoardVO boardVO
						  , @RequestParam("mode") String mode
						  , RedirectAttributes rttr) throws Exception {
		logger.info("saveBoard");
		
		if(mode.equals("edit")) {
			service.updateBoard(boardVO);
		} else {
			service.insertBoard(boardVO);
		}
		
		return "redirect:/board/getBoardList";
	}
	
	@RequestMapping(value = "/getBoardContent", method = RequestMethod.GET)
	public String getBoardContent(Model model, @RequestParam("bid") int bid) throws Exception {
		logger.info("getBoardContent");
		
		model.addAttribute("boardContent", service.getBoardContent(bid));
		model.addAttribute("replyVO", new ReplyVO());
		
		return "board/boardContent";
	}
	
	@RequestMapping(value = "/editForm", method = RequestMethod.GET)
	public String editForm(@RequestParam("bid") int bid, @RequestParam("mode") String mode, Model model) throws Exception {
		logger.info("editForm");
		
		model.addAttribute("boardContent", service.getBoardContent(bid));
		model.addAttribute("mode", mode);
		model.addAttribute("boardVO", new BoardVO());
		
		return "board/boardForm";
	}
	
	@RequestMapping(value = "/deleteBoard", method = RequestMethod.GET)
	public String deleteBoard(RedirectAttributes rttr, @RequestParam("bid") int bid) throws Exception {
		logger.info("deleteBoard");
		
		service.deleteBoard(bid);
		
		return "redirect:/board/getBoardList";
	}

}
