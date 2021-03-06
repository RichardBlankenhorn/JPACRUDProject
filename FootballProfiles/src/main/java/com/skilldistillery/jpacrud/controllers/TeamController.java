package com.skilldistillery.jpacrud.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.jpacrud.data.PlayerDAO;
import com.skilldistillery.jpacrud.data.TeamDAO;
import com.skilldistillery.jpacrud.data.TrophyDAO;
import com.skilldistillery.jpacrud.entities.Player;
import com.skilldistillery.jpacrud.entities.Position;
import com.skilldistillery.jpacrud.entities.Team;
import com.skilldistillery.jpacrud.entities.Trophy;

@Controller
public class TeamController {

	@Autowired
	private TeamDAO dao;
	@Autowired
	private PlayerDAO pdao;
	@Autowired
	private TrophyDAO tdao;

	@RequestMapping(path = "index.do", method = RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView();
		List<Team> teams = dao.getTeams();
		mv.addObject("teams", teams);
		mv.setViewName("WEB-INF/views/index2.jsp");
		return mv;
	}

	@RequestMapping(path = "team.do", method = RequestMethod.GET)
	public ModelAndView getTeamById(@RequestParam("tID") int teamId) {
		ModelAndView mv = new ModelAndView();
		Team team = dao.getTeamById(teamId);
		List<Player> players = pdao.getPlayersByTeam(teamId);
		Trophy trophy = tdao.getTrophyByTeamId(teamId);
		mv.addObject("trophy", trophy);
		mv.addObject("players", players);
		mv.addObject("team", team);
		mv.setViewName("WEB-INF/views/showteam.jsp");
		return mv;
	}

	@RequestMapping(path = "create.do", method = RequestMethod.POST)
	public ModelAndView createTeam(Team team) {
		ModelAndView mv = new ModelAndView();
		Team newTeam = dao.create(team);
		mv.addObject("newTeam", newTeam);
		mv.setViewName("WEB-INF/views/showteam.jsp");
		return mv;
	}

	@RequestMapping(path = "delete.do", method = RequestMethod.POST)
	public ModelAndView deleteTeam(@RequestParam(name = "teamID") int teamId) {
		ModelAndView mv = new ModelAndView();
		Boolean result = dao.delete(teamId);
		mv.clear();
		mv.addObject("result", result);
		mv.setViewName("redirect:index.do");
		return mv;
	}

	@RequestMapping(path = "update.do", method = RequestMethod.GET)
	public ModelAndView changeTeam(@RequestParam(name = "teamID") int teamId) {
		ModelAndView mv = new ModelAndView();
		Team team = dao.getTeamById(teamId);
		mv.addObject("origTeam", team);
		mv.setViewName("WEB-INF/views/changeTeam.jsp");
		return mv;
	}

	@RequestMapping(path = "updateTeam.do", method = RequestMethod.POST)
	public ModelAndView updateTeam(@RequestParam(name = "teamID") int teamId,
			@RequestParam(name = "teamName") String teamName, @RequestParam(name = "city") String city,
			@RequestParam(name = "country") String country) {
		ModelAndView mv = new ModelAndView();
		Team updatedTeam = dao.update(teamId, teamName, city, country);
		mv.addObject("team", updatedTeam);
		mv.setViewName("WEB-INF/views/showteam.jsp");
		return mv;
	}

	@RequestMapping(path = "newPlayer.do", method = RequestMethod.GET)
	public ModelAndView newPlayer(@RequestParam(name = "teamID") int teamId) {
		ModelAndView mv = new ModelAndView();
		Team team = dao.getTeamById(teamId);
		mv.addObject("team", team);
		mv.setViewName("WEB-INF/views/createPlayer.jsp");
		return mv;
	}

	@RequestMapping(path = "createPlayer.do", method = RequestMethod.POST)
	public ModelAndView createPlayer(@RequestParam(name = "teamID") int teamId,
			@RequestParam(name = "firstName") String firstName, @RequestParam(name = "lastName") String lastName,
			@RequestParam(name = "position") Position position, @RequestParam(name = "teamNumber") int teamNumber) {
		ModelAndView mv = new ModelAndView();
		Player player = new Player(firstName, lastName, position, teamNumber, teamId);
		Player newPlayer = pdao.create(player);
		mv.addObject("tID",newPlayer.getTeamId());
		mv.setViewName("redirect:team.do");
		return mv;
	}

}
