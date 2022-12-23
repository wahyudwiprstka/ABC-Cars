package com.assessment.abc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assessment.abc.entity.Role;
import com.assessment.abc.repository.RoleRepository;

@Service
@Transactional
public class RoleService {
	
	@Autowired
	RoleRepository repo;
	
	public Role get(Long id) {
		return repo.findById(id).get();
	}
	
	public List<Role> getAll(){
		return repo.findAll();
	}
	
}
