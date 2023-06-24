package com.carportal.repository;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.carportal.entity.Car;
import com.carportal.entity.CarBid;
import com.carportal.entity.User;

@Repository
public interface BiddingRepository extends JpaRepository<CarBid, Long>{
	
	List<CarBid> findByUserAndCar(User user, Car car);
	
	List<CarBid> findByUser(User user);
}
