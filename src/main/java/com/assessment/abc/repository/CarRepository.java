package com.assessment.abc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.assessment.abc.entity.Car;


@Repository
public interface CarRepository extends JpaRepository<Car, Long> {
    
    @Query(value = "SELECT * FROM car WHERE " +
        "make LIKE %:keyword% OR " +
        "model LIKE %:keyword% OR " +
        "year LIKE %:keyword%", nativeQuery = true)
    List<Car> searchCarByKeyword(@Param("keyword") String keyword);



}
