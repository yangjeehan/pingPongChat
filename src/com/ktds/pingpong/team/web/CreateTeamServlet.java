package com.ktds.pingpong.team.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.pingpong.history.biz.OperationHistoryBiz;
import com.ktds.pingpong.history.vo.ActionCode;
import com.ktds.pingpong.history.vo.BuildDescription;
import com.ktds.pingpong.history.vo.Description;
import com.ktds.pingpong.history.vo.OperationHistoryVO;
import com.ktds.pingpong.member.vo.MemberVO;
import com.ktds.pingpong.team.biz.TeamBiz;
import com.ktds.pingpong.team.vo.TeamListVO;
import com.ktds.pingpong.team.vo.TeamVO;

/**
 * Servlet implementation class ListTeamServlet
 */
public class CreateTeamServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TeamBiz teamBiz;
	private OperationHistoryBiz historyBiz;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateTeamServlet() {
        super();
        teamBiz = new TeamBiz();
        historyBiz = new OperationHistoryBiz();
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
		request.setCharacterEncoding("UTF-8");
		TeamVO team = new TeamVO();
		TeamListVO teamList = new TeamListVO();
		OperationHistoryVO historyVO = new OperationHistoryVO();
		
		team.setTeamName(request.getParameter("teamName"));
		
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("_MEMBER_");
		String leaderEmail = member.getEmail();
		team.setLeaderEmail(leaderEmail);
		
		String[] emailList = request.getParameterValues("email");
		
		List<String> emails = new ArrayList<String>();
		Collections.addAll(emails, emailList);
		
		for (int i=0; i < emails.size(); i++ ){
			if (emails.get(i).equals("") || emails.get(i) == null){
				emails.remove(i);
				i--;
			}
		}
		
		emails.add(leaderEmail);
		
		int newTeamId = teamBiz.insertNewTeam(team);
		
		for ( String selectedEmail : emails ){
			
			teamList.setTeamId(newTeamId);
			teamList.setEmail(selectedEmail);
			if ( selectedEmail.equals(leaderEmail) ){
			teamList.setIsLeader("Y");
			}
			else {
				teamList.setIsLeader("N");
			}
			if ( newTeamId > 0 ) {
				teamBiz.insertNewTeamList(teamList);
			}
		}
		
		for (int i=0; i < emails.size(); i++ ){
			
			if( emails.get(i) != null || emails.size() != 0 ){
				historyVO.setIp(request.getRemoteHost());
				historyVO.setEmail(leaderEmail);
				historyVO.setUrl(request.getRequestURI());
				historyVO.setActionCode(ActionCode.TEAM);
				historyVO.setDescription(BuildDescription
						.get(Description.TEAM_CREATE , request.getParameter("teamName") , emails.get(i))
						);
				historyBiz.addHistory(historyVO);
				
			}	
		}
		response.sendRedirect("/goMain");
	}

}
