package com.assessment.abc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assessment.abc.entity.Car;
import com.assessment.abc.entity.TestDrive;
import com.assessment.abc.entity.User;

public interface TestDriveRepository extends JpaRepository<TestDrive, Long> {

    TestDrive findTestdriveById(Long id);

    List<TestDrive> findTestdriveByUser(User user);

    List<TestDrive> findTestdriveByCar(Car car);

    List<TestDrive> findAll();


    
}
