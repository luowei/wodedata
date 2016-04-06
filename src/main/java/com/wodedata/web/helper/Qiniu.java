package com.wodedata.web.helper;

import java.io.File;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;

public class Qiniu {
    private String accessKey;
    private String secretKey;
    private String space;
    private String domain;
    private Auth auth;
    private UploadManager uploadManager;
    private BucketManager bucketManager;

    public Qiniu(String accessKey, String secretKey, String space, String domain) {
        this.accessKey = accessKey;
        this.secretKey = secretKey;
        this.space = space;
        this.domain = domain;

        Auth _auth = Auth.create(accessKey, secretKey);
        this.auth = _auth;
        bucketManager = new BucketManager(_auth);
    }

    public Qiniu() {

    }

    private String getUpToken() {
        return auth.uploadToken(this.space, null, 3600, new StringMap().putNotEmpty("returnBody",
                "{\"key\": $(key), \"hash\": $(etag), \"width\": $(imageInfo.width), \"height\": $(imageInfo.height)}"));
    }

    public QiniuResponse upload(File file, String key) throws QiniuException {

        String token = getUpToken();
        Response res = uploadManager.put(file, key, token);
        QiniuResponse ret = res.jsonToObject(QiniuResponse.class);
        return ret;
    }

    public QiniuResponse upload(byte[] bytes, String key) throws QiniuException {
        String token = getUpToken();
        Response res = null;
        try {
            res = uploadManager.put(bytes, key, token);
        } catch (QiniuException e) {
            e.printStackTrace();
        }
        QiniuResponse ret = res.jsonToObject(QiniuResponse.class);
        ret.url = "http://" + this.domain + "/" + ret.key;
        return ret;
    }


    //根据文件的key删除文件
    public void deleteFileByKey(String fileKey) {
        try {
            //调用delete方法移动文件
            bucketManager.delete(space, fileKey);
        } catch (QiniuException e) {
            //捕获异常信息
            Response r = e.response;
            System.out.println(r.toString());
        }
    }

    public UploadManager getUploadManager() {
        return uploadManager;
    }

    public void setUploadManager(UploadManager uploadManager) {
        this.uploadManager = uploadManager;
    }

    public void deleteFileByUrl(String url) {
        String preUrl = "http://" + this.domain + "/";
        String key = url.substring(preUrl.length(), url.length() - 1);
        this.deleteFileByKey(key);
    }

    /**
     * 图片信息
     *
     * @author zonghua
     */
    public class QiniuResponse {
        public long fsize;
        public String key;
        public String url;
        public String hash;
        public int width;
        public int height;
    }

}
