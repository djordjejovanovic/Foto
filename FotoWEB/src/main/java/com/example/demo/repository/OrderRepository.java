package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Order;

public interface OrderRepository extends JpaRepository<Order, Integer>{

	List<Order> findAllByUserId(int userId);
}
