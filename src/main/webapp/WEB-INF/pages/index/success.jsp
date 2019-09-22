<%--
  Created by IntelliJ IDEA.
  User: kunkun
  Date: 2019/9/19
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.krry.entity.material_type" %>
<%@include file="../common/common.jsp" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>创建/选择成功</title>

</head>
<body>
<h3>创建/选择成功</h3>
<P>id = ${sessionScope.productId}<br></P>

<a href="${basePath}/index/index">返回首页</a>

</body>
</html>
