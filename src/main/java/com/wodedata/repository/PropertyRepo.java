package com.wodedata.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wodedata.domin.Property;

public interface PropertyRepo extends JpaRepository<Property, Integer>{
	
	Property findOneByKeyword(String keyword);
}
