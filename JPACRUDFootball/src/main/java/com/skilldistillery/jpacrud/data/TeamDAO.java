package com.skilldistillery.jpacrud.data;

import java.util.List;

import com.skilldistillery.jpacrud.entities.Team;

public interface TeamDAO {
	
	public Team getTeamById(int teamId);
	public List<Team> getTeams();
	public Team create(Team team);
	public Team update(int teamId, Team team);
	public boolean delete(int teamId);

}
