package kr.ac.jbnu;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.jbnu.dao.BoardDao;
import kr.ac.jbnu.dao.CommentDao;
import kr.ac.jbnu.model.Board;
import kr.ac.jbnu.model.Comment;
import kr.ac.jbnu.model.UserAccount;
import kr.ac.jbnu.util.MyUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardDao boardDao;

	@Autowired
	private CommentDao commentDao;

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("boardView!!!");

		String errorString = null;
		List<Board> list = null;

		list = boardDao.queryBoard();

		if (list.size() == 0) {
			errorString = "게시글 없음";
		}

		model.addAttribute("errorString", errorString);
		model.addAttribute("boardList", list);

		return "boardView";
	}

	@RequestMapping(value = "/board_edit", method = RequestMethod.GET)
	public String boardEditGet(Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("boardEdit!!!");

		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		if (loginedUser == null) {
			return "redirect:/user_register";
		}

		return "boardEditView";
	}

	@RequestMapping(value = "/board_edit", method = RequestMethod.POST)
	@ResponseBody
	public void boardEditPost(Model model, @RequestParam String title, @RequestParam String date,
			@RequestParam String contents, HttpServletRequest request, HttpServletResponse response) {

		logger.info("boardEdit!!!");

		String errorString = null;

		// �꽭�뀡�뿉�꽌 �궡 �씠由꾩쓣 媛��졇�� 湲��벖�씠濡� �솢�슜.
		HttpSession session = request.getSession();
		UserAccount myInfo = MyUtils.getLoginedUser(session);

		if (myInfo == null) {
			errorString = "�꽭�뀡�뿉�꽌 �궗�슜�옄 �젙蹂대�� 遺덈윭�삤吏� 紐삵뻽�뒿�땲�떎.";
			response.setStatus(response.SC_NOT_FOUND);
			System.out.println(errorString);
			return;
		}

		String author = myInfo.getUserName();

		if (title == null || date == null || contents == null || author == null) {
			errorString = "author null point";
			response.setStatus(response.SC_BAD_REQUEST);
			System.out.println(errorString);
			return;
		}

		Board board = new Board();
		board.setTitle(title);
		board.setDate(date);
		board.setContents(contents);
		board.setAuthor(author);
		board.setHits("0");
		boardDao.insertBoard(board);
	}

	@RequestMapping(value = "/board_detail", method = { RequestMethod.GET, RequestMethod.POST })
	public String boardDetailGet(Model model, @RequestParam("board_id") int board_id, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("boardDetailView!!!");

		String errorString = null;
		Board board = null;
		List<Comment> commentList = null;

		board = boardDao.findBoardById(board_id);

		if (board == null) {
			errorString = "게시글이 없습니다";
			response.setStatus(response.SC_NOT_FOUND);
		}

		// 議고쉶�닔 1利앷�
		boardDao.updateBoardHits(board);

		// �빐�떦 寃뚯떆湲��쓽 �뙎湲��뱾 媛��졇�삤湲�
		commentList = commentDao.findCommentsById(board_id);

		model.addAttribute("errorString", errorString);
		model.addAttribute("board", board);

		if (commentList.size() != 0) {
			model.addAttribute("commentList", commentList);
		}

		return "boardDetailView";
	}
}
