package com.assessment.abc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.assessment.abc.entity.TestDrive;

public interface TestDriveRepository extends JpaRepository<TestDrive, Long> {
    
}
