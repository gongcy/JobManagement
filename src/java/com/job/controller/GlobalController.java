/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.job.controller;

import com.job.pojo.Recruitment;
import com.job.service.RecruitmentService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Administrator
 */
@Controller
public class GlobalController {

    @Autowired
    private RecruitmentService recruitmentService;

    @RequestMapping(value = "/index.htm", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/searchJob.htm", method = RequestMethod.GET)
    public String searchJob(@RequestParam("q") String condition,
            Model model) {
        
        List<Recruitment> lr = recruitmentService.searchRecruitments(condition);
        model.addAttribute("lr", lr);
        
        return "search";
    }
    
    @RequestMapping(value = "/search.htm", method = RequestMethod.GET)
    public String search() {
        return "search";
    }
    
    @RequestMapping(value = "/postJob.htm", method = RequestMethod.GET)
    public String postJob() {
        
        return "man_log";
    }
    
}
