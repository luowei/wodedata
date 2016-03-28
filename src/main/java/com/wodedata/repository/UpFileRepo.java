package com.wodedata.repository;

import com.wodedata.domin.UpFileInfo;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by luowei on 16/3/28.
 */
public interface UpFileRepo extends JpaRepository<UpFileInfo, Integer> {

}
