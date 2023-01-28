package com.assessment.abc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.assessment.abc.entity.Car;
import com.assessment.abc.entity.User;


@Repository
public interface CarRepository extends JpaRepository<Car, Long> {
    
    @Query(value = "SELECT * FROM car WHERE " +
        "CONCAT_WS(' ', make, model, year) LIKE %:keyword% AND status = '1'", nativeQuery = true)
    List<Car> searchCarByKeyword(@Param("keyword") String keyword);

    @Query(value = "SELECT * FROM car WHERE " +
        "status = '1' AND (price >= :min OR price <= :max)",nativeQuery = true)
    List<Car> searchCarByPriceRange(@Param("min") Long min, @Param("max") Long max);

    List<Car> findCarsByUserId(Long userId);

    @Query(value = "SELECT * FROM car WHERE status = 1", nativeQuery = true)
    List<Car> findActiveCars();

    @Query(value = "SELECT * FROM car WHERE bidder = :bidder AND (status = 1 OR status = 2)", nativeQuery = true)
    List<Car> findCarsByBidder(@Param("bidder") User user);

    Car findCarById(Long id);

    Car findTopByOrderByIdDesc();

}
