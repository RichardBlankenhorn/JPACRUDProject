package com.skilldistillery.jpacrud.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import com.skilldistillery.jpacrud.entities.Trophy;

@Component
@Transactional
public class TrophyDAOImpl implements TrophyDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Trophy getTrophyByTeamId(int teamId) {
		Trophy trophy = null;
		String query = "SELECT t FROM Trophy t WHERE t.id = :teamId";
		em.clear();
		try {
			trophy = em.createQuery(query, Trophy.class).setParameter("teamId", teamId).getSingleResult();
			return trophy;
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Trophy create(Trophy trophy) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Trophy update(int teamId, int championsLeague, int leagueTitles, int leagueCups) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean delete(int teamId) {
		// TODO Auto-generated method stub
		return false;
	}

}
