package com.skilldistillery.jpacrud.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Team {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name = "team_name")
	private String teamName;
	private String city;
	private String country;

	public Team() {

	}

	public Team(String teamName, String city, String country) {
		super();
		this.teamName = teamName;
		this.city = city;
		this.country = country;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		return "Team [id=" + id + ", teamName=" + teamName + ", city=" + city + ", country=" + country + "]";
	}

}
