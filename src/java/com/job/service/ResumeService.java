/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.service;

import com.job.dao.ResumeDao;
import com.job.pojo.Resume;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Administrator
 */
@Service
public class ResumeService {

    @Autowired
    private ResumeDao resumeDao;

    public Resume fetchResume(String stuno) {
        List<Resume> l = resumeDao.getResumes(stuno);
        return l.get(0);
    }
    
    

}
