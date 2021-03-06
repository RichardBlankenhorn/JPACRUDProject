package com.skilldistillery.jpacrud.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpacrud.entities.Player;
import com.skilldistillery.jpacrud.entities.Team;

@Component
@Transactional
public class TeamDAOImpl implements TeamDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Team getTeamById(int teamId) {
		Team team = null;
		String query = "SELECT t FROM Team t WHERE t.id = :teamId";
		em.clear();
		try {
			team = em.createQuery(query, Team.class).setParameter("teamId", teamId).getSingleResult();
			return team;
		} catch (Exception e) {
			return null;
		}

	}

	@Override
	public List<Team> getTeams() {
		String query = "SELECT t FROM Team t";
		em.clear();
		List<Team> teams = em.createQuery(query, Team.class).getResultList();
		return teams;
	}

	@Override
	public Team create(Team team) {
		em.clear();
		em.persist(team);
		em.flush();
		return team;
	}

	@Override
	public Team update(int teamId, String teamName, String city, String country) {
		String query = "SELECT t FROM Team t WHERE id = :teamId";
		try {
			Team getTeam = em.createQuery(query, Team.class).setParameter("teamId", teamId).getSingleResult();
			getTeam.setTeamName(teamName);
			getTeam.setCity(city);
			getTeam.setCountry(country);
			System.out.println(getTeam.getTeamName());
			return getTeam;
		} catch (Exception e) {
			System.out.println("Error Updating");
			return null;
		}
	}

	@Override
	public boolean delete(int teamId) {
		String query = "SELECT t FROM Team t WHERE id = :teamId";
		String query2 = "SELECT p FROM Player p WHERE team_id = :teamId";
		try {
			Team team = em.createQuery(query, Team.class).setParameter("teamId", teamId).getSingleResult();
			List<Player> players = em.createQuery(query2, Player.class).setParameter("teamId", teamId).getResultList();
			if (players.size() > 0) {
				for (Player p : players) {
					em.remove(p);
				}
			}
			em.remove(team);
			return true;
		} catch (Exception e) {
			return false;
		}
	}

}
