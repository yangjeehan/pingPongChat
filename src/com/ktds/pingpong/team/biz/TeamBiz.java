package com.ktds.pingpong.team.biz;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.ktds.pingpong.team.dao.TeamDAO;
import com.ktds.pingpong.team.vo.TeamListVO;
import com.ktds.pingpong.team.vo.TeamVO;

public class TeamBiz {
	
	private TeamDAO teamDAO;
	
	public TeamBiz(){
		teamDAO = new TeamDAO();
	}

	public int insertNewTeam(TeamVO team) {
		
		int newTeamId = teamDAO.insertNewTeam( team );
	
		return newTeamId;
		// 파라미터를 통해 VO로 team 새로운 가입 정보를 파라미터로 가졌왔다.
		// 그 파라미터 받은 정보 개체들을 memberDAO의 addNewMember로 파라미터를 통해 또 보냈다. 
	}
	
	public void insertNewTeamList(TeamListVO teamList){

		teamDAO.insertNewTeamList(teamList);
	}
	public List<TeamListVO> getOnlyWaitList(int teamId){
		List<TeamListVO> waitingList = teamDAO.getOnlyWaitList(teamId);
		return waitingList;
	}
	
	public List<TeamVO> getAllListTeam(){

		return teamDAO.getAllListTeam();
	}
	
	public List<TeamVO> getListTeamById(String email){

		return teamDAO.getListTeamById(email);
	}

	public TeamVO showDetail(int teamId) {
		TeamVO team = new TeamVO();
		team = teamDAO.showDetail(teamId);
		return team;
	}

	public boolean removeTeam(int teamId) {
		int deleteMemberAction = teamDAO.removeTeam(teamId);
		
		return deleteMemberAction > 0; // delete 성공 하면 true
		
	}
	
	public boolean removeTeamWaitList(String email, int teamId) {
		int deleteMemberAction = teamDAO.removeTeamWaitList(email, teamId);
		
		return deleteMemberAction > 0; // delete 성공 하면 true
		
	}

	public boolean teamLogin(int teamId, HttpServletRequest request) {
		TeamVO loginTeam = teamDAO.getTeamInfoById(teamId);
		
		if( loginTeam != null ){
			HttpSession session = request.getSession();
			session.setAttribute("_TEAM_", loginTeam);
		}
		
		return loginTeam != null;
		
	}
	
	public void getMemberCount(String email){
		List<TeamVO> teams = teamDAO.getTeamIdforCount(email);
		for( TeamVO team : teams ){
			teamDAO.updateMemberCount(team.getTeamId());
		}
		
	}

	public List<TeamVO> getLeaderTeamById(String email) {
		List<TeamVO> isLeaderTeams = teamDAO.getLeaderTeamById(email);
		
		return isLeaderTeams;
	}
	
	public List<TeamListVO> getMemberEmailByTeamId(int teamId) {
		List<TeamListVO> memberList = teamDAO.getMemberEmailByTeamId(teamId);
		
		return memberList;
	}

	public boolean deleteMember(String email, int teamId) {
		int isDelete = teamDAO.deleteMember(email, teamId);
		
			return isDelete > 0;
	}

	public void addNewMember(String[] emailList, int teamId) {
		for ( int i = 0; i < emailList.length; i++ ){
			teamDAO.addNewMember(emailList[i], teamId);
		}
	}

	
}
