package com.wodedata.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.wodedata.web.helper.Qiniu;
import com.wodedata.web.helper.Qiniu.QiniuResponse;

@Service
public class UploadFileServ {
	
	@Autowired
	private Qiniu qiniu;
	
	public QiniuResponse upload(MultipartFile file) throws Exception{
		Date date = new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd-");
		String key = dateFormat.format(date)+UUID.randomUUID().toString();
		return qiniu.upload(file.getBytes(), key);
	}
}
