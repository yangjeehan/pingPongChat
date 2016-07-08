package com.ktds.pingpong.chat.web;

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
import com.ktds.pingpong.chat.vo.ChatVO;
import com.ktds.pingpong.history.biz.OperationHistoryBiz;
import com.ktds.pingpong.history.vo.ActionCode;
import com.ktds.pingpong.history.vo.BuildDescription;
import com.ktds.pingpong.history.vo.Description;
import com.ktds.pingpong.history.vo.OperationHistoryVO;
import com.ktds.pingpong.member.vo.MemberVO;
import com.ktds.pingpong.team.biz.TeamBiz;
import com.ktds.pingpong.team.vo.TeamVO;

/**
 * Servlet implementation class GetChatByKeywordServlet
 */
public class GetChatByKeywordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private ChatBiz chatBiz;
    private TeamBiz teamBiz;
    private CalendarBiz calendarBiz;
    private OperationHistoryBiz historyBiz;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetChatByKeywordServlet() {
        super();
        chatBiz = new ChatBiz();
        teamBiz = new TeamBiz();
        calendarBiz = new CalendarBiz();
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
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("_MEMBER_");
		TeamVO loginTeam = (TeamVO) session.getAttribute("_TEAM_");
		OperationHistoryVO historyVO = new OperationHistoryVO();

		if( loginTeam != null ){
			int teamId = loginTeam.getTeamId(); 
			
			String keyword = request.getParameter("keyword");
			
			System.out.println("키워드는 " + keyword);
			System.out.println("팀아이디는 " + teamId);
			
			List<String> memberList = chatBiz.getMemberByTeamId(teamId);
			request.setAttribute("allChatMember", memberList);
			
			List<ChatVO> keychatList = chatBiz.getChatByKeyword(keyword, teamId);
			request.setAttribute("keychatList", keychatList);
			
			List<String> keywords = chatBiz.getKeywordByTeamId(teamId);
			request.setAttribute("keywords", keywords);
			
			List<CalendarVO> calNotice = calendarBiz.getCalNoticebyTeamId(teamId);
			request.setAttribute("calNotice", calNotice);
		
		
		 	 historyVO.setIp(request.getRemoteHost());
	         historyVO.setEmail(loginMember.getEmail());
	         historyVO.setUrl(request.getRequestURI());
	         historyVO.setActionCode(ActionCode.CHAT);
	         historyVO.setDescription(BuildDescription
	               .get(Description.SEARCH_CHA , loginMember.getEmail() , keyword )
	               );
	         historyBiz.addHistory(historyVO);
		}
		
		List<TeamVO> teams = teamBiz.getListTeamById(loginMember.getEmail());
		request.setAttribute("allTeams", teams);
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/chat/chat_keyword_view.jsp");
		rd.forward(request, response);
		
	}

}
