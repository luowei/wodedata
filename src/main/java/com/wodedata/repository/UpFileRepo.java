package com.wodedata.repository;

import com.wodedata.domin.UpFileInfo;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * Created by luowei on 16/3/28.
 */
public interface UpFileRepo extends JpaRepository<UpFileInfo, Integer> {

    void deleteByKey(String fileKey);

    List<UpFileInfo> findByUrlOrderByIdDesc(String url);
}
