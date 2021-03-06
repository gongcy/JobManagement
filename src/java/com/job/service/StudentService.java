/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.service;

import com.job.dao.StudentDao;
import com.job.encrypt.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.job.pojo.Student;
import java.util.List;

/**
 *
 * @author gongcy
 */
@Service
public class StudentService {

    @Autowired
    private StudentDao studentDao;

    // verify login
    public Student validateStudent(String stuno, String stupwd) {
        Student s = studentDao.getStudent(stuno);
        MD5 md5 = new MD5();
        if (s != null && s.getPassword().equals(md5.getMD5ofStr(stupwd))) {
            return s;
        } else {
            return null;
        }
    }

    // accomplish register
    public boolean registerStudent(Student student) {
        try {
            studentDao.insert(student);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public Student getStudent(String stuno) {
        return studentDao.getStudent(stuno);
    }

    public boolean changePassword(String stuno, String newpwd) {
        try {
            return studentDao.changePassword(stuno, new MD5().getMD5ofStr(newpwd));
        } catch (Exception e) {
            return false;
        }
    }

    public List<Student> getAllStudents() {
        return studentDao.getAllStudents();
    }
}
