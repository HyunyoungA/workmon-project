package part_time.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import part_time.model.service.PartTimeService;
import part_time.model.vo.Image;
import part_time.model.vo.PartTime;

/**
 * Servlet implementation class DailyPartTimeUpdateLink
 */
@WebServlet("/dailyUpdate.du")
public class DailyPartTimeUpdateLink extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DailyPartTimeUpdateLink() {
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
		System.out.println(boardNum);
		String companyName = request.getParameter("companyName");
		String boardTitle = request.getParameter("boardTitle");
		String career = request.getParameter("career");
		String educationLevel = request.getParameter("educationLevel");
		String prefer = request.getParameter("prefer");
		String workPeriod = request.getParameter("workPeriod");
		String salary = request.getParameter("salary");
		String area = request.getParameter("area");
		PartTime partTime = new PartTime(boardNum, boardTitle, null, companyName, career, educationLevel, prefer,
				workPeriod, null, salary, area);
		ArrayList<Image> fileList = new PartTimeService().shortPartselectFiles(boardNum);

		request.setAttribute("partTime", partTime);
		request.setAttribute("fileList", fileList);
		request.getRequestDispatcher("WEB-INF/views/part_time/daily_part_time_update.jsp").forward(request, response);
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
