package com.ktds.pingpong.member.web;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ktds.pingpong.member.biz.MemberBiz;
import com.ktds.pingpong.member.dao.sendEamil;
import com.ktds.pingpong.member.dao.sendPassword;
import com.ktds.pingpong.member.vo.MemberVO;

/**
 * Servlet implementation class emailAuth
 */
public class emailAuth extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private sendEamil send;   
    private MemberBiz memberBiz;
    private sendPassword sendpw;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public emailAuth() {
        super();
        send = new sendEamil();
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
		String email = request.getParameter("email");
		System.out.println("login" + email);
		
		String emailId = request.getParameter("emailId");
		System.out.println("forgot"+emailId);
		
		String authNum = "1";
		
		if (email != null){
			boolean isCheckId = memberBiz.isExistIdData(email);
			if ( isCheckId ) {
				StringBuffer json = new StringBuffer(); 
				json.append("{");
				json.append("\"isCheckId\" : " + isCheckId);
				json.append("}");
				
				PrintWriter out = response.getWriter();
				out.print(json.toString());
				out.flush();
				out.close();
			}
			else {
				authNum = send.RandomNum();
				
				send.dosendEmail(email, authNum);
				
				StringBuffer json = new StringBuffer(); 
				json.append("{");
				json.append("\"authNum\" : " + authNum);
				json.append("}");
				
				
				System.out.println(authNum);
				PrintWriter out = response.getWriter();
				out.print(json.toString());
				out.flush();
				out.close();
			}
		}
		
		if( emailId != null){
			boolean forgotPw = memberBiz.isExistIdData(emailId);
			if( forgotPw ) {
				MemberVO member = memberBiz.getPasswordById(emailId);
				sendpw.dosendEmail(emailId, member.getPassword());
				System.out.println("forgot password: "+member.getPassword());
				StringBuffer json = new StringBuffer(); 
				json.append("{");
				json.append("\"forgotPw\" : " + forgotPw);
				json.append("}");
				
				
				System.out.println(authNum);
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

}
