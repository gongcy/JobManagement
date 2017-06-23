<%-- 
    Document   : header
    Created on : Jun 18, 2017, 9:29:00 PM
    Author     : Administrator
--%>

<%@page import="pojo.Manager"%>
<%@page import="dao.ManagerDao"%>
<%@page import="dao.StudentDao"%>
<%@page import="pojo.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="header">
    <div class="main">
        <a class="logo" href="" title="Job-hunting">Job-hunting</a>
        <div class="nav">
            <a class="nav-this" href="index.html">
                <i class="iconfont icon-shouye"></i>Home
            </a>
            <a href="stu_login.html" target="_blank">
                <i class="iconfont icon-liulanyanjing"></i>Find a job     
            </a>
            <a href="man_login.html" target="_blank">
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
            <a class="unlogin" href="user/login.html"><i class="iconfont icon-touxiang"></i></a>
            <span><a href="user/login.html">Login</a><a href="user/reg.html">Register</a></span>

            <%
            } else if (sid != null) {
                StudentDao studentDao = new StudentDao();
                Student s = studentDao.getStudent(sid);
            %>
            <!-- Student Login -->
            <a class="avatar" href="stu_profile.jsp">
                <img src="<%=%>">
                <cite><%=s.getStudentName()%></cite>
                <i>Student</i>
            </a>
            <div class="nav">
                <a href="/student/set/"><i class="iconfont icon-shezhi"></i>Settings</a>
                <a href="/student/logout/"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>Log Out</a>
            </div> 

            <%
            } else {
                ManagerDao managerDao = new ManagerDao();
                Manager m = managerDao.getManager(mid);
            %>
            <!--Manager Login-->
            <a class="avatar" href="man_profile.jsp">
                <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0">
                <cite><%=m.getManagerName()%></cite>
                <i>Manager</i>
            </a>
            <div class="nav">
                <a href="/manager/set/"><i class="iconfont icon-shezhi"></i>Settings</a>
                <a href="/manager/logout/"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>Log Out</a>
            </div> 
            <%
                }
            %>
        </div>
    </div>
</div>