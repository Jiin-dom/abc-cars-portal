package com.carportal.service;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.TreeSet;
import java.util.stream.Collectors;
import static java.util.stream.Collectors.collectingAndThen;
import static java.util.stream.Collectors.toCollection;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.carportal.entity.Car;
import com.carportal.entity.CarBid;
import com.carportal.entity.User;
import com.carportal.repository.BiddingRepository;
import com.carportal.repository.CarRepository;


@Service
@Transactional
public class CarService {

	@Autowired
	private CarRepository carRepo;

	@Autowired
	private BiddingRepository bidRepo;
	

	public List<Car> getAllCars() {
		return carRepo.findAll();
	}

	public Car save(Car car) {
		return carRepo.save(car);
	}

	public Optional<Car> getCarInfo(long cid) {

		return carRepo.findById(cid);
	}
	
	public List<Car> findCarPosts(long uid){
		return carRepo.findBySellerId(uid);
	}
	
	public void deleteCar(long cid) {
		carRepo.deleteById(cid);
	}
	
	public List<Car> search(String keyword) {
		return carRepo.search(keyword);
		
	}

	public CarBid saveBid(CarBid bid) {

		return bidRepo.save(bid);
	}

	public List<CarBid> getAllBids() {

		List<CarBid> allBid = bidRepo.findAll();

		List<CarBid> sortedList = allBid.stream()
				.sorted(Comparator.comparingDouble(CarBid::getBiddingPrice).reversed()).collect(Collectors.toList());
		
		return sortedList;
	}
	
	public List<CarBid> findUserBid(User user, Car car) {
		return bidRepo.findByUserAndCar(user, car);
	}
	
	public Optional<CarBid> getBidInfo(long bid){
		return bidRepo.findById(bid);
	}
	
	public List<CarBid> getUserBids(User user){
		return bidRepo.findByUser(user);
	}
	
	public void deleteBid(long bid) {
		bidRepo.deleteById(bid);
	}
	

}
