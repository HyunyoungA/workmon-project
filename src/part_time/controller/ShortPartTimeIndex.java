package part_time.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import part_time.model.service.PartTimeService;
import part_time.model.vo.PageInfo;
import part_time.model.vo.PartTime;

/**
 * Servlet implementation class BoardListServlet
 */
@WebServlet("/shortPartTimeIndex.do")
public class ShortPartTimeIndex extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShortPartTimeIndex() {
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

		int listCount; // 게시물 총 개수
		int currentPage; // 현재 페이지 표시
		int pageLimit; // 한 페이지에서 표시될 페이징 수
		int boardLimit; // 한 페이지에 보일 게시글 최대 개수
		int maxPage; // 전체 페이지 중 가장 마지막 페이지
		int startPage; // 페이징 된 페이지 중 시작 페이지
		int endPage;

		listCount = service.getListCount();
		System.out.println(listCount);
		currentPage = 1;
		if (request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		pageLimit = 10;
		boardLimit = 10;
		maxPage = (int) Math.ceil((double) listCount / boardLimit);

		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;

		endPage = startPage + pageLimit - 1;
		if (maxPage < endPage) {
			endPage = maxPage;
		}

		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, boardLimit, maxPage, startPage, endPage);
		int boardType = 3;
		ArrayList<PartTime> list = service.selectList(pi, boardType);
		System.out.println(list);
		System.out.println(pi);
		String page = null;
		if (list != null) {
			page = "WEB-INF/views/part_time/short_part_time_index.jsp";
			request.setAttribute("list", list);
			request.setAttribute("pi", pi);
			System.out.println(list);
		} else {
			page = "WEB-INF/views/common/errorPage.jsp";
			request.setAttribute("msg", "게시판 조회에 실패하였습니다.");
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