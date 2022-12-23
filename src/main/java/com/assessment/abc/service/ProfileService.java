package com.assessment.abc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assessment.abc.entity.UserProfile;
import com.assessment.abc.repository.ProfileRepository;
@Service
@Transactional
public class ProfileService {
	
	@Autowired
	ProfileRepository repo;
	
	public void save(UserProfile profile) {
		repo.save(profile);
	}
	
	public void delete(UserProfile profile) {
		repo.delete(profile);
	}
	
	public UserProfile get(Long id) {
		return repo.findById(id).get();
	}
	
	public List<UserProfile> getAll(){
		return repo.findAll();
	}
	
	public UserProfile getByContact(String contact) {
		return repo.findByContact(contact);
	}
	
}
