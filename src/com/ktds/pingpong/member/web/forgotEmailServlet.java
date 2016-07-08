package com.ktds.pingpong.member.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ktds.pingpong.member.biz.MemberBiz;
import com.ktds.pingpong.member.dao.sendPassword;
import com.ktds.pingpong.member.vo.MemberVO;

/**
 * Servlet implementation class forgotEmailServlet
 */
public class forgotEmailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberBiz memberBiz;
	private sendPassword sendpw;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public forgotEmailServlet() {
        super();
        memberBiz = new MemberBiz();
        sendpw = new sendPassword();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String emailId = request.getParameter("emailId");
		
		boolean forgotPw = memberBiz.isExistIdData(emailId);
		if( forgotPw ) {
			MemberVO member = memberBiz.getPasswordById(emailId);
			sendpw.dosendEmail(emailId, member.getPassword());
			
			
			StringBuffer json = new StringBuffer(); 
			json.append("{");
			json.append("\"forgotPw\" : " + forgotPw);
			json.append("}");
			
			PrintWriter out = response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		}
		else{
			StringBuffer json = new StringBuffer(); 
			json.append("{");
			json.append("\"forgotPw\" : " + forgotPw);
			json.append("}");
			
			PrintWriter out = response.getWriter();
			out.print(json.toString());
			out.flush();
			out.close();
		}
	}

}
