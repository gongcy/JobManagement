/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.service;

import com.job.dao.RecruitmentDao;
import com.job.pojo.Recruitment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author gongcy
 */
@Service
public class RecruitmentService {
    
    @Autowired
    private RecruitmentDao recruitmentDao;

    public List<Recruitment> searchRecruitments(String condition) {
        return recruitmentDao.searchRecruitments(condition);
    }
    
}
