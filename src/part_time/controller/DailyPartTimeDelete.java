package part_time.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import part_time.model.service.PartTimeService;
import part_time.model.vo.Image;

/**
 * Servlet implementation class DailyPartTimeDelete
 */
@WebServlet("/dailyPartTimeDelete.dd")
public class DailyPartTimeDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DailyPartTimeDelete() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		int boardNum = Integer.parseInt(request.getParameter("bId"));
		int result = new PartTimeService().shortPartTimeDelete(boardNum);
		if (result > 0) {
			ArrayList<Image> imgList = new PartTimeService().shortPartselectFiles(boardNum);
			if (imgList != null) {
				for (int i = 0; i < imgList.size(); i++) {
					File failFile = new File(imgList.get(i).getImgPath() + imgList.get(i).getReName());
					failFile.delete();
				}
			}
			request.setAttribute("msg", "사진게시판 등록 성공!");
			request.getRequestDispatcher("dailyPartTimeIndex.do").forward(request, response);
		} else {
			request.setAttribute("msg", "사진게시판 등록 실패!");
			request.getRequestDispatcher("dailyPartTimeIndex.do").forward(request, response);
		}
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
