<%--
  Created by IntelliJ IDEA.
  User: yxm521
  Date: 2022/1/23
  Time: 15:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style type="text/css">
    .current{
        background: #00b4ef;
    }

    ul{
        padding: 0;
        margin: 0 0;
        list-style: none;
    }
    a{
        text-decoration: none;
    }

    .function-menu li{
        height: 50px;
        text-align: center;
        border: #ff253a 2px;
    }
    .function-menu li a{
        line-height: 50px;
        color: white;
    }
</style>
<div class="leftFrame">
    <ul class="function-menu">
        <li class="current" data-id = "car-position">
            <a href="page/manage/map.jsp">车位信息</a>
        </li>
        <div class="line" style="height: 1px;width: 100%;background: white"></div>
        <li class="person-info" data-id = "person-info">
            <a href="page/manage/userInfo.jsp">个人信息</a>
        </li>
    </ul>
</div>
