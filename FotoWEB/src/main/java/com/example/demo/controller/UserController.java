package com.example.demo.controller;

import java.util.Date;
import java.util.List;

import javax.persistence.NamedNativeQuery;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.demo.AESEncryptionDecryption;
import com.example.demo.repository.UserRepository;

import model.Role;
import model.User;

@Controller
@RequestMapping(value = "usercontroller")
public class UserController {

	@Autowired
	UserRepository ur;
	
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String register(String email, String firstname, String lastname, String username, String password, String repassword, HttpServletRequest request) {
		try {
			
			User existUser = ur.findByUsername(username);

			if (existUser != null) {
				request.setAttribute("porukaReg", "Username already exists.");
				return "login/registration";
			}
			
			if(!password.equals(repassword)) {
				request.setAttribute("porukaReg", "Those passwords didn't match. Try again.");
				return "login/registration";
			}

			
			User u = new User();
			
			Role role = new Role();
			role.setRoleId(2);
			
			u.setRole(role);
			u.setRegistrationDate(new Date());
			
			u.setEmail(email);
			u.setFirstName(firstname);
			u.setLastName(lastname);
			u.setUsername(username);
			
			AESEncryptionDecryption aes = new AESEncryptionDecryption();
			String encryptedPassw = aes.encrypt(password);
			u.setPassword(encryptedPassw);
			
			ur.save(u);
			
			request.setAttribute("porukaLogSucc", "Successful registration. Login to your account.");
			request.setAttribute("user", u);
			
			return "login/login";
			
		} catch (Exception e1) {
			e1.printStackTrace();
			return "login/registration";
		}
	}

//	@Query("From fotodb.users U WHERE U.username = ?1 and U.password = ?2")
//	List<User> findUsersByUsernameAndPassword(String username, String password);
	
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(String username, String password, HttpServletRequest request, Model m) {
		if (username.isEmpty() || password.isEmpty())
			return "login/login";

		try {
			User user = ur.findByUsername(username);
			
			if (user == null) {
				request.setAttribute("porukaLog", "Wrong username or password.");
				return "login/login";
			}
			
			AESEncryptionDecryption aes = new AESEncryptionDecryption();
			String encryptedPassw = aes.encrypt(password);

			if (!user.getPassword().equals(encryptedPassw)) {
				request.setAttribute("porukaLog", "Wrong username or password.");
				return "login/login";
			}

			//System.out.println(user.getUsername() + user.getEmail() + user.getFirstName());
			request.getSession().setAttribute("user", user);
			
			
			return "redirect:/";

		} catch (Exception e) {
			return "login/login";
		}
		
	}
}
