package com.carportal.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.carportal.entity.Car;
import com.carportal.entity.CarBid;
import com.carportal.entity.User;
import com.carportal.service.CarService;
import com.carportal.service.UserService;

@Controller
public class AuthController {

	@Autowired
	UserService userService;
	
	@Autowired
	CarService carService;
	
    @GetMapping("loginForm")
    public String onLogin() {
        return "loginForm";
    }
    
    @GetMapping("login_error")
    public String onLoginError(Model model) {
        String error_msg = "Incorrect username or password. Try Again.";
        model.addAttribute("error_string", error_msg);
        return "redirect:loginForm";
    }
    
//    @GetMapping("logout")
//    public String onLogoutSuccess(Model model) {
////    	String success_logout = "Successfully logged Out!";
////        model.addAttribute("success_logout", success_logout);
//    	return "landing";
//    }
    
    @GetMapping("registerForm")
    public String showRegistrationForm(@ModelAttribute("user") User user) {
    	return "registerForm";
    }
    
    @PostMapping("registerForm")
    public String registerUser(@ModelAttribute("user") User user, Model model) {
    	
    	userService.saveUser(user);
    	
    	String success_register = "Registeration Successful! ";
    	model.addAttribute("success_register", success_register);
    	
    	return "loginForm";
    }
    
    @GetMapping("userProfile")
    public String showProfile(Model model, Principal principal) {
    	
    	//Get User name
    	String userName = principal.getName();
    	System.out.println(userName);
    	
    	User userdata = userService.findUserLogin(userName);
    	
    	long uid = userdata.getId();
    	
    	List<User> user = new ArrayList<User>();
    	
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	System.out.println(user);
    	
    	//Get user car posts
    	List<Car> cars = carService.findCarPosts(uid);
    	System.out.println(cars);
    	
    	model.addAttribute("cars", cars);
    	
    	//Get user bidding or booking or both
    	List<CarBid> bids = carService.getUserBids(userdata);
    	System.out.println(bids);
    	
    	model.addAttribute("bids", bids);
    	
    	return "userProfile";
    }
    
    @PostMapping("update")
    public String updateUser(Principal principal,  @ModelAttribute("user") User u) {
    	
    	//Get User name
    	String username = principal.getName();
    	
    	User user = userService.findUserLogin(username);
    	user.setName(u.getName());
    	user.setUserName(u.getUserName());
    	user.setEmail(u.getEmail());
    	user.setMobile(u.getMobile());
//    	user.setAddress(u.getAddress());
    	
    	userService.updateUser(user);
    	System.out.println("Update User Successful");
    	System.out.println(user);
    	
    	return "redirect:userProfile";
    }
    
    
    
    @GetMapping("userManagement")
    public ModelAndView showAllUser() {
    	List<User> user = userService.showAllUsers();   	
    	return new ModelAndView ("userManagement", "user", user);
    }
    
    //userManagement jsp
    @GetMapping("view")
    public String userProfile(@RequestParam long uid, Model model) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User userdata = user_info.get();
    	
    	List<User> user = new ArrayList<User>();
    	user.add(userdata);
    	
    	model.addAttribute("user", user);
    	System.out.println(user);
    	
    	//Get user car posts
    	List<Car> cars = carService.findCarPosts(uid);
    	System.out.println(cars);
    	
    	model.addAttribute("cars", cars);
    	
    	return "userProfile";	
    }
    
    
    //userManagement jsp
    @GetMapping("delete")
    public String deleteUser(@RequestParam long uid) {
    	
    	userService.deleteUser(uid);
    	
    	return "redirect:users";
    }
    
  //userManagement jsp
    @PostMapping("edit")
    public String editUser(@RequestParam long uid,
    		@ModelAttribute("user") User u) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    	
    	user.setName(u.getName());
    	user.setUserName(u.getUserName());
    	user.setEmail(u.getEmail());
    	user.setMobile(u.getMobile());
//    	user.setAddress(u.getAddress());
    	
    	userService.updateUser(user);
    	System.out.println("Edit User Successful");
    	System.out.println(user);
    	
    	return "redirect:users";
    }
    
  //userManagement jsp
    @PostMapping("assign_role")
    public String assignRole(@RequestParam long uid,
    		@RequestParam("name") String role,
    		@ModelAttribute("user") User u) {
    	
    	Optional<User> user_info = userService.getUserInfo(uid);
    	System.out.println(user_info);
    	
    	User user = user_info.get();
    
    	userService.assignNewRole(user, role);
    	System.out.println(user);
    	 return "redirect:users";
    }
    
    
    @GetMapping("aboutUs")
    public String showAboutUsPage() {
    	
    	return "aboutUs";
    }
   
    @GetMapping("contactUs")
    public String showContactUsPage() {
    	
    	return "contactUs";
    }
}
