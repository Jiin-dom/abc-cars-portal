package com.carportal.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;

import com.carportal.entity.Car;
import com.carportal.entity.User;

@Entity
public class CarBid {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private String bidderName;

	private double biddingPrice;

	@CreatedDate
	private String biddingDate;

	@PrePersist
	private void onCreate() {

		DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");

		biddingDate = dateOnly.format(new Date());

	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "car_id")
	private Car car;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;
	
	private String bookingDate;
	
	private String bookingStatus;
	
	public CarBid() {
		
	}
	

	public CarBid(Long id, String bidderName, double biddingPrice, String biddingDate, Car car, User user,
			String bookingDate) {
		super();
		this.id = id;
		this.bidderName = bidderName;
		this.biddingPrice = biddingPrice;
		this.biddingDate = biddingDate;
		this.car = car;
		this.user = user;
		this.bookingDate = bookingDate;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getBidderName() {
		return bidderName;
	}


	public void setBidderName(String bidderName) {
		this.bidderName = bidderName;
	}


	public double getBiddingPrice() {
		return biddingPrice;
	}


	public void setBiddingPrice(double biddingPrice) {
		this.biddingPrice = biddingPrice;
	}


	public String getBiddingDate() {
		return biddingDate;
	}


	public void setBiddingDate(String biddingDate) {
		this.biddingDate = biddingDate;
	}


	public Car getCar() {
		return car;
	}


	public void setCar(Car car) {
		this.car = car;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public String getBookingDate() {
		return bookingDate;
	}


	public void setBookingDate(String bookingDate) {
		this.bookingDate = bookingDate;
	}


	public String getBookingStatus() {
		return bookingStatus;
	}


	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
	}
	
	@Override
	public String toString() {
		return "CarBidding [id=" + id + ", bidderName=" + bidderName + ", bidderPrice=" + biddingPrice + ", bidDate="
				+ biddingDate + ", car=" + car + ", user=" + user + ", bookDate=" + bookingDate + "]";
	}
	

}
