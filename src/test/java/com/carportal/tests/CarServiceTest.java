package com.carportal.tests;

import java.util.ArrayList;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;

import com.carportal.entity.Car;
import com.carportal.entity.CarBid;
import com.carportal.entity.User;
import com.carportal.repository.BiddingRepository;
import com.carportal.repository.CarRepository;
import com.carportal.service.CarService;

@RunWith(MockitoJUnitRunner.class)
public class CarServiceTest {
	
	@InjectMocks
	CarService carService;
	
	@Mock
	CarRepository carRepository;
	
	@Mock
	BiddingRepository bidRepository;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void testSavingCar() {
		Car car = new Car();
		car.setId((long) 1);
		car.setBrand("Test Car");
		car.setModel("Testing");
		car.setPrice("33000");
		car.setManufactureDate("2020");
		car.setRegistration("June 2020");
		Mockito.when(carRepository.save(car)).thenReturn(car);
		Car savedCar = carService.save(car);
		Assert.assertEquals(car, savedCar);
		
	}
	
	@Test
	public void testSearchingCar() {
		Car car = new Car();
		String searchInput = "Testing";
		car.setModel(searchInput);
		
		List<Car> searchCar = new ArrayList<Car>();
		searchCar.add(car);
		
		Mockito.when(carRepository.search(searchInput)).thenReturn(searchCar);
		List<Car> search = carService.search(searchInput);
		Assert.assertEquals(searchCar, search);
	}
	
	
	@Test
	public void testSavingCarBidding() {
		Car car = new Car();
		car.setBrand("Test Car");
		User user = new User();
		user.setName("Fake User");
		CarBid bid = new CarBid();
		bid.setCar(car);
		bid.setUser(user);
		bid.setBiddingPrice(8000);
		
		Mockito.when(bidRepository.save(bid)).thenReturn(bid);
		CarBid saveBid = carService.saveBid(bid);
		Assert.assertEquals(bid, saveBid);
		
	}
}
