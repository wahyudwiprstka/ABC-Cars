package com.assessment.abc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.assessment.abc.entity.CarBidding;

@Repository
public interface CarBidRepository extends JpaRepository<CarBidding, Long> {
    
}
