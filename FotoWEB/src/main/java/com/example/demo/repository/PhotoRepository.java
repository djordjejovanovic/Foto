package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Photo;

public interface PhotoRepository extends JpaRepository<Photo, Integer>{

}
