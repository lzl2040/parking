<%--
  Created by IntelliJ IDEA.
  User: yxm521
  Date: 2022/1/23
  Time: 15:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>管理中心</title>
    <%@include file="/page/common/base.jsp"%>
    <%--    address int there do not need to add /--%>
    <script src="static/jquery/jquery-3.5.1.js"></script>
    <style type="text/css">
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
        .revise-wrapper{
            text-align: center;
            padding-left: 20px;
            margin: 20px auto;
            width: 800px;
            height: 400px;
        }
        .revise-info-wrapper{
            padding-top: 40px;
        }
        .tag{
            display: block;
            width: 80px;
            text-align: left;
        }
        .form-group{
            width: 200px;
        }

        .save-wrapper{
            text-align: left;
            height: 40px;
            line-height: 40px;
        }

        .save-btn{
            text-align: center;
            border-radius: 8px;
            border: 1px solid grey;
            width: 60px;
            height: 30px;
            background: white;
        }
        .rpwd-wra{
            display: none;
        }
    </style>

</head>
<body>
<div class="middleFrame">
    <%@include file="/page/common/leftNav.jsp"%>
    <div class="mainFrame">
        <div class="revise-wrapper">
            <div class="revise-info-wrapper">
                <form method="post" action="userservice" role="form">
                    <input type="hidden" name="action" value="updateUser">
                    <input type="hidden" name="usernum" value="${sessionScope.user.userNum}">
                    <div class="form-group">
                        <span class="tag">用户名:</span>
                        <c:if test="${not empty user.username}">
                            <input type="text" class="form-control input-item" name="username" value="${user.username}">
                        </c:if>
                        <c:if test="${empty user.username}">
                            <input type="text" class="form-control" name="username">
                        </c:if>
                    </div>
                    <div class="form-group">
                        <span class="tag">性别:</span>
                        <c:if test="${user.sex == 0}">
                            <input type="text" class="form-control" name="sex" value="女">
                        </c:if>
                        <c:if test="${user.sex == 1}">
                            <input type="text" class="form-control" name="sex" value="男">
                        </c:if>
                    </div>
                    <div class="form-group">
                        <span class="tag">电话号码:</span>
                        <c:if test="${not empty user.phone}">
                            <input type="text" class="form-control" name="phone" value="${user.phone}">
                        </c:if>
                        <c:if test="${empty user.phone}">
                            <input type="text" class="form-control" name="phone">
                        </c:if>
                    </div>
                    <div class="form-group">
                        <span class="tag">居住地:</span>
                        <c:if test="${not empty user.liveAddress}">
                            <input type="text" class="form-control" name="address" value="${user.liveAddress}">
                        </c:if>
                        <c:if test="${empty user.liveAddress}">
                            <input type="text" class="form-control" name="address">
                        </c:if>
                    </div>
                    <div class="form-group">
                        <span class="tag">密码:</span>
                        <c:if test="${not empty user.pwd}">
                            <input type="text" class="form-control" name="pwd" value="${user.pwd}">
                        </c:if>
                        <c:if test="${empty user.pwd}">
                            <input type="text" class="form-control" name="pwd" id="pwd">
                        </c:if>
                    </div>
                    <div class="form-group rpwd-wra">
                        <span class="tag">确认密码:</span>
                        <c:if test="${not empty user.pwd}">
                            <input type="text" class="form-control" name="rpwd" value="${user.pwd}">
                        </c:if>
                        <c:if test="${empty user.pwd}">
                            <input type="text" class="form-control" name="rpwd" id="rpwd">
                        </c:if>
                    </div>
                    <div class="save-wrapper">
                        <button class="save-btn btn-default btn" type="submit">保存</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>

<script type="text/javascript">
    $(function (){
        setSelected(window.location.hash);
        $("input[name = 'pwd']").on('click',function (){
            $(".rpwd-wra").css("display","block");
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
