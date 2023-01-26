package com.assessment.abc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.assessment.abc.entity.Car;
import com.assessment.abc.repository.CarRepository;

@Service
@Transactional
public class CarService {
	
	@Autowired
	CarRepository repo;
	
	public void save(Car car) {
		repo.save(car);
	}
	
	public void delete(Car car) {
		repo.delete(car);
	}
	
	public Car get(Long id) {
		return repo.findById(id).get();
	}
	
	public List<Car> getAll(){
		return repo.findAll();
	}

	public List<Car> searchByKeyword(String keyword){
		return repo.searchCarByKeyword(keyword);
	}

	public List<Car> searchByPriceRange(Long min, Long max){
		return repo.searchCarByPriceRange(min, max);
	}

	public List<Car> listByUserId(Long userId){
		return repo.findByUserId(userId);
	}

	public List<Car> listActiveCars(){
		return repo.findActiveCars();
	}

	public Car findCarById(Long id){
		return repo.findCarById(id);
	}

	public Car getLastCar(){
		return repo.findTopByOrderByIdDesc();
	}
	
}
