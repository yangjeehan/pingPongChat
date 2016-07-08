package com.ktds.pingpong.view;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ktds.pingpong.calendar.biz.CalendarBiz;
import com.ktds.pingpong.calendar.vo.CalendarVO;
import com.ktds.pingpong.chat.biz.ChatBiz;
import com.ktds.pingpong.member.biz.MemberBiz;
import com.ktds.pingpong.member.vo.MemberVO;
import com.ktds.pingpong.team.biz.TeamBiz;
import com.ktds.pingpong.team.vo.TeamVO;
import com.ktds.pingpong.util.RellyErrorMsg;

/**
 * Servlet implementation class goMain
 */
public class goMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TeamBiz teamBiz;   
	private MemberBiz memberBiz;
	private ChatBiz chatBiz;
	private CalendarBiz calendarBiz;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public goMain() {
        super();
        teamBiz = new TeamBiz();
        memberBiz = new MemberBiz();
        chatBiz = new ChatBiz();
        calendarBiz = new CalendarBiz();
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
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("_MEMBER_");
		TeamVO loginTeam = (TeamVO) session.getAttribute("_TEAM_");
		String message = (String)request.getParameter("error");
		if(message != null){
			int errorMsg =  Integer.parseInt(message);
			if(errorMsg == RellyErrorMsg.noText){
				System.out.println("에러메시지 주입");
				request.setAttribute("error", "왼쪽 하단에 Upload File을 눌러 </br> 팀별 텍스트를 입력하세요." );
			}
		}
		
		if( loginTeam != null ){
			int teamId = loginTeam.getTeamId(); 
		
			List<CalendarVO> calNotice = calendarBiz.getCalNoticebyTeamId(teamId);
			request.setAttribute("calNotice", calNotice);
			
			List<String> memberList = chatBiz.getMemberByTeamId(teamId);
			request.setAttribute("allChatMember", memberList);
			
			List<String> keywords = chatBiz.getKeywordByTeamId(teamId);
			request.setAttribute("keywords", keywords);
		}
		else{
		}
		List<MemberVO> members = memberBiz.getAllMember();  
		List<TeamVO> teams = teamBiz.getListTeamById(loginMember.getEmail());
		
		request.setAttribute("allTeams", teams);	
		request.setAttribute("allMember", members);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/view/main.jsp");
		rd.forward(request, response);
	}

}
