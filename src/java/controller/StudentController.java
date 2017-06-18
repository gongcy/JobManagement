/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import pojo.Student;

/**
 *
 * @author gongcy
 */
@Controller
@RequestMapping(value = "/students")
public class StudentController {
    
    @RequestMapping(value = "/login.htm", method = RequestMethod.POST)
    public String register(Student stu, ModelMap map) {
        
        return "registerResult";
    }
}
