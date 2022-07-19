package common;

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
import part_time.model.service.PartTimeService;
import part_time.model.vo.Image;
import part_time.model.vo.PartTime;

/**
 * Servlet implementation class Main
 */
@WebServlet("/main.md")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 * 
	 */
	public Main() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PartTimeService service = new PartTimeService();

		// 단기알바
		int boardType = 3;
		ArrayList<PartTime> boardlist1 = service.boardAllSelectList(boardType);

		ArrayList<Image> filelist1 = service.fileAllSelectList(boardType);

		// 일일알바
		boardType = 4;
		ArrayList<PartTime> boardlist2 = service.boardAllSelectList(boardType);

		ArrayList<Image> filelist2 = service.fileAllSelectList(boardType);

		// 알바후기
		boardType = 1;
		ArrayList<Board> boardlist3 = new BoardService().boardAllSelectList(boardType);

		ArrayList<Attachment> filelist3 = new BoardService().fileAllSelectList(boardType);

		request.setAttribute("boardlist1", boardlist1);
		request.setAttribute("boardlist2", boardlist2);
		request.setAttribute("boardlist3", boardlist3);
		request.setAttribute("filelist1", filelist1);
		request.setAttribute("filelist2", filelist2);
		request.setAttribute("filelist3", filelist3);
		request.getRequestDispatcher("WEB-INF/views/common/main.jsp").forward(request, response);

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
