package com.assessment.abc.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String username;
	private String password;
	
	@OneToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "user_profile", referencedColumnName = "id")
	private UserProfile profile;
	
	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
			name = "user_role",
			joinColumns = {@JoinColumn(name = "user_id")},
			inverseJoinColumns = {@JoinColumn(name = "role_id")}
			)
	private List<Role> roles;

	@OneToMany(mappedBy = "user")
	private List<Car> cars;

	@OneToMany(mappedBy = "user")
	private List<CarBidding> bidding;

	@OneToMany(mappedBy = "user")
	private List<TestDrive> testDrives;
	
	public User() {
		
	}

	public User(Long id, String username, String password, UserProfile profile, List<Role> roles, List<Car> cars,
			List<CarBidding> bidding, List<TestDrive> testDrives) {
		this.id = id;
		this.username = username;
		this.password = password;
		this.profile = profile;
		this.roles = roles;
		this.cars = cars;
		this.bidding = bidding;
		this.testDrives = testDrives;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public UserProfile getProfile() {
		return profile;
	}

	public void setProfile(UserProfile profile) {
		this.profile = profile;
	}

	public List<Role> getRoles() {
		return roles;
	}

	public void setRoles(List<Role> roles) {
		this.roles = roles;
	}

	public List<Car> getCars() {
		return cars;
	}

	public void setCars(List<Car> cars) {
		this.cars = cars;
	}

	public List<CarBidding> getBidding() {
		return bidding;
	}

	public void setBidding(List<CarBidding> bidding) {
		this.bidding = bidding;
	}

	public List<TestDrive> getTestDrives() {
		return testDrives;
	}

	public void setTestDrives(List<TestDrive> testDrives) {
		this.testDrives = testDrives;
	}
	
	

}
