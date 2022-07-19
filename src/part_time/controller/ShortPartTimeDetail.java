package part_time.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import part_time.model.service.PartTimeService;
import part_time.model.vo.Image;
import part_time.model.vo.PartTime;

/**
 * Servlet implementation class ShortPartTimeDetail
 */
@WebServlet("/shortDetail.bo")
public class ShortPartTimeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShortPartTimeDetail() {
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

		PartTimeService service = new PartTimeService();
		PartTime partTime = service.shortPartTimeSelectBoard(bId);

		ArrayList<Image> imgList = service.shortPartTimeSelectFiles(bId);

		Member company = service.shortPartTimeSelectCompany(bId);

		String page = null;
		if (partTime != null & imgList != null && company != null) {
			request.setAttribute("partTime", partTime);
			request.setAttribute("imgList", imgList);
			request.setAttribute("company", company);
			page = "WEB-INF/views/part_time/short_part_time_Detail.jsp";
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
