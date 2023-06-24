package com.carportal.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;

import org.springframework.data.annotation.CreatedDate;

import com.carportal.entity.CarBid;

import javax.persistence.Entity;

@Entity
public class Car {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@Column(nullable = true, length = 64)
	private String photos;

	@Column(nullable = true, length = 64)
	private String photoImagePath;
	
	@OneToMany(mappedBy = "car")
	private Set<CarBid> biddings = new HashSet<CarBid>();
	
	private String brand;

	private String manufactureDate;

	private String model;

	private String registration;

	private String price;
	
	private Long sellerId;
	
	private String sellStatus;
	
	@CreatedDate
	private String postDate;
	
	@PrePersist
	private void onCreate() {

		DateFormat dateOnly = new SimpleDateFormat("EEEEE dd MMMMM yyyy");

		postDate = dateOnly.format(new Date());

	}
	
	public Car() {

	}

	public Car(Long id, String photos, String photoImagePath, String brand, String manufactureDate, String model,
			String registration, String price, Long sellerId) {
		super();
		this.id = id;
		this.photos = photos;
		this.photoImagePath = photoImagePath;
		this.brand = brand;
		this.manufactureDate = manufactureDate;
		this.model = model;
		this.registration = registration;
		this.price = price;
		this.sellerId = sellerId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public String getPhotoImagePath() {
		return photoImagePath;
	}

	public void setPhotoImagePath(String photoImagePath) {
		this.photoImagePath = photoImagePath;
	}

	public Set<CarBid> getBiddings() {
		return biddings;
	}

	public void setBiddings(Set<CarBid> biddings) {
		this.biddings = biddings;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getManufactureDate() {
		return manufactureDate;
	}

	public void setManufactureDate(String manufactureDate) {
		this.manufactureDate = manufactureDate;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public String getRegistration() {
		return registration;
	}

	public void setRegistration(String registration) {
		this.registration = registration;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Long getSellerId() {
		return sellerId;
	}

	public void setSellerId(Long sellerId) {
		this.sellerId = sellerId;
	}

	public String getSellStatus() {
		return sellStatus;
	}

	public void setSellStatus(String sellStatus) {
		this.sellStatus = sellStatus;
	}

	public String getPostDate() {
		return postDate;
	}

	public void setPostDate(String postDate) {
		this.postDate = postDate;
	}
	
	@Override
	public String toString() {
		return "Car [id=" + id + ", photos=" + photos + ", photoImagePath=" + photoImagePath + ", name=" + brand
				+ ", manufactureDate=" + manufactureDate + ", model=" + model + ", registeration=" + registration + ", price=" + price
				+ ", sellerId=" + sellerId + ", postDate=" + postDate + "]";
	}
}
