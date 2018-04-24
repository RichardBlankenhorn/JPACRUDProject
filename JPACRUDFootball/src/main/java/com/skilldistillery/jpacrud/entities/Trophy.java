package com.skilldistillery.jpacrud.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Trophy {

	@Id
	@Column(name = "team_id")
	private int teamId;
	@Column(name = "champions_league")
	private int championsLeague;
	@Column(name = "league_titles")
	private int leagueTitles;
	@Column(name = "league_cups")
	private int leagueCups;

	public Trophy() {

	}

	public Trophy(int teamId, int championsLeague, int leagueTitles, int leagueCups) {
		super();
		this.teamId = teamId;
		this.championsLeague = championsLeague;
		this.leagueTitles = leagueTitles;
		this.leagueCups = leagueCups;
	}

	public int getChampionsLeague() {
		return championsLeague;
	}

	public void setChampionsLeague(int championsLeague) {
		this.championsLeague = championsLeague;
	}

	public int getLeagueTitles() {
		return leagueTitles;
	}

	public void setLeagueTitles(int leagueTitles) {
		this.leagueTitles = leagueTitles;
	}

	public int getLeagueCups() {
		return leagueCups;
	}

	public void setLeagueCups(int leagueCups) {
		this.leagueCups = leagueCups;
	}

	public int getTeamId() {
		return teamId;
	}

	@Override
	public String toString() {
		return "Trophy [teamId=" + teamId + ", championsLeague=" + championsLeague + ", leagueTitles=" + leagueTitles
				+ ", leagueCups=" + leagueCups + "]";
	}

}
