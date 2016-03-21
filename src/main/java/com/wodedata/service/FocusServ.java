package com.wodedata.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wodedata.domin.Focus;
import com.wodedata.domin.Node;
import com.wodedata.domin.User;
import com.wodedata.repository.FocusRepo;
import com.wodedata.repository.NodeRepo;
import com.wodedata.repository.UserRepo;
import org.springframework.transaction.annotation.Transactional;

@Service
public class FocusServ {
	
	@Autowired
	private FocusRepo focusRepo;
	
	@Autowired
	private NodeRepo noderepo;
	
	@Autowired
	private UserRepo userRepo;
	
	public boolean isFocus(int nodeId,int userId){
		return focusRepo.findByNodeIdAndUserId(nodeId, userId) != null;
	}
	
	@Transactional
	public boolean focus(int nodeId,int userId){
		Focus focus=new Focus();
		Node node=noderepo.getOne(new Integer(nodeId));
		User user = userRepo.getOne(new Integer(userId));
		if(node!=null&&user!=null){
			focus.setCreateAt(new Date());
			focus.setNode(node);
			focus.setUser(user);
			focusRepo.save(focus);
			return true;
		}else{
			return false;
		}
	}
	
	@Transactional
	public boolean unFocus(int nodeId,int userId){
		Focus focus=focusRepo.findByNodeIdAndUserId(nodeId, userId);
		if(focus==null){
			return false;
		}else{
			focusRepo.delete(focus);
			return true;
		}
	}
}
