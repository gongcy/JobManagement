<%-- 
    Document   : header
    Created on : Jun 18, 2017, 9:29:00 PM
    Author     : Administrator
--%>

<%@page import="com.job.pojo.Manager"%>
<%@page import="com.job.dao.ManagerDao"%>
<%@page import="com.job.dao.StudentDao"%>
<%@page import="com.job.pojo.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header">
    <div class="main">
        <a class="logo" href="" title="Job-hunting">Job-hunting</a>
        <div class="nav">
            <!--class="nav-this"-->
            <a href="index.htm">
                <i class="iconfont icon-shouye"></i>Home
            </a>
            <a href="search.htm">
                <i class="iconfont icon-liulanyanjing"></i>Find a job     
            </a>
            <a href="postJob.htm">
                <i class="iconfont icon-tianjia"></i>Post a job
            </a>
        </div>

        <div class="nav-user">
            <%
                String sid = (String) session.getAttribute("sid");
                String mid = (String) session.getAttribute("mid");
                
                if (sid == null && mid == null) {
            %>
            <!-- before Login -->
            <a class="unlogin" href="student/log.htm"><i class="iconfont icon-touxiang"></i></a>
            <span><a href="student/log.htm">Login</a><a href="student/reg.htm">Register</a></span>

            <%
            } else if (sid != null) {
                StudentDao studentDao = new StudentDao();
                Student s = studentDao.getStudent(sid);
            %>
            <!-- Student Login -->
            <a class="avatar" href="student/aboutme.htm">
                <img src="">
                <cite><%=s.getStudentName()%></cite>
                <i>Student</i>
            </a>
            <div class="nav">
                <a href="student/"><i class="iconfont icon-shezhi"></i>Settings</a>
                <a href="student/logout.htm"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>Log Out</a>
            </div> 

            <%
            } else {
                ManagerDao managerDao = new ManagerDao();
                Manager m = managerDao.getManager(mid);
            %>
            <!--Manager Login-->
            <a class="avatar" href="">
                <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0">
                <cite><%=m.getManagerName()%></cite>
                <i>Manager</i>
            </a>
            <div class="nav">
                <!--<a href="manager/set/"><i class="iconfont icon-shezhi"></i>Settings</a>-->
                <a href="manager/logout.htm"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>Log Out</a>
            </div> 
            <%
                }
            %>
        </div>
    </div>
</div>