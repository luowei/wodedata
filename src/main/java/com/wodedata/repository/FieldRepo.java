package com.wodedata.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wodedata.domin.Field;
import com.wodedata.domin.Property;

public interface FieldRepo extends JpaRepository<Field, Integer>{
	
	Field findOneByProperty(Property property);
}
