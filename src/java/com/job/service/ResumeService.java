/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.service;

import com.job.dao.ResumeDao;
import com.job.pojo.Resume;
import com.job.pojo.Student;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author gongcy
 */
@Service
public class ResumeService {

    @Autowired
    private ResumeDao resumeDao;

    public Resume fetchResume(String stuno) {
        Resume r = null;
        try {
            List<Resume> l = resumeDao.getResumes(stuno);
            r = l.get(0);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return r;
        }

    }

    public boolean changeProfile(String stuno, Integer age, String edu, String email) {
        return resumeDao.changeProfile(stuno, age, edu, email);
    }

    public boolean changeResume(String stuno, String skills) {
        return resumeDao.changeResume(stuno, skills);
    }

    public boolean insertProfile(Student s, String email, String edu, String skills, Integer ra) {
        Resume r = new Resume();
        r.setStudent(s);
        r.setAge(ra);
        r.setSkills(skills);
        r.setEducation(edu);
        r.setEmail(email);
        resumeDao.insert(r);
        return true;
    }
}
