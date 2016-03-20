package com.wodedata.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.wodedata.domin.Notification;
import com.wodedata.domin.User;

public interface NotificationRepo extends JpaRepository<Notification, Integer>{
	Page<Notification>	findByUserAndStatus(User user,int status,Pageable pageRequest);
	long countByUserAndStatus(User user,int status);
}
