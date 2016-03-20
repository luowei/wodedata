package com.wodedata.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.wodedata.domin.Collection;
import com.wodedata.domin.Topic;
import com.wodedata.domin.User;

public interface CollectionRepo extends JpaRepository<Collection, Integer>{

	Page<Collection> findByUserOrderByCreateAtDesc(User user,Pageable pageRequest);
	Collection findOneByTopicAndUser(Topic topic,User user);
}
