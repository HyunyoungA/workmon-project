package notice.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import notice.model.dao.NoticeDAO;
import notice.model.vo.Notice;
import notice.model.vo.PageInfo;

public class NoticeService {

	public int getListCount() {
		Connection conn = getConnection();

		int listCount = new NoticeDAO().getListCount(conn);

		close(conn);

		return listCount;
	}

	public ArrayList<Notice> selectList(PageInfo pi) {
		Connection conn = getConnection();

		ArrayList<Notice> list = new NoticeDAO().selectList(conn, pi);

		close(conn);

		return list;
	}

	public int insertNotice(Notice n) {
		Connection conn = getConnection();

		int result = new NoticeDAO().insertNotice(conn, n);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public Notice selectNotice(int no) {
		Connection conn = getConnection();

		// 조회수 없데이트
		int result = new NoticeDAO().updateCount(conn, no);

		// 공지사항 상세보기
		Notice notice = null;
		if (result > 0) {
			notice = new NoticeDAO().selecetNotice(conn, no);
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return notice;
	}

	public int updateNotice(Notice n) {
		Connection conn = getConnection();

		int result = new NoticeDAO().updateNotice(conn, n);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int deleteNotice(int no) {
		Connection conn = getConnection();

		int result = new NoticeDAO().deleteNotice(conn, no);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

}
