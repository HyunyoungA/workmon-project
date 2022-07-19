package part_time.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.vo.Member;
import part_time.model.dao.PartTimeDAO;
import part_time.model.vo.Image;
import part_time.model.vo.PageInfo;
import part_time.model.vo.PartTime;

public class PartTimeService {

	public int shortPartTimeInsert(PartTime p, ArrayList<Image> fileList) {
		Connection conn = getConnection();

		PartTimeDAO dao = new PartTimeDAO();

		int result1 = dao.shortPartTimeInsert(conn, p);
		int result2 = dao.shortPartTimeInsertFile(conn, fileList);

		if (result1 > 0 && result2 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		return result1 + result2;
	}

	// 페이징
	public ArrayList<PartTime> selectList(PageInfo pi, int boardType) {
		Connection conn = getConnection();

		ArrayList<PartTime> list = new PartTimeDAO().selectList(conn, pi, boardType);

		close(conn);

		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = new PartTimeDAO().getListCount(conn);
		close(conn);
		return listCount;
	}

	// 단기알바 디테일페이지
	public PartTime shortPartTimeSelectBoard(int bId) {
		Connection conn = getConnection();

		PartTime partTime = new PartTimeDAO().shortPartTimeSelectBoard(conn, bId);
		if (partTime != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return partTime;
	}

	public ArrayList<Image> shortPartTimeSelectFiles(int bId) {

		Connection conn = getConnection();
		ArrayList<Image> list = new PartTimeDAO().shortPartTimeSelectFiles(conn, bId);
		close(conn);
		return list;
	}

	// 단기알바 디테일페이지
	public Member shortPartTimeSelectCompany(int bId) {
		Connection conn = getConnection();
		Member company = new PartTimeDAO().shortPartTimeSelectCompany(conn, bId);
		if (company != null) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		return company;
	}

	// 디테일 수정페이지 이미지
	public ArrayList<Image> shortPartselectFiles(int boardNum) {
		Connection conn = getConnection();
		ArrayList<Image> list = new PartTimeDAO().shortPartselectFiles(conn, boardNum);
		close(conn);
		return list;
	}

	public int shortPartTimeUpdate(PartTime p, ArrayList<Image> fileList) {
		Connection conn = getConnection();
		PartTimeDAO dao = new PartTimeDAO();
		int result1 = dao.shortPartTimeBUpdate(conn, p);
		int result2 = dao.shortPartTimeCUpdate(conn, p);
		int result3 = dao.shortPartTimeImgUpdate(conn, fileList);

		if (result1 > 0 && result2 > 0 && result3 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1 + result2 + result3;
	}

	// 단기알바 삭제
	public int shortPartTimeDelete(int boardNum) {
		Connection conn = getConnection();
		PartTimeDAO dao = new PartTimeDAO();
		int result1 = dao.shortPartTimeDelete(conn, boardNum);
		if (result1 > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		return result1;
	}

	// 단기알바 삭제
	public ArrayList<PartTime> boardAllSelectList(int boardType) {
		Connection conn = getConnection();
		ArrayList<PartTime> boardList = new PartTimeDAO().boardAllSelectList(conn, boardType);
		close(conn);
		return boardList;
	}

	public ArrayList<Image> fileAllSelectList(int boardType) {
		Connection conn = getConnection();
		ArrayList<Image> fileList = new PartTimeDAO().fileAllSelectList(conn, boardType);
		close(conn);
		return fileList;
	}

}