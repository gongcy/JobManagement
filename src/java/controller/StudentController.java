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
import pojo.Student;
import service.StudentService;

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

        return "registerResult";
    }

}
