package part_time.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import member.model.vo.Member;
import part_time.model.service.PartTimeService;
import part_time.model.vo.Image;
import part_time.model.vo.PartTime;

/**
 * Servlet implementation class dailypartTimeInsert
 */
@WebServlet("/dailypartTimeJob.dt")
public class DailypartTimeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DailypartTimeInsert() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		if (ServletFileUpload.isMultipartContent(request)) {
			int maxSize = 2024 * 10000 * 100;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "img_uploadFiles/";

			System.out.println(root);
			System.out.println(savePath + "세이브패스 경로");
			File f = new File(savePath);
			System.out.println(f + "파일 주소");

			if (!f.exists()) {
				f.mkdirs();
			}
			System.out.println(f + "파일 주소 2번째");

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			String boardTitle = multiRequest.getParameter("boardTitle");
			String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
			String companyName = multiRequest.getParameter("companyName");
			String career = multiRequest.getParameter("career");
			String educationLevel = multiRequest.getParameter("educationLevel");
			String prefer = multiRequest.getParameter("prefer");
			String workPeriod = multiRequest.getParameter("workPeriod");
			String salary = multiRequest.getParameter("salary");
			String area = multiRequest.getParameter("area");
			int boardType = 4;

			PartTime p = new PartTime(0, boardTitle, null, null, 0, boardType, null, userId, null, companyName, career,
					educationLevel, prefer, workPeriod, workPeriod, salary, area);

			ArrayList<String> saveFiles = new ArrayList<String>();
			ArrayList<String> originFiles = new ArrayList<String>();

			Enumeration<String> files = multiRequest.getFileNames();

			while (files.hasMoreElements()) {
				String name = files.nextElement();

				if (multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));
					originFiles.add(multiRequest.getOriginalFileName(name));
				}

			}

			System.out.println(saveFiles);
			System.out.println(originFiles);

			ArrayList<Image> fileList = new ArrayList<>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				Image img = new Image();
				img.setImgPath(savePath);
				System.out.println(img.getImgPath() + "img.getImgPath() ");
				img.setOriginName(originFiles.get(i));
				System.out.println(originFiles.get(i) + "originFiles.get(i)");
				System.out.println(img.getOriginName() + "img.getOriginName()");
				img.setReName(saveFiles.get(i));

				System.out.println(saveFiles.get(i) + "saveFiles.get(i)");

				if (i == originFiles.size() - 1) {
					img.setImgType(0); // 썸네일: 0
					System.out.println(img.getImgType() + "img.getImgType(0)");
				} else {
					img.setImgType(1); // 내용: 1
					System.out.println(img.getImgType() + "img.getImgType(0)");
				}

				fileList.add(img);
				System.out.println(fileList + "fileList");

			}
			int result = new PartTimeService().shortPartTimeInsert(p, fileList);

			if (result == fileList.size() + 2) {
				response.sendRedirect("dailyPartTimeIndex.do");
			} else {
				request.setAttribute("msg", "사진게시판 등록에 실패하였씁니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);

				for (int i = 0; i < saveFiles.size(); i++) {
					File failFile = new File(savePath + saveFiles.get(i));
					failFile.delete();
				} // 실패하면 이미지를 지워줍니다.
			}

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
