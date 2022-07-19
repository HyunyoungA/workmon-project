package board.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.vo.Comments;
import board.model.dao.BoardDAO;
import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.PageInfo;
import part_time.model.dao.PartTimeDAO;
import part_time.model.vo.Image;
import part_time.model.vo.PartTime;

public class BoardService {

	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new BoardDAO().getListCount(conn);

		close(conn);

		return listCount;
	}

	public ArrayList<Board> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Board> list = new BoardDAO().selectList(conn, pi);

		close(conn);

		return list;
	}

	public int reviewInsertFile(Board b, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();

		BoardDAO dao = new BoardDAO();

		int result1 = dao.insertBoard(conn, b);
		System.out.println(result1 + "서비스1");
		int result2 = dao.reviewInsertFile(conn, fileList);
		System.out.println(result2 + "서비스2");

		if (result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1 + result2;
	}

	public Board reviewSelectBoard(int bId) {
		Connection conn = getConnection();

		int result = new BoardDAO().updateCount(conn, bId);
		Board board = null;
		if (result > 0) {
			board = new BoardDAO().reviewSelectBoard(conn, bId);
			if (board != null) {
				commit(conn);
			} else {
				rollback(conn);
			}
		} else {
			rollback(conn);
		}

		close(conn);

		return board;
	}

	public ArrayList<Attachment> reviewSelectFiles(int bId) {

		Connection conn = getConnection();

		ArrayList<Attachment> list = new BoardDAO().reviewSelectFiles(conn, bId);

		close(conn);

		return list;
	}

	public int deleteReview(int no) {
		Connection conn = getConnection();

		int result1 = new BoardDAO().deleteReview(conn, no);
		int result2 = new BoardDAO().FileDeleteReview(conn, no);
		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result1 + result2;
	}

	public ArrayList<Comments> reviewCommentsList(int bId) {
		Connection conn = getConnection();

		ArrayList<Comments> list = new BoardDAO().reviewCommentsList(conn, bId);

		close(conn);

		return list;
	}

	public ArrayList<Board> boardAllSelectList(int boardType) {
		Connection conn = getConnection();

		ArrayList<Board> boardList = new BoardDAO().boardAllSelectList(conn, boardType);

		close(conn);

		return boardList;
	}

	public ArrayList<Attachment> fileAllSelectList(int boardType) {
		Connection conn = getConnection();

		ArrayList<Attachment> fileList = new BoardDAO().fileAllSelectList(conn, boardType);

		close(conn);

		return fileList;
	}

	public ArrayList<Comments> insertComments(Comments c) {
		Connection conn = getConnection();

		BoardDAO dao = new BoardDAO();

		int result = dao.insertComments(conn, c);
		ArrayList<Comments> list = null;
		if (result > 0) {
			commit(conn);
			list = dao.reviewCommentsList(conn, c.getBoardNum());
		} else {
			rollback(conn);
		}

		close(conn);

		return list;
	}

	public int commentsDelete(int bId, int mentNum) {
		Connection conn = getConnection();

		int result = new BoardDAO().commentsDelete(conn, bId, mentNum);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);
		return result;
	}

	public ArrayList<Attachment> correctReviewSelectFiles(int boardNum) {
		Connection conn = getConnection();

		ArrayList<Attachment> list = new BoardDAO().correctReviewSelectFiles(conn, boardNum);

		close(conn);
		System.out.println(list + "서비스에 넘겨받은 이미지 객체");
		return list;
	}

	public int correctReviewUpdate(Board board, ArrayList<Attachment> fileList) {
		Connection conn = getConnection();

		BoardDAO dao = new BoardDAO();

		System.out.println(fileList + "fileList 다오에있는거");
		int result1 = dao.correctReviewBUpdate(conn, board);
		int result2 = dao.correctReviewImgUpdate(conn, fileList);
		System.out.println(result2 + "result2 다오에있는거");

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result1 + result2;
	}

}
