package com.wodedata.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.wodedata.web.form.EmailForm;
import com.wodedata.web.helper.MyMailSender;

@Service
public class MailServ {
	
	@Autowired
	private MyMailSender myMailSender;
	
	public boolean send(EmailForm emailForm){
		return myMailSender.send(emailForm.getTo(), emailForm.getTitle(), emailForm.getContent());
	}
}
