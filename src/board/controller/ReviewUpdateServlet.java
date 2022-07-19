package board.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import board.model.service.BoardService;
import board.model.vo.Attachment;
import board.model.vo.Board;
import common.MyFileRenamePolicy;
import member.model.vo.Member;

/**
 * Servlet implementation class ReviewUpdateServlet
 */
@WebServlet("/reviewUpdate.ck")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReviewUpdateServlet() {
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
			System.out.println(boardNum + "보드넘버 업데이트 서블릿");
			String boardTitle = multiRequest.getParameter("title");
			String boardContent = multiRequest.getParameter("content");
			int boardType = 1;

			Board Board = new Board(boardNum, boardTitle, boardContent, null, 0, boardType, null, null, null, null);

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

			ArrayList<Attachment> imgList = new BoardService().correctReviewSelectFiles(boardNum);

			ArrayList<Attachment> fileList = new ArrayList<>();
			for (int i = originFiles.size() - 1; i >= 0; i--) {
				Attachment img = new Attachment();
				img.setFilePath(savePath);
				img.setOriginName(originFiles.get(i));
				img.setChangeName(saveFiles.get(i));
				img.setBoardId(boardNum);
				if (!imgList.isEmpty() && imgList != null) {
					img.setFileId(imgList.get(i).getFileId());
				}
				if (i == originFiles.size() - 1) {
					img.setFileLevel(0);
				} else {

					img.setFileLevel(1);
				}
				fileList.add(img);
			}
			int result = new BoardService().correctReviewUpdate(Board, fileList);

			if (result == fileList.size() + 1) {

				if (imgList != null) {
					for (int i = 0; i < fileList.size(); i++) {
						File failFile = null;
						if (imgList.get(i).getFileLevel() == fileList.get(i).getFileLevel()) {
							failFile = new File(imgList.get(i).getFilePath() + imgList.get(i).getChangeName());
							failFile.delete();
						}
					}
				}

				response.sendRedirect("review_index.ho");

			} else {
				request.setAttribute("msg", "사진게시판 등록에 실패하였씁니다.");
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