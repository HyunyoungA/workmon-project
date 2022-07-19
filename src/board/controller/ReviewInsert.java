package board.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class ReviewInsert
 */
@WebServlet("/reviewInsert.ho")
public class ReviewInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewInsert() {
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

			File f = new File(savePath);

			if (!f.exists()) {
				f.mkdirs();
			}

			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",
					new MyFileRenamePolicy());

			String boardTitle = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String userId = ((Member) request.getSession().getAttribute("loginUser")).getUserId();

			Board b = new Board(0, boardTitle, content, null, 0, 1, null, userId, null, null);

			ArrayList<String> saveFiles = new ArrayList<String>(); // 파일의 바뀐 이름을 저장할 ArrayList
			ArrayList<String> originFiles = new ArrayList<String>(); // 파일의 원래 이름을 저장할 ArrayList

			Enumeration<String> files = multiRequest.getFileNames();
			while (files.hasMoreElements()) {
				String name = files.nextElement(); // 전송 순서 역순

				if (multiRequest.getFilesystemName(name) != null) {
					saveFiles.add(multiRequest.getFilesystemName(name));// 바뀐이름의 파일명
					originFiles.add(multiRequest.getOriginalFileName(name));// 원래 이름의 파일명
				}
			}

			ArrayList<Attachment> fileList = new ArrayList<>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {// 파일이 역순이어서 for문도 역순.
				Attachment a = new Attachment();
				a.setFilePath(savePath);
				a.setOriginName(originFiles.get(i));
				a.setChangeName(saveFiles.get(i));

				fileList.add(a);
			}

			int result = new BoardService().reviewInsertFile(b, fileList);
			if (result == fileList.size() + 1) {
				response.sendRedirect("review_index.ho");
			} else {
				request.setAttribute("msg", "게시글 작성에 실패하였습니다.");
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
