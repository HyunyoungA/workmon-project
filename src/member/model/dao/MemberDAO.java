package member.model.dao;


import static common.JDBCTemplate.close;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.vo.Member;

public class MemberDAO {
	private Properties prop = new Properties();	
	public MemberDAO() {
		String fileName = MemberDAO.class.getResource("/sql2/member/member-query.properties").getPath();
		//절대경로 
		
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public int indiJoinInsert(Connection conn, Member member, String route) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("indiJoinInsertMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserEmail());
			pstmt.setString(5, member.getUserPhone());
			pstmt.setString(6, route);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int compJoinInsert(Connection conn, Member member, String route) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("compJoinInsertMember");
		//INSERT ALL INTO MEMBER VALUES(?,?,?,?,?,?, 'Y', 2 ) INTO COMMPANY VALUES(?,?,?,?) SELECT * FROM DUAL;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			pstmt.setString(3, member.getUserName());
			pstmt.setString(4, member.getUserEmail());
			pstmt.setString(5, member.getUserPhone());
			pstmt.setString(6, route);
			pstmt.setString(7, member.getUserId());
			pstmt.setString(8, member.getCompanyNum());
			pstmt.setString(9, member.getCompanyAddress());
			pstmt.setString(10, member.getCompanyName());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public Member indiLogin(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("indiLogin");
		//indiLogin=SELECT * FROM MEMBER WHERE USER_ID = ? AND USER_PWD = ? AND USER_STATUS = 'Y' AND USER_TYPE = 1 
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {		
				 loginUser = new Member(rset.getString("USER_ID"),
                        rset.getString("USER_PWD"),
                        rset.getString("USER_NAME"),
                        rset.getString("USER_EMAIL"),
                        rset.getString("USER_PHONE"),
                        null,
                        null,
                        null,
                        rset.getInt("USER_TYPE"),
                        rset.getString("USER_STATUS"),
                        rset.getString("JOIN_PATH")
                        );
				 
			}
			System.out.println(loginUser);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public Member compLogin(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member loginUser = null;
		
		String query = prop.getProperty("compLogin");
		//compLogin=SELECT * FROM MEMBER JOIN COMMPANY USING(USER_ID) WHERE USER_ID = 'sinsu000' AND USER_PWD = '123456' AND USER_STATUS = 'Y' AND USER_TYPE = 2
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserId());
			pstmt.setString(2, member.getUserPwd());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {		
				 loginUser = new Member(rset.getString("USER_ID"),
                        rset.getString("USER_PWD"),
                        rset.getString("USER_NAME"),
                        rset.getString("USER_EMAIL"),
                        rset.getString("USER_PHONE"),
                        rset.getString("COMPANY_NAME"),
                        rset.getString("COMPANY_NUM"),
                        rset.getString("COMPANY_ADDRESS"),
                        rset.getInt("USER_TYPE"),
                        rset.getString("USER_STATUS"),
                        rset.getString("JOIN_PATH")
                        );
				 
			}
			System.out.println(loginUser);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return loginUser;
	}

	public int indiUpdateInsert(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("indiUpdateInsertMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getUserPwd());
			pstmt.setString(2, member.getUserName());
			pstmt.setString(3, member.getUserEmail());
			pstmt.setString(4, member.getUserPhone());
			pstmt.setString(5, member.getJoinPath());
			pstmt.setString(6, member.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int MemberDelete(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("MemberDelete");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	public int compUpdateInsert(Connection conn, Member member) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("compUpdateInsertMember");
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getCompanyNum());
			pstmt.setString(2, member.getCompanyAddress());
			pstmt.setString(3, member.getCompanyName());
			pstmt.setString(4, member.getUserId());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	//에이작스 개인 아이디 확인
	public int indicheckId(Connection conn, String inputIndiId) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      int result = 0;
	      
	      String query = prop.getProperty("inputIndiId");
	      try {
	         pstmt = conn.prepareStatement(query);
	         pstmt.setString(1, inputIndiId);
	         rset = pstmt.executeQuery();
	         if(rset.next()) {
	            result = rset.getInt(1);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      
	      return result;
	   }
	//에이작스 개인 아이디 확인

	// 에이작스 기업 아이디 확인
	public int checkId(Connection conn, String inputId) {
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      int result = 0;
	      System.out.println(inputId);
	      String query = prop.getProperty("compCheckId");
	      try {
	      pstmt = conn.prepareStatement(query);
	      pstmt.setString(1, inputId);
	      rset = pstmt.executeQuery();
	      if(rset.next()) {
	         result = rset.getInt(1);
	      }
	   } catch (SQLException e) {
	      e.printStackTrace();
	   }
	      return result;
	   }
	
}
