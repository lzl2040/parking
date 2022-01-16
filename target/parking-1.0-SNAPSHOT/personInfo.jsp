<%--
  Created by IntelliJ IDEA.
  User: 联想
  Date: 2021/11/23
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.example.parking.entity.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style type="text/css">
        .info-wrap{
            padding-left: 20px;
            margin: 120px auto;
            background: white;
            width: 400px;
            height: 300px;
        }
        .tag{
            display: inline-block;
            width: 80px;
            text-align: left;
        }
        .info{
            height: 40px;
            line-height: 40px;/*设置行高,对子元素起作用*/
        }
        .titles{
            text-align: center;
        }
        .content{
            border-style: none;
        }

        .revise-wrapper{
            color: white;
            text-align: center;
        }
        .revise-btn{
            border-radius: 8px;
            color: black;
            border: 1px solid grey;
            background: white;
            width: 100px;
            height: 40px;
        }

    </style>
    <script src="./jquery/jquery-3.5.1.js"></script>
</head>
<body>
    <% User user = (User) request.getSession().getAttribute("user");%>
    <div class="info-wrap">
        <h2 class="titles">用户信息</h2>
        <div class="info">
            <span class="tag">用户名:</span>
            <span class="content">
                <%=user.getUsername()%>
            </span>
        </div>
        <div class="info">
            <span class="tag">性别:</span>
            <span class="content">
                <c:if test="${sessionScope.user.sex eq 1}">
                    男
                </c:if>
                <c:if test="${sessionScope.user.sex eq 0}">
                    女
                </c:if>
            </span>
        </div>
        <div class="info">
            <span class="tag">电话号码:</span>
            <span class="content">${sessionScope.user.phone}</span>
        </div>

        <div class="info">
            <span class="tag">居住地:</span>
            <span class="content">${sessionScope.user.liveAddress}</span>
        </div>

        <div class="info">
            <span class="tag">密码:</span>
            <span class="content">
                <%=user.getPwd()%>
            </span>
        </div>
        <div class="revise-wrapper">
            <button class="revise-btn" type="button">修改个人信息</button>
        </div>
    </div>
</body>
<script type="application/javascript">
    $(function (){
        /*绑定*/
        $(".revise-btn").click(function (){
            loadJsp();
        });

        function loadJsp(){
            path = "reviseInfo.jsp";
            $(".mainFrame").load(path);
        }
    });
</script>
</html>
