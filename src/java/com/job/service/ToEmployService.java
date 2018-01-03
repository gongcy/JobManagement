/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.service;

import com.job.dao.ToEmployDao;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.job.pojo.ToEmploy;

/**
 *
 * @author gongcy
 */
@Service
public class ToEmployService {

    @Autowired
    private ToEmployDao toEmployDao;

    public List<ToEmploy> getAllToEmploys() {
        return toEmployDao.getAllToEmploys();
    }

}
