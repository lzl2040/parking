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

但还是有问题，有如下的问题

### 2.1 当我设置了基础地址后,引入css就不起作用(或者有一部分作用，但是跟预期不符)，但是css可以得到

目前没有解决这个问题。

### 2.2 当我把jsp移入某个文件夹后，设置背景图片地址得是**/parking/static/img/c1.jpg**

好像只能这样子，目前没找到好的解决方法

## 3.在jsp中引入jsp的需要注意的地方

引入的jsp中**不能含有html,body部分**，不然会报错，显示无法找到这个文件，但是style,link这些是可以有的。

## 4.SQLexception 报错Cannot create com.example.parking.entity.Location

这是因为Location类中没有一个无参构造，只要加一个无参数构造就行了。

## 5.在使用QueryRunner这个类时获取数据库表的值有些数据是Null

有以下几个原因：

(1)因为JavaBean与数据库的表的字段类型也是需要对应的，比如(以mysql数据库为例)

| 数据库对应字段类型 |   javaBean对应类型   |
| ------------------ | ---- |
|  varchar                  |   String   |
|  int                  |   int   |
|  double                  |  Double/double    |
| integer | Integer |

(2)JavaBean中的变量名要跟数据库对应的字段名一样，这是由QueryRunner的源码决定的，它是利用了反射的原理。

具体原理如下:

```java
String methodName = "set"+colName.substring(0,1).toUpperCase()+colName.substring(1).toLowerCase();
//通过数据库获取数据库对应的java类型QName
//varchar - java.lang.String , int -- java.lang.Integer
String javaType = rsmd.getColumnClassName(i+1);
//反射出T的方法
try{
    Method method = cls.getMethod(methodName, Class.forName(javaType));
    //执行，查询数据库
    Object value = rs.getObject(colName);
    method.invoke(t, value);//调用JavaBean的set方法把值set进去
}catch(Exception e){
    //e.printStackTrace();
}
```

通过实现反射set方法来进行注入。

## 6.百度地图API定位不准

目前没有解决。