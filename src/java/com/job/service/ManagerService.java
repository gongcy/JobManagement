/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.service;

import com.job.dao.ManagerDao;
import com.job.encrypt.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.job.pojo.Manager;

/**
 *
 * @author Administrator
 */
@Service
public class ManagerService {

    @Autowired
    private ManagerDao managerDao;

    // verify login
    public Manager validateManager(String magno, String magpwd) {
        Manager m = managerDao.getManager(magno);
        MD5 md5 = new MD5();
        if (m != null && m.getPassword().equals(md5.getMD5ofStr(magpwd))) {
            return m;
        } else {
            return null;
        }
    }

    // accomplish register
    public boolean registerManager(Manager manager) {
        try {
            managerDao.insert(manager);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
