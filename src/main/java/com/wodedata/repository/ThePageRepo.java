package com.wodedata.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.wodedata.domin.ThePage;

public interface ThePageRepo extends JpaRepository<ThePage, Integer>{
	ThePage findOneByUrl(String url);
	
	@Modifying
	@Query(value="update page set page.view_count=page.view_count+1 where page.id=?1",
	nativeQuery=true)
	void plusViewCount(int id);
}
