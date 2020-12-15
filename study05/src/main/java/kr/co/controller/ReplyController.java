package kr.co.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.service.BoardService;
import kr.co.vo.ReplyVO;

@RestController
@RequestMapping(value = "/restBoard")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Autowired
	private BoardService service;

	@RequestMapping(value = "/getReplyList", method = RequestMethod.POST)
	public List<ReplyVO> getReplyList(@RequestParam("bid") int bid) throws Exception {
		logger.info("getReplyList");
		
		return service.getReplyList(bid);
	}

	@RequestMapping(value = "/saveReply", method = RequestMethod.POST)
	public Map<String, Object> saveReply(@RequestBody ReplyVO replyVO) throws Exception {
		logger.info("saveReply");
		
		Map<String, Object> result = new HashMap<>();
		
		try {
			service.saveReply(replyVO);
			result.put("status", "OK");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}
		
		return result;
	}

	@RequestMapping(value = "/updateReply", method = RequestMethod.POST)
	public Map<String, Object> updateReply(ReplyVO replyVO) throws Exception {
		logger.info("updateReply");
		
		Map<String, Object> result = new HashMap<>();
		
		try {
			service.updateReply(replyVO);
			result.put("status", "OK");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}
		
		return result;
	}

	@RequestMapping(value = "/deleteReply", method = RequestMethod.POST)
	public Map<String, Object> deleteReply(@RequestParam("rid") int rid, ReplyVO replyVO) throws Exception {
		logger.info("deleteReply");
		
		Map<String, Object> result = new HashMap<>();
		
		try {
			service.deleteReply(rid);
			result.put("status", "OK");
		} catch(Exception e) {
			e.printStackTrace();
			result.put("status", "false");
		}
		
		return result;
	}

}
