package com.wodedata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wodedata.repository.FieldRepo;
import com.wodedata.repository.PropertyRepo;

@Service
public class FieldServ {
	
	@Autowired
	private FieldRepo fieldRepo;
	
	@Autowired
	private PropertyRepo propertyRepo;
}
