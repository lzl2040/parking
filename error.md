# 开发中遇见的问题

## 1.非法出现多次出现的'contentType'具有不同的值（old：[text/html; charset=UTF-8]，new：[text/html;charset=UTF-8]）

这是因为在一个jsp文件引用另外一个jsp文件中编码不一致导致的，可以将编码都换为

```
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
```

## 2.相对路径的问题

我已经设置了客户端的基础地址为

```
http://localhost:8080/parking/
```

但是在css中引用背景文件时无法访问到文件,访问文件是如下方法

```
/static/img/c1.jpg
```

经过分析，改为如下路径即可:

```
static/img/c1.jpg
```

