/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.service;

import com.job.dao.JobDao;
import com.job.pojo.Job;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author gongcy
 */
@Service
public class JobService {

    @Autowired
    private JobDao jobDao;

    public List<Job> getAllJobs() {
        List<Job> j = jobDao.getAllJobs();
//        System.out.println("====================");
//        System.out.println(j);
        return j;
    }

    public boolean insertJob(Job job) {
        jobDao.insert(job);
        return true;
    }
}
