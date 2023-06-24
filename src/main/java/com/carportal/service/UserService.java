package com.carportal.service;

import java.util.HashSet;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.carportal.entity.User;
import com.carportal.repository.RoleRepository;
import com.carportal.repository.UserRepository;

@Service
@Transactional
public class UserService {
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	RoleRepository roleRepo;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	public String saveUser(User user) {
		String encodedPassword = passwordEncoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		user.setRoles(new HashSet<>(roleRepo.findBySpecificRoles("Users")));
		
		userRepo.save(user);
		
		return "User saved successfully";
	}
	
	public User findUserLogin(String username) {
	
		return userRepo.findByUserName(username);
		
	}
	
	public List<User> showAllUsers(){
		
		return userRepo.findAll();
	}
	
	public void updateUser(User user) {
		
		userRepo.save(user);
		
	}
	
	public Optional<User> getUserInfo(long uid){
		
		return userRepo.findById(uid);
		
	}
	
	public void deleteUser(long uid) {
		
		userRepo.deleteById(uid);
	}
	
	public void assignNewRole(User user, String role) {
		
		user.getRoles().clear();
		user.setRoles(new HashSet<>(roleRepo.findBySpecificRoles(role)));
		userRepo.save(user);
	}

}
