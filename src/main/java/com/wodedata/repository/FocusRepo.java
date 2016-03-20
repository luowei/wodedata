package com.wodedata.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.wodedata.domin.Focus;

public interface FocusRepo extends JpaRepository<Focus, Integer>{
	@Query("SELECT f FROM Focus f WHERE f.node.id=?1 "
			+"AND f.user.id=?2")
	Focus findByNodeIdAndUserId(int nodeId,int userId);
}
