package com.ktds.pingpong.chat.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.pingpong.chat.biz.ChatBiz;
import com.ktds.pingpong.team.vo.TeamVO;

/**
 * Servlet implementation class GetNickNameServlet
 */
public class GetNickNameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ChatBiz chatBiz;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetNickNameServlet() {
        super();
        chatBiz = new ChatBiz();
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
		
		HttpSession session = request.getSession();
		TeamVO loginTeam = (TeamVO) session.getAttribute("_TEAM_");
		
		int teamId = loginTeam.getTeamId();
		
		List<String> memberList = chatBiz.getMemberByTeamId(teamId);
		
		System.out.println("Team ID = " + teamId);
		
		request.setAttribute("memberList", memberList);
		RequestDispatcher rd = request.getRequestDispatcher("/goMain");
		rd.forward(request, response);	
		}

}
