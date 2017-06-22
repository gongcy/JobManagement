/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package service;

import dao.StudentDao;
import encrypt.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Student;

/**
 *
 * @author Administrator
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
}
