package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import model.Pricelist;

public interface PricelistRepository extends JpaRepository<Pricelist, Integer> {

}
