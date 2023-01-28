package com.assessment.abc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.assessment.abc.entity.Car;
import com.assessment.abc.entity.TestDrive;
import com.assessment.abc.entity.User;
import com.assessment.abc.repository.CarRepository;
import com.assessment.abc.repository.TestDriveRepository;

@Service
@Transactional
public class TestDriveService {
	
	@Autowired
	TestDriveRepository repo;
	
	public void save(TestDrive testDrive) {
		repo.save(testDrive);
	}
	
	public void delete(TestDrive testDrive) {
		repo.delete(testDrive);
	}
	
	public TestDrive get(Long id) {
		return repo.findById(id).get();
	}
	
	public List<TestDrive> getAll(){
		return repo.findAll();
	}

	public List<TestDrive> getByUser(User user){
		return repo.findTestdriveByUser(user);
	}

	public TestDrive getById(Long id){
		return repo.findTestdriveById(id);
	}

	public List<TestDrive> getByCar(Car car){
		return repo.findTestdriveByCar(car);
	}
	
}
