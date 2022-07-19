package member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Member;

/**
 * Servlet implementation class CompJoinInsert
 */
@WebServlet("/compJoinInsert.cj")
public class CompJoinInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CompJoinInsert() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String userName = request.getParameter("companyCEOName");
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String busiNum1 = request.getParameter("busiNum1");
		String busiNum2 = request.getParameter("busiNum2");
		String busiNum3 = request.getParameter("busiNum3");
		String companyName = request.getParameter("companyName");
		String companyAddress = request.getParameter("companyAddress");
		String route = request.getParameter("route");

		String userEmail = email1 + "@" + email2;
		String userPhone = phone1 + "-" + phone2 + "-" + phone3;
		String companyNum = busiNum1 + "-" + busiNum2 + "-" + busiNum3;

		Member member = new Member(userId, userPwd, userName, userEmail, userPhone, companyName, companyNum,
				companyAddress, 2, null, route);
		System.out.println(member);
		int result = new MemberService().compJoinInsert(member, route);

		if (result > 0) {
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("msg", "회원가입실패");
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
