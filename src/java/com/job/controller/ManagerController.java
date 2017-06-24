/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.controller;

import com.job.encrypt.MD5;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.job.pojo.Manager;
import com.job.service.ManagerService;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/manager")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String validateLogin(Manager mag, HttpSession session,
            @RequestParam("vcode") String vcode, @RequestParam("manid") String magid,
            @RequestParam("pass") String magpwd) {
        if (!session.getAttribute("rand").equals(vcode)) {
            return "loginFail";
        }
        Manager m = managerService.validateManager(magid, magpwd);
        if (m != null) {
            return "loginSuccess";
        }
        return "loginFail";
    }

    @RequestMapping(value = "/register.htm", method = RequestMethod.POST)
    public String register(@RequestParam("manid") String magid,
            @RequestParam("pass") String magpwd,
            @RequestParam("stuname") String magname) {
        Manager m = new Manager();
        m.setManagerName(magname);
        m.setManagerNo(magid);
        MD5 md5 = new MD5();
        m.setPassword(md5.getMD5ofStr(magpwd));

        if (managerService.registerManager(m)) {
//            map.addAttribute("msg", "注册成功，请转到<a href='javascript:history.go(-2);'>登录页面</a>登录！");
        } else {
//            map.addAttribute("msg", "注册失败，该学号已经注册，请<a href='javascript:history.back();'>返回</a>重试！");
        }
        return "registerResult";
    }
}
