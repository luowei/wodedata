package com.wodedata.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import com.wodedata.domin.UpFileInfo;
import com.wodedata.repository.UpFileRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.wodedata.web.helper.Qiniu;
import com.wodedata.web.helper.Qiniu.QiniuResponse;

@Service
public class UploadFileServ {
	
	@Autowired
	private Qiniu qiniu;

	@Autowired
	private UpFileRepo upFileRepo;
	
	public QiniuResponse upload(MultipartFile file) throws Exception{
		Date date = new Date();
		SimpleDateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd-");
		String key = dateFormat.format(date)+UUID.randomUUID().toString();
		return qiniu.upload(file.getBytes(), key);
	}

	public void saveFileInfo(UpFileInfo upFileInfo) {
		upFileInfo.setCreateAt(new Date());
		upFileRepo.save(upFileInfo);
	}

	//获得第p页的所有文件
	public Page<UpFileInfo> getAllUpFile(int page) {
		PageRequest pageRequest = new PageRequest(--page, 20);
		return upFileRepo.findAll(pageRequest);
	}

	//根据id删除这一列的文件
	@Transactional
	public void deleteById(int id) {
		UpFileInfo file = upFileRepo.findOne(id);
		qiniu.deleteFileByKey(file.getKey());

		upFileRepo.delete(id);

	}

	//根据fileKey删除记录
	@Transactional
	public void removeFile(String fileKey) {
		qiniu.deleteFileByKey(fileKey);
		upFileRepo.deleteByKey(fileKey);
	}

	public UpFileInfo findByUrl(String preImageUrl) {
		List<UpFileInfo> list = upFileRepo.findByUrlOrderByIdDesc(preImageUrl);
		return list.size() > 0 ? list.get(0) :null;
	}

	//根据url删除记录
	@Transactional
	public void deleteByUrl(String url) {
		qiniu.deleteFileByUrl(url.trim());
		upFileRepo.deleteByUrl(url.trim());
	}
}
