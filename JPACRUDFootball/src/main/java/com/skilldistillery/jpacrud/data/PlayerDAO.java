package com.skilldistillery.jpacrud.data;

import java.util.List;

import com.skilldistillery.jpacrud.entities.Player;

public interface PlayerDAO {
	
	public Player getPlayerById(int playerId);
	public List<Player> getPlayersByTeam(int teamId);
	public Player create(Player player);
	public Player update(int playerId, Player player);
	public boolean delete(int playerId);

}
