<%--
  Created by IntelliJ IDEA.
  User: 联想
  Date: 2021/11/21
  Time: 10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理中心</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=1.0&type=webgl&ak=4vYD7CG1HjAKfDhKAoUpVNyGho0H8pCF">
    </script>
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
        .current{
            background: #00b4ef;
        }


    </style>
    <script src="./jquery/jquery-3.5.1.js"></script>
</head>
<body>
    <%@include file="userTop.jsp"%>
    <div class="middleFrame">
        <div class="leftFrame">
            <ul class="function-menu">
                <li class="current" data-id = "car-position">
                    <a href="#">车位信息</a>
                </li>
                <div class="line" style="height: 1px;width: 100%;background: white"></div>
                <li class="person-info" data-id = "person-info">
                    <a href="#">个人信息</a>
                </li>
            </ul>
        </div>
        <div class="mainFrame">

        </div>
    </div>
</body>
<script type="application/javascript">
    $(function (){

        $(".function-menu").on("click","li",function (){
            var eId = $(this).data("id");
            window.location.hash = eId;
            loadJsp(eId);
        });

        function loadJsp(eId){
            var eId = window.location.hash;
            var path,i;
            switch (eId){
                case "#car-position":
                    i = 0;
                    path = "carPosition.jsp";
                    break;
                case "#person-info":
                    i = 1;
                    path = "personInfo.jsp";
                    break;
                default:
                    path = "carPosition.jsp";
                    i = 0;
                    break;
            }
            $(".mainFrame").load(path);
            $(".function-menu li").eq(i).addClass("current").siblings().removeClass("current");

        }
        var eid = window.location.hash;
        loadJsp(eid);
    });
</script>
</html>
