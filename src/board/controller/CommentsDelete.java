package board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.GsonBuilder;

import board.model.service.BoardService;
import board.model.vo.Comments;

/**
 * Servlet implementation class CommentsDelete
 */
@WebServlet("/commentsDelete.bo")
public class CommentsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommentsDelete() {
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
		int mentNum = Integer.parseInt(request.getParameter("mentNum"));
		System.out.println(bId + "댓글삭제 bid");
		System.out.println(mentNum + "댓글삭제 mentNum");
		int result = new BoardService().commentsDelete(bId, mentNum);

		System.out.println(result + "삭제하기 result값");

		String msg = null;
		if (result > 0) {
			msg = "ok";
		}
		response.getWriter().print(msg);
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