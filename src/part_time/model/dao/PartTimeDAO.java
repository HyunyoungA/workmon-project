package part_time.model.dao;

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

import member.model.vo.Member;
import part_time.model.vo.Image;
import part_time.model.vo.PageInfo;
import part_time.model.vo.PartTime;

public class PartTimeDAO {

	private Properties prop = new Properties();

	public PartTimeDAO() {

		String fileName = PartTimeDAO.class.getResource("/sql2/partTime/partTime-query.properties").getPath();

		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int shortPartTimeInsert(Connection conn, PartTime p) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("shortPartTimeInsertBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getBoardTitle());
			pstmt.setInt(2, p.getBoardType());
			pstmt.setString(3, p.getUserId());
			pstmt.setString(4, p.getCompanyName());
			pstmt.setString(5, p.getCareer());
			pstmt.setString(6, p.getEducationLevel());
			pstmt.setString(7, p.getPrefer());
			pstmt.setString(8, p.getWorkPeriod());
			pstmt.setString(9, p.getSalary());
			pstmt.setString(10, p.getArea());
			pstmt.setString(11, p.getWorkPeriod());
			result += pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int shortPartTimeInsertFile(Connection conn, ArrayList<Image> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("shortPartImg");
		try {

			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < fileList.size(); i++) {

				Image img = fileList.get(i);
				pstmt.setString(1, img.getImgPath());
				pstmt.setString(2, img.getOriginName());
				pstmt.setString(3, img.getReName());
				pstmt.setInt(4, img.getImgType());

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 혀녕씨 페이징
	public int getListCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;

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

	public ArrayList<PartTime> selectList(Connection conn, PageInfo pi, int boardType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PartTime> list = new ArrayList<>();

		String query = prop.getProperty("selectList");

		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = startRow + pi.getBoardLimit() - 1;

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardType);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);

			rset = pstmt.executeQuery();
			while (rset.next()) {
				list.add(new PartTime(rset.getInt("BOARD_NUM"), rset.getString("AREA"), rset.getString("BOARD_TITLE"),
						rset.getString("COMPANY_NAME"), rset.getString("SALARY"), rset.getString("WORK_PERIOD"),
						rset.getDate("BOARD_DATE"), rset.getString("BOARD_STATUS")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return list;
	}

	// 단기알바 디테일 페이지
	public PartTime shortPartTimeSelectBoard(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		PartTime p = null;

		String query = prop.getProperty("shortPartTimeSelectBoard");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			if (rset.next()) {
				p = new PartTime(rset.getInt("BOARD_NUM"), rset.getString("BOARD_TITLE"), rset.getString("USER_ID"),
						rset.getString("COMPANY_NAME"), rset.getString("CAREER"), rset.getString("EDUCATION_LEVEL"),
						rset.getString("PREFER"), rset.getString("WORK_PERIOD"), null, rset.getString("SALARY"),
						rset.getString("AREA"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return p;
	}

	// 단기알바 디테일 페이지
	public ArrayList<Image> shortPartTimeSelectFiles(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Image> list = null;

		String query = prop.getProperty("shortPartTimeSelectFiles");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);
			rset = pstmt.executeQuery();
			list = new ArrayList<Image>();

			while (rset.next()) {
				Image img = new Image();
				img.setImgId(rset.getInt("IMG_ID"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setReName(rset.getString("RE_NAME"));
				;
				img.setImgPath(rset.getString("Img_PATH"));
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

	// 단기알바 디테일페이지
	public Member shortPartTimeSelectCompany(Connection conn, int bId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member company = null;

		String query = prop.getProperty("shortPartTimeSelectCompany");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				company = new Member(rset.getString("USER_ID"), rset.getString("COMPANY_NAME"),
						rset.getString("COMPANY_ADDRESS"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return company;
	}

	// 디테일 수정페이지 이미지
	public ArrayList<Image> shortPartselectFiles(Connection conn, int boardNum) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Image> list = null;

		String query = prop.getProperty("shortPartselectFiles");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNum);
			rset = pstmt.executeQuery();
			list = new ArrayList<Image>();

			while (rset.next()) {

				Image img = new Image();
				img.setImgId(rset.getInt("IMG_ID"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setReName(rset.getString("RE_NAME"));
				;
				img.setImgPath((rset.getString("IMG_PATH")));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));
				if (img != null) {
					list.add(img);
				}
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

	public int shortPartTimeBUpdate(Connection conn, PartTime p) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("shortPartTimeBUpdate");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getBoardTitle());
			pstmt.setInt(2, p.getBoardNum());
			pstmt.setInt(3, p.getBoardType());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int shortPartTimeCUpdate(Connection conn, PartTime p) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("shortPartTimeCUpdate");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p.getCareer());
			pstmt.setString(2, p.getEducationLevel());
			pstmt.setString(3, p.getPrefer());
			pstmt.setString(4, p.getWorkPeriod());
			pstmt.setString(5, p.getSalary());
			pstmt.setString(6, p.getArea());
			pstmt.setInt(7, p.getBoardNum());
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int shortPartTimeImgUpdate(Connection conn, ArrayList<Image> fileList) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("shortPartTimeImgUpdate");
		try {
			System.out.println(fileList + "업데이트 다오에있는 이미지 fileList 객체 ");
			pstmt = conn.prepareStatement(query);
			for (int i = 0; i < fileList.size(); i++) {

				Image img = fileList.get(i);

				pstmt.setString(1, img.getImgPath());
				pstmt.setString(2, img.getOriginName());
				pstmt.setString(3, img.getReName());
				pstmt.setInt(4, img.getBoardNum());
				pstmt.setInt(5, img.getImgId());

				result += pstmt.executeUpdate();
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 단기알바 삭제
	public int shortPartTimeDelete(Connection conn, int boardNum) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("shortPartTimeDelete");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNum);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public ArrayList<PartTime> boardAllSelectList(Connection conn, int boardType) {
		// 회사네임companyName, 타이틀boardTitle, 급여salary, 글번호 boardNum
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<PartTime> boardList = null;

		String query = prop.getProperty("boardAllSelectList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardType);
			rset = pstmt.executeQuery();
			boardList = new ArrayList<PartTime>();
			while (rset.next()) {
				PartTime p = new PartTime();
				p.setBoardTitle(rset.getString("BOARD_TITLE"));
				p.setBoardNum(rset.getInt("BOARD_NUM"));
				p.setCompanyName(rset.getString("COMPANY_NAME"));
				p.setSalary(rset.getString("SALARY"));

				boardList.add(p);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return boardList;
	}

	public ArrayList<Image> fileAllSelectList(Connection conn, int boardType) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Image> filelist = null;

		String query = prop.getProperty("fileAllSelectList");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardType);
			rset = pstmt.executeQuery();
			filelist = new ArrayList<Image>();

			while (rset.next()) {
				Image img = new Image();
				img.setImgId(rset.getInt("IMG_ID"));
				img.setOriginName(rset.getString("ORIGIN_NAME"));
				img.setReName(rset.getString("RE_NAME"));
				;
				img.setImgPath((rset.getString("IMG_PATH")));
				img.setUploadDate(rset.getDate("UPLOAD_DATE"));
				img.setBoardNum(rset.getInt("BOARD_NUM"));
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

}