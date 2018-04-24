package com.skilldistillery.jpacrud.data;

import com.skilldistillery.jpacrud.entities.Trophy;

public interface TrophyDAO {
	
	public Trophy getTrophyByTeamId(int teamId);
	public Trophy create(Trophy trophy);
	public Trophy update(int teamId, int championsLeague, int leagueTitles, int leagueCups);
	public boolean delete(int teamId);

}
