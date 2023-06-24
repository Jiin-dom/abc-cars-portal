package com.carportal.controller;

import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.security.Principal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;
import java.util.function.Predicate;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.carportal.entity.CarBid;
import com.carportal.entity.User;
import com.carportal.entity.Car;
import com.carportal.service.CarService;
import com.carportal.service.UserService;

@Controller
public class CarController {
	@Autowired
	CarService carService;

	@Autowired
	UserService userService;
	
//	@GetMapping("/")
//	public String handleRootRequest(Model model) {
//		return "redirect:homepage";
//	}
	
	@GetMapping("/")
	public String handleRootRequest(Model model) {
		return "redirect:landing";
	}
	
	@GetMapping("landing")
	public ModelAndView landing(@ModelAttribute("car") Car car) {

		List<Car> cars = carService.getAllCars();
		System.out.println(cars);

		return new ModelAndView("landing");
	}

	
	@GetMapping("homepage")
	public ModelAndView viewCars(@ModelAttribute("car") Car car) {

		List<Car> cars = carService.getAllCars();
		System.out.println(cars);

		return new ModelAndView("homepage", "cars", cars );
	}
	
	@GetMapping("carDetails")
	public String viewCarDetail(@RequestParam long cid, Model model) {

		Optional<Car> car_info = carService.getCarInfo(cid);
		System.out.println(car_info);

		Car cardata = car_info.get();

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBid> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBid> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBiddingPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}

		return "carDetails";
	}
	
	
	@PostMapping("car_post")
	public String saveCar(@ModelAttribute("car") Car car, RedirectAttributes ra,
			@RequestParam("fileImage") MultipartFile multipartFile, Principal principal) throws IOException {

		String fileName = StringUtils.cleanPath(multipartFile.getOriginalFilename());
		
		car.setPhotos(fileName);

		Car savedCar = carService.save(car);

		String uploadDir = "./src/main/resources/static/images/car-photo/" + savedCar.getId();

		Path uploadPath = Paths.get(uploadDir);

		if (!Files.exists(uploadPath)) {
			Files.createDirectories(uploadPath);
		}

		try (InputStream inputStream = multipartFile.getInputStream()) {
			Path filePath = uploadPath.resolve(fileName);
			System.out.println(filePath.toFile().getAbsolutePath());
			Files.copy(inputStream, filePath, StandardCopyOption.REPLACE_EXISTING);
		} catch (IOException e) {
			throw new IOException("Could not save uploaded file: " + fileName);

		}

		car.setPhotoImagePath("/images/car-photo/" + savedCar.getId() + "/" + savedCar.getPhotos());

		// Get User name
		String uname = principal.getName();

		User user = userService.findUserLogin(uname);

		car.setSellerId(user.getId());

		carService.save(car);

		ra.addFlashAttribute("success_post", "Post has been saved successfully");

		return "redirect:homepage";
	}
	
	@PostMapping("bid")
	public String carBidding(@ModelAttribute("bidding") CarBid bid,
			@RequestParam(value = "cid", required = false) long id, Principal principal, Model model,
			@RequestParam("bidderPrice") double price) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findUserLogin(uname);

		// get Car
		Optional<Car> car_info = carService.getCarInfo(id);
		System.out.println(car_info);

		Car cardata = car_info.get();

		bid.setBidderName(user.getName());
		bid.setUser(user);
		bid.setCar(cardata);

		// before saving, check if user has placed a bid before
		List<CarBid> userBid = carService.findUserBid(user, cardata);
		System.out.println(userBid);

		if (userBid.size() > 0) {

			long bidId = userBid.stream().findAny().get().getId();
			Optional<CarBid> bid_info = carService.getBidInfo(bidId);
			System.out.println(bid_info);

			CarBid bidData = bid_info.get();

			bidData.setBiddingPrice(price);

			carService.saveBid(bidData);
			
			
		} else {
			carService.saveBid(bid);
			
		}

		// show car data

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBid> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBid> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());
		System.out.println(bdata);

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBiddingPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		
		Set<CarBid> highBid = new HashSet<CarBid>();
		highBid.add(bdata.get(0));
		
		//cardata.getBiddings().clear();
		cardata.setBiddings(highBid);
		carService.save(cardata);
		System.out.println(cardata.getBiddings());

		return "carDetails";
	}
	
	@PostMapping("book")
	public String carBooking(@ModelAttribute("booking") CarBid book,
			@RequestParam(value = "cid", required = false) long id, Principal principal, 
			Model model, @RequestParam("bookDate") String date) {

		// Get User name
		String uname = principal.getName();

		User user = userService.findUserLogin(uname);

		// get Car
		Optional<Car> car_info = carService.getCarInfo(id);
		System.out.println(car_info);

		Car cardata = car_info.get();

		book.setUser(user);
		book.setCar(cardata);
		book.setBidderName(user.getName());

		// before saving, check if user has placed a bidding before to add booking date
		List<CarBid> userBooking = carService.findUserBid(user, cardata);
		System.out.println(userBooking);

		if (userBooking.size() > 0) {

			long bookId = userBooking.stream().findAny().get().getId();
			Optional<CarBid> book_info = carService.getBidInfo(bookId);
			System.out.println(book_info);

			CarBid bookdata = book_info.get();
			
			bookdata.setBookingDate(date);

			carService.saveBid(bookdata);
		} else {
			
			carService.saveBid(book);
		}

		// show car data

		List<Car> car = new ArrayList<Car>();

		car.add(cardata);

		model.addAttribute("car", car);

		// show bidding data
		Predicate<CarBid> byCar = ucar -> ucar.getCar().equals(cardata);

		List<CarBid> bdata = carService.getAllBids().stream().filter(byCar).collect(Collectors.toList());
		System.out.println(bdata);

		model.addAttribute("bid", bdata);

		if (bdata.size() > 0) {
			double highest = bdata.get(0).getBiddingPrice();
			System.out.println(highest);
			model.addAttribute("highest", highest);
		}
		
		Set<CarBid> highBid = new HashSet<CarBid>();
		highBid.add(bdata.get(0));
		
		//cardata.getBiddings().clear();
		cardata.setBiddings(highBid);
		carService.save(cardata);
		System.out.println(cardata.getBiddings());
		

		return "carDetails";
	}
	
	
	
	@GetMapping("deletecar")
	public String deleteCar(@RequestParam long cid) {
		
		carService.deleteCar(cid);
		
		return "redirect:cars";
		
	}
	
	@GetMapping("carManagement")
	public ModelAndView showAllCar(@ModelAttribute("car") Car car) {
		
		List<Car> cars = carService.getAllCars();
		System.out.println(cars);
		
		return new ModelAndView ("carManagement", "cars", cars);
	}
	
	@PostMapping("edit_car")
	public String editCar(@ModelAttribute("car") Car car, 
			@RequestParam long cid) {
		
		Optional<Car> car_info = carService.getCarInfo(cid);
    	System.out.println(car_info);
    	
    	Car edit_car = car_info.get();
		
    	edit_car.setManufactureDate(car.getManufactureDate());
    	edit_car.setModel(car.getModel());
    	edit_car.setBrand(car.getBrand());
    	edit_car.setPrice(car.getPrice());
    	edit_car.setRegistration(car.getRegistration());
    	edit_car.setSellerId(car.getSellerId());
    	edit_car.setPhotos(car.getPhotos());
    	edit_car.setPhotoImagePath(car.getPhotoImagePath());
    	
    	carService.save(edit_car);
		
		return "redirect:carManagement";
	}
	
	@GetMapping("delete_car")
	public String deletePostCar(@RequestParam long cid) {
		
		carService.deleteCar(cid);
		
		return "redirect:carManagement";
		
	}
	
	@PostMapping("booking_status")
	public String setCarBookingStatus(@RequestParam long bid,
			@ModelAttribute("book") CarBid book) {
		
		Optional<CarBid> car_info = carService.getBidInfo(bid);
		CarBid car_booking = car_info.get();
		System.out.println(car_booking);
		
		car_booking.setBookingStatus(book.getBookingStatus());
		
		carService.saveBid(car_booking);
		
		return "redirect:carManagement";
	}
	
	@PostMapping("sale_status")
	public String setCarSaleStatus(@RequestParam long cid,
			@ModelAttribute("car") Car car) {
		
		Optional<Car> car_info = carService.getCarInfo(cid);
		Car car_sale = car_info.get();
		System.out.println(car_sale);
		
		car_sale.setSellStatus(car.getSellStatus());
		
		carService.save(car_sale);
		
		return "redirect:carManagement";
	}
	
	@GetMapping("search")
	public ModelAndView searchCars(@RequestParam String keyword, Model model) {
		
		List<Car> searchCar = carService.search(keyword);
		System.out.println(searchCar);
		
		model.addAttribute("keyword", keyword);
		
		return new ModelAndView ("searchCar", "searchCar", searchCar);
	}
}
