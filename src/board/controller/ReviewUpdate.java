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

/**
 * Servlet implementation class ReviewUpdate
 */
@WebServlet("/reviewUpdate.no")
public class ReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));

		String boardTitle = request.getParameter("boardTitle");
		String boardContent = request.getParameter("BoardContent");
		String userId = request.getParameter("userId");
		Board Board = new Board(boardNum, boardTitle, boardContent, null, 0, 0, null, userId, null, null);
		ArrayList<Attachment> fileList = new BoardService().correctReviewSelectFiles(boardNum);

		request.setAttribute("Board", Board);
		request.setAttribute("fileList", fileList);
		request.getRequestDispatcher("WEB-INF/views/board/reviewUpdate.jsp").forward(request, response);

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