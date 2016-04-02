package com.wodedata.web.front;

import java.io.IOException;

import com.wodedata.domin.UpFileInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.qiniu.common.QiniuException;

import com.wodedata.service.UploadFileServ;
import com.wodedata.web.helper.Qiniu.QiniuResponse;

@Controller
@RequestMapping("/uploadFile")
public class UploadC {

    @Autowired
    private UploadFileServ uploadFileServ;

    /**
     * 上传文件，返回响应
     *
     * @param file
     * @return
     * @throws QiniuException
     * @throws IOException
     */
    @RequestMapping("/upload")
    @ResponseBody
    public QiniuResponse uploadFile(MultipartFile file) throws Exception {
        return uploadFileServ.upload(file);
    }

    @RequestMapping("/removeFile")
    @ResponseBody
    public String removeFile(@RequestBody UpFileInfo upFileInfo) {
        try {
            uploadFileServ.removeFile(upFileInfo.getKey());
            return "{\"code\":1,\"msg\":\"删除成功!\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"code\":1,\"msg\":\"删除失败!\"}";
        }
    }


    /**
     * 保存上传的文件信息
     *
     * @param upFileInfo
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveFileInfo")
    @ResponseBody
//	@RequestMapping(value = "/saveFileInfo",method = RequestMethod.POST,headers = {"Content-type=application/json"})
    public String saveFileInfo(@RequestBody UpFileInfo upFileInfo) {
        try {
            uploadFileServ.saveFileInfo(upFileInfo);
            return "{\"code\":1,\"msg\":\"保存成功!\"}";
        } catch (Exception e) {
            e.printStackTrace();
            return "{\"code\":1,\"msg\":\"保存失败!\"}";
        }
    }


}
