<%@ page import="com.example.parkingManage.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: 联想
  Date: 2021/11/24
  Time: 11:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <style type="text/css">
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
<%User user = (User) request.getSession().getAttribute("user");%>

    <div class="revise-wrapper">
        <div class="revise-info-wrapper">
            <form method="post" action="update" role="form">
                <div class="form-group">
                    <span class="tag">用户名:</span>
                    <c:if test="${not empty user.userName}">
                        <input type="text" class="form-control input-item" name="username" value="${user.userName}">
                    </c:if>
                    <c:if test="${empty user.userName}">
                        <input type="text" class="form-control" name="username">
                    </c:if>
                </div>
                <div class="form-group">
                    <span class="tag">性别:</span>
                    <c:if test="${user.sex == 0}">
                        <input type="text" class="form-control" name="sex" value="男">
                    </c:if>
                    <c:if test="${user.sex == 1}">
                        <input type="text" class="form-control" name="sex" value="女">
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
</body>
<script type="text/javascript">
    $(function (){
        $("input[name = 'pwd']").on('click',function (){
            $(".rpwd-wra").css("display","block");
        });
    });
</script>
</html>
