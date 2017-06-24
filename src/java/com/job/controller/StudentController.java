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
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.job.pojo.Resume;
import com.job.pojo.Student;
import com.job.service.StudentService;

/**
 *
 * @author gongcy
 */
@Controller
@RequestMapping(value = "/student")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String login(Student stu, HttpSession session,
            @RequestParam("vcode") String vcode,
            @RequestParam("stuid") String stuid, @RequestParam("pass") String stupwd) {
        if (!session.getAttribute("rand").equals(vcode)) {
            return "loginFail";
        }
        Student s = studentService.validateStudent(stuid, stupwd);
        if (s != null) {
            session.setAttribute("sid", stuid);
            return "loginSuccess";
        }
        return "loginFail";
    }

    @RequestMapping(value = "/register.htm", method = RequestMethod.POST)
    public String register(@RequestParam("stuid") String stuid,
            @RequestParam("pass") String stupwd,
            @RequestParam("stuname") String stuname, @RequestParam("sex") Integer stusex) {
        Student s = new Student();
        s.setGender((stusex == 0) ? 'M' : 'F');
        MD5 md5 = new MD5();
        s.setPassword(md5.getMD5ofStr(stupwd));
        s.setStudentNo(stuid);
        s.setStudentName(stuname);

        if (studentService.registerStudent(s)) {
//            map.addAttribute("msg", "注册成功，请转到<a href='javascript:history.go(-2);'>登录页面</a>登录！");
        } else {
//            map.addAttribute("msg", "注册失败，该学号已经注册，请<a href='javascript:history.back();'>返回</a>重试！");
        }
        return "registerResult";
    }

    @RequestMapping(value = "/editResume.htm", method = RequestMethod.POST)
    public String editResume(@RequestParam("skill") String skills) {

        Resume resume = new Resume();
        resume.setSkills(skills);

        return "";
    }
    
    @RequestMapping(value = "/editProfile.htm", method = RequestMethod.POST)
    public String editProfile(@RequestParam("skill") String skills,
            @RequestParam("email") String email,@RequestParam("stuage") String age,
            @RequestParam("stuedu") String edu) {

        
        Resume resume = new Resume();
        resume.setSkills(skills);

        return "";
    }
    
    @RequestMapping(value = "/aboutme.htm", method = RequestMethod.POST)
    public String viewProfile(ModelMap map, HttpSession session) {
        session.getAttribute("id");
//        map.addAttribute(attributeName, studentService);
        return "stu_aboutme";
    }
}
