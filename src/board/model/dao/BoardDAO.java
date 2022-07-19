package board.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.Attachment;
import board.model.vo.Board;
import board.model.vo.Comments;
import board.model.vo.PageInfo;

public class BoardDAO {

	private Properties prop = new Properties();

	public BoardDAO() {
		String fileName = BoardDAO.class.getResource("/sql2/board/board-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		Statement stmt = null;
		int result = 0;
		ResultSet rset = null;

		String query = prop.getProperty("getListCount");

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				result = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> list = new ArrayList<>();

		String query = prop.getProperty("selectList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new Board(rset.getInt("board_num"), rset.getString("board_title"),
						rset.getString("board_content"), rset.getDate("board_date"), rset.getInt("hits"),
						rset.getInt("board_type"), rset.getString("board_status"), rset.getString("user_id"),
						rset.getString("manager_id"), rset.getString("company_name")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	public int insertBoard(Connection conn, Board b) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertBoard");
//		insertBoard=INSERT INTO BOARD VALUES(SEQ_SID.NEXTVAL, ?, ?, SYSDATE, 0, 1, DEFAULT , ?, null, null)
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int reviewInsertFile(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(fileList + "파일리스트");

		String query = prop.getProperty("insertFile");
//		INSERT INTO IMAGE VALUES(SEQ_PID.NEXTVAL, ?, ?, ?, SYSDATE, DEFAULT, 0, SEQ_SID.CURRVAL);
		try {
			for (int i = 0; i < fileList.size(); i++) {
				Attachment a = fileList.get(i);
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, a.getFilePath());
				pstmt.setString(2, a.getOriginName());
				pstmt.setString(3, a.getChangeName());

				result += pstmt.executeUpdate();
			}
			System.out.println(result + "dao");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public Board reviewSelectBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Board b = null;

		String query = prop.getProperty("reviewSelectBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				b = new Board(rset.getInt("BOARD_NUM"), rset.getString("BOARD_TITLE"), rset.getString("BOARD_CONTENT"),
						rset.getDate("BOARD_DATE"), rset.getInt("HITS"), rset.getString("USER_ID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return b;
	}

	public int updateCount(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCount");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Attachment> reviewSelectFiles(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;

		String query = prop.getProperty("reviewSelectFiles");
		// SELECT IMG_ID, ORIGIN_NAME, RE_NAME, IMG_PATH, UPLOAD_DATE FROM IMAGE WHERE
		// BOARD_NUM = ?;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			list = new ArrayList<Attachment>();

			while (rset.next()) {
				Attachment img = new Attachment();
				img.setFileId(rset.getInt("IMG_ID"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("RE_NAME"));
				;
				img.setFilePath(rset.getString("Img_PATH"));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));

				list.add(img);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int deleteReview(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("deleteReview");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public int FileDeleteReview(Connection conn, int no) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("FileDeleteReview");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, no);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	public ArrayList<Comments> reviewCommentsList(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Comments> list = null;

		String query = prop.getProperty("reviewCommentsList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);

			rset = pstmt.executeQuery();
			list = new ArrayList<Comments>();

			System.out.println(bId + "bid확인11");
			while (rset.next()) {
				list.add(new Comments(rset.getInt("MENT_NUM"), rset.getString("CONTENT"), rset.getInt("BOARD_NUM"),
						rset.getString("USER_ID"), rset.getDate("MENT_DATE"), rset.getString("MENT_STATUS"),
						rset.getString("MANAGER_ID")));

			}
			System.out.println(list + "리스트 확인");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}
		return list;
	}

	public ArrayList<Board> boardAllSelectList(Connection conn, int boardType) {
		// 회사네임companyName, 타이틀boardTitle, 급여salary, 글번호 boardNum
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Board> boardList = null;

		String query = prop.getProperty("boardAllSelectList");
		// SELECT BOARD_TITLE, BOARD_NUM, COMPANY_NAME, SALARY FROM RLIST WHERE
		// BOARD_TYPE = ?

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardType);
			rset = pstmt.executeQuery();
			boardList = new ArrayList<Board>();
			while (rset.next()) {
				Board p = new Board();
				p.setBoardTitle(rset.getString("BOARD_TITLE"));
				p.setBoardNum(rset.getInt("BOARD_NUM"));
				p.setUserId(rset.getString("USER_ID"));
				p.setBoardContent(rset.getString("BOARD_CONTENT"));

				boardList.add(p);

			}
			System.out.println(boardList + "보드 다오에 있는 보드 전체 셀렉트");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return boardList;
	}

	public ArrayList<Attachment> fileAllSelectList(Connection conn, int boardType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> filelist = null;

		String query = prop.getProperty("fileAllSelectList");
		// SELECT * FROM IMAGE JOIN BOARD USING(BOARD_NUM) WHERE IMG_STATUS = 'Y' AND
		// IMG_TYPE = 0 AND BOARD_TYPE = ?

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardType);
			rset = pstmt.executeQuery();
			filelist = new ArrayList<Attachment>();

			while (rset.next()) {
				Attachment img = new Attachment();
				img.setFileId(rset.getInt("IMG_ID"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("RE_NAME"));
				img.setFilePath(rset.getString("IMG_PATH"));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));
				img.setBoardId(rset.getInt("BOARD_NUM"));
				if (img != null) {
					filelist.add(img);
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return filelist;
	}

	public int insertComments(Connection conn, Comments c) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertComments");
		System.out.println(c.getBoardNum() + "인설트코멘트 ");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, c.getMentContent());
			pstmt.setInt(2, c.getBoardNum());
			pstmt.setString(3, c.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int commentsDelete(Connection conn, int bId, int mentNum) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("commentsDelete");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			pstmt.setInt(2, mentNum);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 알바후기 수정
	public ArrayList<Attachment> correctReviewSelectFiles(Connection conn, int boardNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Attachment> list = null;

		String query = prop.getProperty("correctReviewSelectFiles");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNum);
			rset = pstmt.executeQuery();
			list = new ArrayList<Attachment>();

			while (rset.next()) {
				Attachment img = new Attachment();
				img.setFileId(rset.getInt("IMG_ID"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setChangeName(rset.getString("RE_NAME"));
				;
				img.setFilePath(rset.getString("Img_PATH"));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));

				if (img != null) {
					list.add(img);
				}
			}
			System.out.println(list + "이미지 수정하기-DAO리스트 ");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int correctReviewBUpdate(Connection conn, Board board) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(board + "업데이트 dao 보드값");
		String query = prop.getProperty("correctReviewBUpdate");
		System.out.println(result + "업데이트 dao1");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, board.getBoardTitle());
			pstmt.setString(2, board.getBoardContent());
			pstmt.setInt(3, board.getBoardNum());
			pstmt.setInt(4, board.getBoardType());
			result = pstmt.executeUpdate();
			System.out.println(result + "업데이트 dao리절트값2");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result + "보드개수");
		return result;
	}

	public int correctReviewImgUpdate(Connection conn, ArrayList<Attachment> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("correctReviewImgUpdate");
		System.out.println(fileList.get(0) + "fileList.get(0) 다오에");
		try {
			System.out.println(fileList + "업데이트 다오에있는 이미지 fileList 객체 ");
			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < fileList.size(); i++) {

				Attachment img = fileList.get(i);

				System.out.println(img + "업데이트 다오에있는 이미지 Image 객체 하나씩로드 ");
				pstmt.setString(1, img.getFilePath());
				pstmt.setString(2, img.getOriginName());
				pstmt.setString(3, img.getChangeName());
				pstmt.setInt(4, img.getBoardId());
				pstmt.setInt(5, img.getFileId());

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result + "이미지 로딩개수");
		return result;
	}

}
