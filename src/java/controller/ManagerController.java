/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import encrypt.MD5;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.Manager;
import service.ManagerService;

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
            @RequestParam("vcode") String vcode, @RequestParam("stuid") String magid,
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
    public String register(@RequestParam("stuid") String magid,
            @RequestParam("pass") String magpwd,
            @RequestParam("stuname") String magname) {
        Manager m = new Manager();
        m.setManagerName(magname);
        m.setManagerNo(magid);
        MD5 md5 = new MD5();
        m.setPassword(md5.getMD5ofStr(magpwd));

        return "registerResult";
    }
}
