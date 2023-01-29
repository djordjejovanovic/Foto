package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Bill;

public interface BillsRepository extends JpaRepository<Bill, Integer>{

	List<Bill> findAllByUserId(int userId);
}
