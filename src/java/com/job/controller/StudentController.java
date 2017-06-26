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
import com.job.pojo.Resume;
import com.job.pojo.Student;
import com.job.service.ResumeService;
import com.job.service.StudentService;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.SessionAttributes;

/**
 *
 * @author gongcy
 */
@Controller
@RequestMapping(value = "/student")
@SessionAttributes("sid")
public class StudentController {

    @Autowired
    private StudentService studentService;

    @Autowired
    private ResumeService resumeService;

    @RequestMapping(value = "/log.htm", method = RequestMethod.GET)
    public String login() {
        return "stu_login";
    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String validateLogin(Student stu, HttpSession session,
            @RequestParam("vcode") String vcode,
            @RequestParam("stuid") String stuid, @RequestParam("pass") String stupwd) {
        if (!session.getAttribute("rand").equals(vcode)) {
            return "stu_login";
        }
        Student s = studentService.validateStudent(stuid, stupwd);
        if (s != null) {
            session.setAttribute("sid", stuid);
            return "stu_profile";
        }
        return "stu_login";
    }

    @RequestMapping(value = "/reg.htm", method = RequestMethod.GET)
    public String register() {
        return "stu_reg";
    }

    @RequestMapping(value = "/register.htm", method = RequestMethod.POST)
    public String registerDo(@RequestParam("stuid") String stuid,
            @RequestParam("pass") String stupwd,
            @RequestParam("stuname") String stuname, @RequestParam("sex") Integer stusex) {
        Student s = new Student();
        s.setGender((stusex == 0) ? 'M' : 'F');
        MD5 md5 = new MD5();
        s.setPassword(md5.getMD5ofStr(stupwd));
        s.setStudentNo(stuid);
        s.setStudentName(stuname);

        if (studentService.registerStudent(s)) {
            String email = "";
            String edu = "";
            String skills = "";
            Integer ra = 1;
            
            resumeService.insertProfile(s, email, edu, skills, ra);
            return "stu_login";
//            map.addAttribute("msg", "注册成功，请转到<a href='javascript:history.go(-2);'>登录页面</a>登录！");
        } else {
            return "stu_reg";
//            map.addAttribute("msg", "注册失败，该学号已经注册，请<a href='javascript:history.back();'>返回</a>重试！");
        }

    }

    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "stu_login";
    }

    @RequestMapping(value = "/resume.htm", method = RequestMethod.GET)
    public String resume() {
        return "stu_resume";
    }

    @RequestMapping(value = "/editResume.htm", method = RequestMethod.POST)
    public String editResume(HttpSession session,
            @RequestParam("skill") String skills) {

        String id = (String) session.getAttribute("sid");
        if (id != null) {
            resumeService.changeResume(id, skills);
        }
        return "stu_resume";
    }

    @RequestMapping(value = "/profile.htm", method = RequestMethod.GET)
    public String profile() {
        return "stu_profile";
    }

    @RequestMapping(value = "/editProfile.htm", method = RequestMethod.POST)
    public String editProfile(HttpSession session,
            @RequestParam("email") String email, @RequestParam("stuage") String age,
            @RequestParam("stuedu") String edu) {

        String id = (String) session.getAttribute("sid");
        if (id != null) {
            resumeService.changeProfile(id, Integer.parseInt(age), edu, email);
        }
        return "stu_profile";
    }

    @RequestMapping(value = "/changePassword.htm", method = RequestMethod.POST)
    public String changePassword(HttpSession session,
            @RequestParam("nowpass") String nowpass, @RequestParam("pass") String pass,
            @RequestParam("repass") String repass) {

        String id = (String) session.getAttribute("sid");
        if (id != null) {
            if (pass.equals(repass)) {
                studentService.changePassword(id, nowpass);
            }
        }
        return "stu_profile";
    }

    @RequestMapping(value = "/aboutme.htm", method = RequestMethod.GET)
    public String viewProfile(Model model, HttpSession session) {

        String id = (String) session.getAttribute("sid");

        if (id != null) {
            Student s = studentService.getStudent(id);
            model.addAttribute("name", s.getStudentName());
            model.addAttribute("gender", s.getGender());
            Resume resume = resumeService.fetchResume(id);
            if (resume != null) {
                model.addAttribute("email", resume.getEmail());
                model.addAttribute("education", resume.getEducation());
                model.addAttribute("skills", resume.getSkills());
            }

        }
        return "stu_aboutme";
    }
}
