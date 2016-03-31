package com.wodedata.domin;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * Created by luowei on 16/3/28.
 */

@Entity
@Table(name = "up_fileinfo", catalog = "lidongchengsay" )
public class UpFileInfo {

    @Id
    @GeneratedValue(strategy = IDENTITY)
    private Integer id;

    @NotNull(message="名称不能为空")
    @Size(max=60,message="名称最多六十个字符")
    @Column(name = "fileName")
    private String name;

    @Column(name = "fileType")
    private String type;

    @Column(name = "fileSize")
    private Integer size;

    @Column(name = "fileKey")
    private String key;

    @Column(name = "url")
    private String url;

    @Column(name = "fileHash")
    private String hash;

//    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE,pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(name = "create_at")
    private Date createAt;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }
}
