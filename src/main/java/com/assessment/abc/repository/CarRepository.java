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
        "CONCAT_WS(' ', make, model, year) LIKE %:keyword% AND status = '1'", nativeQuery = true)
    List<Car> searchCarByKeyword(@Param("keyword") String keyword);

    @Query(value = "SELECT * FROM car WHERE " +
        "status = '1' AND (price >= :min OR price <= :max)",nativeQuery = true)
    List<Car> searchCarByPriceRange(@Param("min") Long min, @Param("max") Long max);

    @Query(value = "SELECT * FROM car WHERE user_id = :keyword", nativeQuery = true)
    List<Car> findByUserId(@Param("keyword") Long keyword);

    @Query(value = "SELECT * FROM car WHERE status = 1", nativeQuery = true)
    List<Car> findActiveCars();

    Car findCarById(Long id);

    Car findTopByOrderByIdDesc();

}
