package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Comments;
import member.model.vo.Member;

/**
 * Servlet implementation class ReviewDetail
 */
@WebServlet("/reviewDetail.bo")
public class ReviewDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int bId = Integer.parseInt(request.getParameter("bId"));

		BoardService service = new BoardService();
		// 보드
		Board b = service.reviewSelectBoard(bId);
		// 사진 리스트
		ArrayList<Attachment> imgList = service.reviewSelectFiles(bId);

		ArrayList<Comments> comments = new BoardService().reviewCommentsList(bId);// 댓글

		String page = null;
		if (b != null & imgList != null) {
			page = "WEB-INF/views/board/reviewDetail.jsp";
			request.setAttribute("b", b);
			request.setAttribute("imgList", imgList);
			request.setAttribute("comments", comments);
		} else {
			request.setAttribute("msg", "사진게시판 상세보기에 실패하였습니다.");
			page = "WEB-INF/views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}