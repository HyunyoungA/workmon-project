package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class CompMyUpdateInsert
 */
@WebServlet("/compMyUpdateInsert.iu")
public class CompMyUpdateInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompMyUpdateInsert() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("compMyUserId");
		String userPwd = request.getParameter("compMyUserPwd");
		String compMyCeoName = request.getParameter("compMyCeoName");
		String email1 = request.getParameter("compMyEmail1");
		String email2 = request.getParameter("compMyEmail2");
		String[] phone1 = request.getParameterValues("compMyPhone1");
		String phone2 = request.getParameter("compMyPhone2");
		String phone3 = request.getParameter("compMyPhone3");
		String busiNum1 = request.getParameter("compMyBusiNum1");
		String busiNum2 = request.getParameter("compMyBusiNum2");
		String busiNum3 = request.getParameter("compMyBusiNum3");
		String compMyName = request.getParameter("compMyName");
		String companyAddress = request.getParameter("compMyAddress");
		String route = request.getParameter("compMyRoute");

		String userEmail = email1 + "@" + email2;
		String userPhone = phone1[0] + "-" + phone2 + "-" + phone3;
		String companyNum = busiNum1 + "-" + busiNum2 + "-" + busiNum3;

		Member member = new Member(userId, userPwd, compMyCeoName, userEmail, userPhone, compMyName, companyNum,
				companyAddress, 2, null, route);
		System.out.println(member);
		int result1 = new MemberService().indiUpdateInsert(member);
		int result2 = new MemberService().compUpdateInsert(member);

		if (result1 > 0 && result2 > 0) {
		
			Member loginUser = new MemberService().compLogin(member);

			HttpSession session = request.getSession();
			session.setAttribute("loginUser", loginUser);
			session.setMaxInactiveInterval(600);

			response.sendRedirect("compMyPage.cm");

		} else {
			request.setAttribute("msg", "회원 정보 수정에 실패하였습니다.");
			request.getRequestDispatcher("WEB-INF/views/common/errorPage.jsp").forward(request, response);

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
