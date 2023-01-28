package com.assessment.abc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.assessment.abc.entity.User;
import com.assessment.abc.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	UserRepository repo;
	
	public void save(User user) {
		String password = user.getPassword();
		repo.save(user);
	}
	
	public void delete(User user) {
		repo.delete(user);
	}
	
	public User get(Long id) {
		return repo.findById(id).get();
	}
	
	public User getByUsername(String username) {
		return repo.findByUsername(username);
	}
	
	public List<User> getAll(){
		return repo.findAll();
	}

	public User findById(Long id){
		return repo.findUserById(id);
	}
	
}
