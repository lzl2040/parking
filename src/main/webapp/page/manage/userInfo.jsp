<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.parking.entity.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        html{
            height: 100%;
            width: 100%;
        }
        body{
            width: 100%;
            height: 100%;
        }
        .middleFrame{
            display: flex;
            margin: 0 0;
            background: grey;
            width: 100%;
            height: 100%;
        }
        .leftFrame{
            float: left;
            height: 100%;
            width: 120px;
            background: rgb(54,58,71);
        }
        .mainFrame{
            width: 100%;
            height: 100%;
            background: white;
            float: left;
        }

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
    <%@include file="/page/common/base.jsp"%>
    <%--    address int there do not need to add /--%>
    <script src="static/jquery/jquery-3.5.1.js"></script>
    <title>管理中心</title>
</head>
<body>
    <% User user = (User) request.getSession().getAttribute("user");%>
    <%@include file="/page/common/userTop.jsp"%>
    <div class="middleFrame">
        <%@include file="/page/common/leftNav.jsp"%>
        <div class="mainFrame">
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
                        <c:choose>
                            <c:when test="${user.sex == 0}">
                                <span class="content">woman</span>
                            </c:when>
                            <c:when test="${user.sex == 1}">
                                <span class="content">man</span>
                            </c:when>
                            <c:otherwise>
                                <span class="content">man</span>
                            </c:otherwise>
                        </c:choose>
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
        </div>
    </div>
    <script type="application/javascript">
        $(function (){
            setSelected(window.location.hash);
            /*绑定*/
            $(".revise-btn").click(function (){
                window.location.href = "page/manage/updateUser.jsp";
            });

            $(".function-menu").on("click","li",function (){
                var eId = $(this).data("id");
                window.location.hash = eId;

            });
            function setSelected(eId){
              switch (eId){
                  case "#car-position":
                      $(".function-menu li").eq(0).addClass("current").siblings().removeClass("current");
                      break;
                  case "#person-info":
                      $(".function-menu li").eq(1).addClass("current").siblings().removeClass("current");
                      break;
                  default:
                      $(".function-menu li").eq(1).addClass("current").siblings().removeClass("current");
                      break;
              }
            };
        });
    </script>
</body>
</html>
