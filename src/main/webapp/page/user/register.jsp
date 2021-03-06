<%--
  Created by IntelliJ IDEA.
  User: 联想
  Date: 2021/11/21
  Time: 10:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>注册</title>
<%--    <%@include file="/page/common/base.jsp"%>--%>
    <style type="text/css">
        .form-horizontal{
            background: #fff;
            padding-bottom: 35px;
            border-radius: 15px;
            text-align: center;
            background: rgba(255,255,255,0.45);
            width:450px;
            height: 520px;
            margin:90px auto;
            box-shadow: 5px 5px 20px #ccc;
        }
        .form-horizontal .heading{
            display: block;
            font-size: 35px;
            font-weight: 700;
            padding: 25px 0;
            border-bottom: 1px solid #dddddd82;
            margin-bottom: 30px;
            /*background-image: linear-gradient(to bottom,#6db6ae36, #0690e3);*/
            /*-webkit-background-clip: text;*/
            /*-webkit-text-fill-color: transparent;*/
        }
        .form-horizontal .form-group{
            padding: 0 40px;
            margin: 0 0 25px 0;
            position: relative;
        }
        .form-horizontal .form-control{
            background: #f0f0f0;
            border: none;
            border-radius: 20px;
            box-shadow: none;
            padding: 0 20px 0 45px;
            height: 40px;
            transition: all 0.3s ease 0s;
        }
        .form-horizontal .form-control:focus{
            background: #e0e0e0;
            box-shadow: none;
            outline: 0 none;
        }
        .form-horizontal .form-group i{
            position: absolute;
            top: 12px;
            left: 60px;
            font-size: 17px;
            color: #c8c8c8;
            transition : all 0.5s ease 0s;
        }
        .form-horizontal .form-control:focus + i{
            color: #00b4ef;
        }

        .form-horizontal .fa-question-circle{
            display: inline-block;
            position: absolute;
            top: 12px;
            right: 60px;
            font-size: 20px;
            color: #808080;
            transition: all 0.5s ease 0s;
        }

        .form-horizontal .fa-question-circle:hover{
            color: #000;
        }

        .form-horizontal .main-checkbox label{
            width: 20px;
            height: 20px;
            position: absolute;
            top: 0;
            left: 0;
            cursor: pointer;
        }
        .form-horizontal .main-checkbox label:after{
            content: "";
            width: 10px;
            height: 6px;
            position: absolute;
            top: 4.5px;
            left: 4px;
            border: 3px solid #eee;
            border-top: none;
            border-right: none;
            background: transparent;
            opacity: 0;
            -webkit-transform: rotate(-45deg);
            transform: rotate(-45deg);
        }
        .form-horizontal .main-checkbox input[type=radio]{
            visibility: hidden;
        }
        .form-horizontal .main-checkbox input[type=radio]:checked + label:after{
            opacity: 1;
        }
        .form-horizontal .main-checkbox input[type=checkbox]{
            visibility: hidden;
        }
        .form-horizontal .main-checkbox input[type=checkbox]:checked + label:after{
            opacity: 1;
        }
        .form-horizontal .text{
            float: left;
            margin-left: 7px;
            line-height: 20px;
            padding-top: 5px;
            text-transform: capitalize;
        }
        .form-horizontal .btn{
            font-size: 14px;
            color: #fff;
            background: #00b4ef;
            border-radius: 30px;
            padding: 10px 25px;
            border: none;
            text-transform: capitalize;
            transition: all 0.5s ease 0s;
        }

        @media only screen and (max-width: 479px){
            .form-horizontal .form-group{
                padding: 0 25px;
            }
            .form-horizontal .form-group i{
                left: 45px;
            }
            .form-horizontal .btn{
                padding: 10px 20px;
            }
        }

        html{
            background-image: url("/parking/static/img/c1.jpg");
            background-repeat: no-repeat;
            background-size: 100%;
            width: 100%;
            height: 100%;
        }
        body{
            width: 100%;
            height: 100%;
        }
    </style>
    <%@include file="/page/common/base.jsp"%>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-md-offset-3 col-md-6">
            <form class ="form-horizontal" action="userservice" method="post" id="admin">
                <input type="hidden" name="action" value="register">
                <span class="heading"><font color="#4F4F4F">用户注册</font> </span>
                <div class="form-group">
                    <input type="text" name="username" class="form-control" id="ruserName" placeholder="用户名" oninput="veName()">
                    <i class="fa fa-user"></i>
                </div>
                <div class="form-group help">
                    <input type="password" name="pwd" class="form-control" id="pwd" placeholder="密码">
                    <i class="fa fa-lock"></i>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <div class="form-group help">
                    <input type="password" name="rpwd" class="form-control" id="vpwd" placeholder="验证密码">
                    <i class="fa fa-lock"></i>
                    <a href="#" class="fa fa-question-circle"></a>
                </div>
                <button type="submit" class="btn btn-default" id="bu1">注册</button>
            </form>

        </div>

    </div>
</div>
</body>
</html>
