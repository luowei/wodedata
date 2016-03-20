package com.wodedata.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.wodedata.domin.Follow;
import com.wodedata.domin.User;

public interface FollowReop extends JpaRepository<Follow, Integer>{
	Page<Follow> findByUserByFollowerIdOrderByCreateAtDesc(User following,Pageable pageRequest);
	Page<Follow> findByUserByFollowingIdOrderByCreateAtDesc(User follower,Pageable pageRequest);
	
	/**
	 * 按照追随者和追随着查找追随
	 * @param following 追随着
	 * @param follower 追随者
	 * @return
	 */
	Follow findOneByUserByFollowerIdAndUserByFollowingId(User following,User follower);
}
