package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.dao.MemberDAO;
import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class IndiMyUpdateInsert
 */
@WebServlet("/indiMyUpdateInsert.iu")
public class IndiMyUpdateInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IndiMyUpdateInsert() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("indiMyUserId");
		String userPwd = request.getParameter("indiMyUserPwd");
		String userName = request.getParameter("indiMyName");
		String email1 = request.getParameter("indiMyEmail1");
		String email2 = request.getParameter("indiMyEmail2");
		String[] phone1 = request.getParameterValues("indiMyPhone1");
		String phone2 = request.getParameter("indiMyPhone2");
		String phone3 = request.getParameter("indiMyPhone3");
		String route = request.getParameter("indiMyRoute");

		String userEmail = email1 + "@" + email2;
		String userPhone = phone1[0] + "-" + phone2 + "-" + phone3;

		Member member = new Member(userId, userPwd, userName, userEmail, userPhone, null, null, null, 1, null, route);
		System.out.println(member);
		int result = new MemberService().indiUpdateInsert(member);
		System.out.println(result);

		if (result > 0) {
			Member loginUser = new MemberService().indiLogin(member);

			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(600);

			response.sendRedirect("indiMyPage.im");

		} else {
			request.setAttribute("msg", "회원 정보 수정에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);
			;

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
