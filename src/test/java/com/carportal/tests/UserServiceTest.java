package com.carportal.tests;

import java.util.HashSet;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.MockitoJUnitRunner;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.carportal.entity.User;
import com.carportal.repository.RoleRepository;
import com.carportal.repository.UserRepository;
import com.carportal.service.UserService;

@RunWith(MockitoJUnitRunner.class)
public class UserServiceTest {
	@InjectMocks
	UserService userService;
	
	@Mock
	RoleRepository roleRepository;
	
	@Mock
	PasswordEncoder passwordEncoder;
	
	@Mock
	UserRepository userRepository;
	
	@Before
	public void setUp() {
		MockitoAnnotations.initMocks(this);
	}
	
	@Test
	public void registerUserTest() {
		User user = new User();
		user.setId((long) 1);
		user.setName("Register");
		user.setUserName("Register");
		user.setEmail("register@gmail.com");
		String encodedPassword = passwordEncoder.encode("Register");
		user.setPassword(encodedPassword);
		user.setRoles(new HashSet<>(roleRepository.findBySpecificRoles("Users")));
		Mockito.when(userRepository.save(user)).thenReturn(user);
		String userResponse = userService.saveUser(user);
		Assert.assertEquals("User saved successfully", userResponse);
	}
	
	@Test
	public void registerRetrieval() {
		User user = new User();
		String userName = "Register";
		user.setUserName(userName);
		Mockito.when(userRepository.findByUserName(userName)).thenReturn(user);
		User loginUser = userService.findUserLogin(userName);
		Assert.assertEquals(user, loginUser);
	}
}
