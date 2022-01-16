<%--
  Created by IntelliJ IDEA.
  User: yxm521
  Date: 2022/1/16
  Time: 15:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <style type="text/css">
    .form-bg{
      background: #00b4ef;
    }
    .form-horizontal{
      padding-bottom: 40px;
      border-radius: 15px;
      text-align: center;
      background: rgba(255,255,255,0.4);
      width:500px;
      height: 400px;
      margin:120px auto;
      box-shadow: 0px 0px 30px #ccc;
    }
    .form-horizontal .heading{
      display: block;
      font-size: 35px;
      font-weight: 700;
      padding: 35px 0;
      border-bottom: 1px solid #F0F0F0;
      margin-bottom: 30px;
      /*background-image: linear-gradient(to bottom,#6fcdd533, #11a3fc);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;*/
    }
    .form-horizontal .form-group{
      padding: 0 40px;
      margin: 0 0 25px 0;/*上右下左*/
      position: relative;
    }

    .form-horizontal .help{
      margin: 0 0 10px 0;
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
      height: 5px;
      position: absolute;
      top: 5px;
      left: 4px;
      border: 3px solid #fff;
      border-top: none;
      border-right: none;
      background: transparent;
      opacity: 0;
      -webkit-transform: rotate(-45deg);
      transform: rotate(-45deg);
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
      width: 100px;
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
      /*
      /static与static区别
      */
      background-image: url("static/img/c1.jpg");/*还不清楚原因,为啥改个名字就好了*/
      background-repeat: no-repeat;
      background-size: 100% auto;
      background-attachment: fixed;
      animation-name:myfirst;
      animation-duration:30s;
      /*变换时间*/
      animation-delay:2s;
      /*动画开始时间*/
      animation-iteration-count:infinite;
      /*下一周期循环播放*/
      animation-play-state:running;
      /*动画开始运行*/
    }
    @keyframes myfirst
    {
      0%{
        background-image: url("static/img/c1.jpg");
      }
      20%{
        background-image: url("static/img/b1.jpg");
      }
      40%{
        background-image: url("static/img/b1.jpg");
      }
      100%{
        background-image: url("static/img/c1.jpg");
      }
    }

    .register-wrapper{
      font-size: small;
      margin-top: -10px;
      margin: 0 auto;
      width: 40%;
      height: 30px;
    }
    .register-wrapper a{
      text-decoration: none;
    }

    .register-wrapper .forget{
      float: left;
    }

    .register-wrapper .register{
      float: right;
    }

  </style>
  <%--    设置基础地址--%>
  <%@include file="/page/common/base.jsp"%>
</head>

<body>
<div class="container">
  <div class="row">
    <div class="col-md-offset-3 col-md-6">
      <form class ="form-horizontal" action="login" method="post" id="admin">
        <input type="hidden" name="action" value="login">
        <span class="heading"><font color="#4F4F4F">用户登录</font> </span>
        <div class="form-group">
          <input type="text" name="username" class="form-control" id="inputEmail" placeholder="用户名或电子邮件">
          <i class="fa fa-user"></i>
        </div>

        <div class="form-group help">
          <input type="password" name="pwd" class="form-control" id="pwd" placeholder="密码">
          <i class="fa fa-lock"></i>
          <a href="#" class="fa fa-question-circle"></a>
        </div>
        <div class="register-wrapper">
          <a href="#" class="forget">忘记密码</a>
          <a href="register.jsp" class="register">注册</a>
        </div>
        <button type="submit" class="btn btn-default" id="asubmit">登录</button>
      </form>
    </div>

  </div>
</div>
</body>
</html>
