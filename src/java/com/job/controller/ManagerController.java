/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.controller;

import com.job.encrypt.MD5;
import com.job.pojo.Job;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.job.pojo.Manager;
import com.job.pojo.Student;
import com.job.service.JobService;
import com.job.service.ManagerService;
import com.job.service.StudentService;
import com.job.service.ToEmployService;
import java.util.List;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.job.pojo.ToEmploy;

/**
 *
 * @author Administrator
 */
@Controller
@RequestMapping(value = "/manager")
@SessionAttributes("mid")
public class ManagerController {

    @Autowired
    private ManagerService managerService;

    @Autowired
    private StudentService studentService;

    @Autowired
    private JobService jobService;

    @Autowired
    private ToEmployService toEmployService;

    @RequestMapping(value = "/log.htm", method = RequestMethod.GET)
    public String login() {
        return "man_login";
    }

    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String validateLogin(Manager mag, HttpSession session,
            @RequestParam("vcode") String vcode, @RequestParam("manid") String magid,
            @RequestParam("pass") String magpwd) {
        if (!session.getAttribute("rand").equals(vcode)) {
            return "man_login";
        }
        Manager m = managerService.validateManager(magid, magpwd);
        if (m != null) {
            session.setAttribute("mid", magid);
            return "man_job";
        }
        return "man_login";
    }

    @RequestMapping(value = "/register.htm", method = RequestMethod.POST)
    public String register(@RequestParam("manid") String magid,
            @RequestParam("pass") String magpwd,
            @RequestParam("manname") String magname) {
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
        return "man_user";
    }

    @RequestMapping(value = "/logout.htm", method = RequestMethod.GET)
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

    @RequestMapping(value = "/report.htm", method = RequestMethod.GET)
    public String report() {
        return "man_report";
    }

    @RequestMapping(value = "/user.htm", method = RequestMethod.GET)
    public String user() {
        return "man_user";
    }

    @RequestMapping(value = "/studentDetails.htm", method = RequestMethod.GET)
    public String studentDetails(Model model) {

//        String id = (String) session.getAttribute("mid");
//        if (id != null) {
        List<Student> ls = studentService.getAllStudents();
        model.addAttribute("ls", ls);
//        }
        return "man_user";
    }

    @RequestMapping(value = "/job.htm", method = RequestMethod.GET)
    public String job(Model model) {

        List<Job> lj = jobService.getAllJobs();
//        System.out.println("====================");
//        System.out.println(lj.get(0).getJobName());
        model.addAttribute("lj", lj);

        List<ToEmploy> le = toEmployService.getAllToEmploys();
        model.addAttribute("lemp", le);

        return "man_job";
    }

    @RequestMapping(value = "/addJob.htm", method = RequestMethod.POST)
    public String addJob(Model model,
            @RequestParam("jobid") String jobid,
            @RequestParam("jobname") String jobname,
            @RequestParam("jobtype") String jobtype) {

        Job job = new Job();
        job.setJobName(jobname);
        job.setJobNo(jobid);
        job.setJobType(jobtype);
        jobService.insertJob(job);

        return "man_job";
    }

}
