package com.skilldistillery.jpacrud.entities;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.jpacrud.entities.Team;

class TeamTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	Team team;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("CrudApp");
		em = emf.createEntityManager();
		team = em.find(Team.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	void test_team_mappings() {
		assertEquals(1, team.getId());
		assertEquals("Chelsea FC", team.getTeamName());
		assertEquals("London", team.getCity());
		assertEquals("England", team.getCountry());
	}

}
