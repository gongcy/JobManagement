<%-- 
    Document   : header
    Created on : Jun 18, 2017, 9:29:00 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
   <div class="header">
        <div class="main">
            <a class="logo" href="" title="Job-hunting">Job-hunting</a>
            <div class="nav">
                <a class="nav-this" href="index.jsp">
                <i class="iconfont icon-shouye"></i>Home
            </a>
                <a href="stu_login.jsp" target="_blank">
                <i class="iconfont icon-liulanyanjing"></i>Find a job     
            </a>
                <a href="man_login.jsp" target="_blank">
                <i class="iconfont icon-tianjia"></i>Post a job
            </a>
            </div>

            <div class="nav-user">
                <!-- 未登入状态 -->
                <a class="unlogin" href="stu_login.jsp"><i class="iconfont icon-touxiang"></i></a>
                <span><a href="stu_login.jsp">Login</a><a href="stu_login.jsp">Register</a></span>

                <!-- 登入后的状态 -->

                <!--                    <a class="avatar" href="user/index.html">
                                  <img src="http://tp4.sinaimg.cn/1345566427/180/5730976522/0">
                                  <cite>贤心</cite>
                                  <i>VIP2</i>
                                </a>
                                <div class="nav">
                                  <a href="/user/set/"><i class="iconfont icon-shezhi"></i>设置</a>
                                  <a href="/user/logout/"><i class="iconfont icon-tuichu" style="top: 0; font-size: 22px;"></i>退了</a>
                                </div> -->

            </div>
        </div>
    </div>