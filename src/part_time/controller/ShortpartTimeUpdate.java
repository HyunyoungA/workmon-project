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
 * Servlet implementation class shortpartTimeUpdate
 */
@WebServlet("/shortpartTimeUpdate.st")
public class ShortpartTimeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ShortpartTimeUpdate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		if (ServletFileUpload.isMultipartContent(request)) {

			int maxSize = 2024 * 10000 * 100;
			String root = request.getSession().getServletContext().getRealPath("/");
			String savePath = root + "img_uploadFiles/";

			File f = new File(savePath);
			if (!f.exists()) {
				f.mkdirs();
			}

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());
			int boardNum = Integer.parseInt(multiRequest.getParameter("boardNum"));
			String boardTitle = multiRequest.getParameter("boardTitle");
			String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId();
			String companyName = multiRequest.getParameter("companyName");
			String career = multiRequest.getParameter("career");
			String educationLevel = multiRequest.getParameter("educationLevel");
			String prefer = multiRequest.getParameter("prefer");
			String workPeriod = multiRequest.getParameter("workPeriod");
			String salary = multiRequest.getParameter("salary");
			String area = multiRequest.getParameter("area");
			int boardType = 3;
			PartTime p = new PartTime(boardNum, boardTitle, null, null, 0, boardType, null, userId, null, companyName,
					career, educationLevel, prefer, workPeriod, null, salary, area);

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

			ArrayList<Image> imgList = new PartTimeService().shortPartselectFiles(boardNum);
			ArrayList<Image> fileList = new ArrayList<>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				Image img = new Image();
				img.setImgPath(savePath);
				img.setOriginName(originFiles.get(i));
				img.setReName(saveFiles.get(i));
				img.setBoardNum(boardNum);
				if (!imgList.isEmpty() && imgList != null) {
					img.setImgId(imgList.get(i).getImgId());
				}
				if (i == originFiles.size() - 1) {
					img.setImgType(0);
				} else {
					img.setImgType(1);
				}
				fileList.add(img);
			}
			int result = new PartTimeService().shortPartTimeUpdate(p, fileList);

			if (result == fileList.size() + 2) {

				if (imgList != null) {
					for (int i = 0; i < fileList.size(); i++) {
						File failFile = null;
						if (imgList.get(i).getImgType() == fileList.get(i).getImgType()) {
							failFile = new File(imgList.get(i).getImgPath() + imgList.get(i).getReName());
							failFile.delete();
						}
					}
				}

				response.sendRedirect("shortPartTimeIndex.do");

			} else {
				request.setAttribute("msg", "사진게시판 등록에 실패하였습니다.");
				request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
				for (int i = 0; i < saveFiles.size(); i++) {
					File failFile = new File(savePath + saveFiles.get(i));
					failFile.delete();
				}
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
