package com.wodedata.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.wodedata.domin.Section;

public interface SectionRepo extends JpaRepository<Section, Integer>{
	Section findOneByName(String name);
}
