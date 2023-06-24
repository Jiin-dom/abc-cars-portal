package com.carportal.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.carportal.entity.User;

public interface UserRepository extends JpaRepository<User, Long>{

	User findByUserName(String name);
	
	
}
