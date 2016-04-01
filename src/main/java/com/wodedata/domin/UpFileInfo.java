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

    private Integer id;

    @NotNull(message="名称不能为空")
    @Size(max=60,message="名称最多六十个字符")
    private String name;

    private String type;

    private Integer size;

    private String key;

    private String url;

    private String hash;

//    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE,pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createAt;

    private Section section;

    private Node node;

    public UpFileInfo() {
    }

    public UpFileInfo(String name, String type, Integer size, String key, String url,
                      String hash, Date createAt, Section section, Node node) {
        this.name = name;
        this.type = type;
        this.size = size;
        this.key = key;
        this.url = url;
        this.hash = hash;
        this.createAt = createAt;
        this.section = section;
        this.node = node;
    }

    @Id
    @GeneratedValue(strategy = IDENTITY)
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    @Column(name = "fileName")
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Column(name = "fileType")
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Column(name = "fileSize")
    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }

    @Column(name = "fileKey")
    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    @Column(name = "url")
    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Column(name = "fileHash")
    public String getHash() {
        return hash;
    }

    public void setHash(String hash) {
        this.hash = hash;
    }

    @Column(name = "create_at")
    public Date getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Date createAt) {
        this.createAt = createAt;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="section_id")
    public Section getSection() {
        return section;
    }

    public void setSection(Section section) {
        this.section = section;
    }

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name="node_id")
    public Node getNode() {
        return node;
    }

    public void setNode(Node node) {
        this.node = node;
    }
}
