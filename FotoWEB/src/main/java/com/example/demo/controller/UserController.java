package com.example.demo.controller;

import java.util.Date;
import java.util.List;

import javax.persistence.NamedNativeQuery;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.repository.UserRepository;

import model.Role;
import model.User;

@Controller
@RequestMapping(value = "usercontroller")
public class UserController {

	@Autowired
	UserRepository ur;
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(String email, String firstname, String lastname, String username, String password) {
		try {
			
			User u = new User();
			
			Role role = new Role();
			role.setRoleId(2);
			
			u.setRole(role);
			u.setRegistrationDate(new Date());
			
			u.setEmail(email);
			u.setFirstName(firstname);
			u.setLastName(lastname);
			u.setUsername(username);
			u.setPassword(password);
			
			ur.save(u);
			
			return "login/login";
			
		} catch (Exception e1) {
			e1.printStackTrace();
			return "login/registration";
		}
	}

//	@Query("From fotodb.users U WHERE U.username = ?1 and U.password = ?2")
//	List<User> findUsersByUsernameAndPassword(String username, String password);
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String username, String password, HttpServletRequest request) {
		if (username.isEmpty() || password.isEmpty())
			return "login/login";

		try {
			User u = ur.findByUsername(username);

			if (u == null || !u.getPassword().equals(password)) {
				request.setAttribute("poruka", "Wrong username or password.");
				return "login/login";
			}

			return "index";

		} catch (Exception e) {
			return "login/login";
		}
		
	}
}
