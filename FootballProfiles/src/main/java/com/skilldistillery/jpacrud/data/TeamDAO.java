package com.skilldistillery.jpacrud.data;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpacrud.entities.Team;

@Transactional
@Repository
public interface TeamDAO {
	
	public Team getTeamById(int teamId);
	public List<Team> getTeams();
	public Team create(Team team);
	public Team update(int teamId, String teamName, String city, String country);
	public boolean delete(int teamId);

}
