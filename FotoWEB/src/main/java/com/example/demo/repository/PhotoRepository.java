package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Order;
import model.Photo;

public interface PhotoRepository extends JpaRepository<Photo, Integer>{
	List<Photo> findAllByOrder(Order o);
}