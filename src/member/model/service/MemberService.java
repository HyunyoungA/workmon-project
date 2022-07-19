package member.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import member.model.dao.MemberDAO;
import member.model.vo.Member;

public class MemberService {

	public int indiJoinInsert(Member member, String route) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().indiJoinInsert(conn, member, route);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int compJoinInsert(Member member, String route) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().compJoinInsert(conn, member, route);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public Member indiLogin(Member member) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().indiLogin(conn, member);
		System.out.println(loginUser);
		close(conn);
	
		return loginUser;
	}

	public Member compLogin(Member member) {
		Connection conn = getConnection();
		
		Member loginUser = new MemberDAO().compLogin(conn, member);
		System.out.println(loginUser);
		close(conn);
	
		return loginUser;
	}

	public int indiUpdateInsert(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().indiUpdateInsert(conn, member);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int MemberDelete(String userId) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().MemberDelete(conn, userId);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	public int compUpdateInsert(Member member) {
		Connection conn = getConnection();
		
		int result = new MemberDAO().compUpdateInsert(conn, member);
		
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		return result;
	}

	// 에이작스 개인 아이디 확인
	
	public int indicheckId(String inputIndiId) {
	      Connection conn = getConnection();
	      
	      int result = new MemberDAO().indicheckId(conn, inputIndiId);
	      
	      close(conn);
	      
	      return result;
   }
	//에이작스 개인 아이디 확인

	// 에이작스 기업 아이디 확인
	public int checkId(String inputId) {
	      Connection conn = getConnection();
	      
	      int result = new MemberDAO().checkId(conn, inputId);
	      
	      close(conn);
	      
	      return result;
   }

}

