package com.wodedata.repository;

import com.wodedata.domin.UpFileInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import java.util.List;

/**
 * Created by luowei on 16/3/28.
 */
public interface UpFileRepo extends JpaRepository<UpFileInfo, Integer> {

    @Modifying
    void deleteByKey(String fileKey);

    List<UpFileInfo> findByUrlOrderByIdDesc(String url);

    @Modifying
    void deleteByUrl(String url);
}
