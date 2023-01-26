package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import model.User;

public interface UserRepository extends JpaRepository<User, Integer> {
	
	User findByUsername(String username);
	User findById(int id);
	
}
