package com.assessment.abc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assessment.abc.entity.CarBidding;
import com.assessment.abc.repository.CarBidRepository;

@Service
@Transactional
public class CarBidService {
	
	@Autowired
	CarBidRepository repo;
	
	public void save(CarBidding carbid) {
		repo.save(carbid);
	}
	
	public void delete(CarBidding carbid) {
		repo.delete(carbid);
	}
	
	public CarBidding get(Long id) {
		return repo.findById(id).get();
	}
	
	public List<CarBidding> getAll(){
		return repo.findAll();
	}
	
}
