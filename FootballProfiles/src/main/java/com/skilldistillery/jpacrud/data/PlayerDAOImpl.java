package com.skilldistillery.jpacrud.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.jpacrud.entities.Player;

@Component
@Transactional
public class PlayerDAOImpl implements PlayerDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public Player getPlayerById(int playerId) {
		String query = "SELECT p FROM Player p WHERE p.id = :id";
		Player p = em.createQuery(query, Player.class).setParameter("id", playerId).getSingleResult();
		return p;
	}

	@Override
	public List<Player> getPlayersByTeam(int teamId) {
		String query = "SELECT p FROM Player p WHERE p.teamId = :id";
		em.clear();
		List<Player> players = em.createQuery(query, Player.class).setParameter("id", teamId).getResultList();
		return players;
	}

	@Override
	public Player create(Player player) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Player update(int playerId, Player player) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int playerId) {
		// TODO Auto-generated method stub
		return false;
	}

}
