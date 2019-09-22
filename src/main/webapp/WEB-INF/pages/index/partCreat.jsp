<%--
  Created by IntelliJ IDEA.
  User: kunkun
  Date: 2019/9/19
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.krry.entity.material_type" %>
<%@include file="../common/common.jsp" %>

<!DOCTYPE HTML>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>添加产品</title>
<%--    <script type="text/javascript">--%>
<%--        $(document).ready(function() {--%>
<%--            $("#btn").click(function () {--%>
<%--                alert("Succeed2");--%>
<%--                $("#cid").text("Succeed");--%>
<%--            })--%>
<%--    };)--%>
<%--    </script>--%>
            
        
</head>


<body>

<form action="${basePath}/index/partCreat" method="post">
    零件名：<input type="text" name="partName"/><br>
    零件x尺寸：<input type="text" name="part_x"/><br>
    零件y尺寸：<input type="text" name="part_y"/><br>
    零件z尺寸：<input type="text" name="part_z"/><br>
    零件材料：
    <select id="material" name="material_type"  onchange="myFunction()">
        <option value=NULL> ---请选择材料--- </option>
        <%

            List<material_type> ls = (List<material_type>)request.getSession().getAttribute("material_type");

            for (material_type typeVo : ls) {%>

        <option value="<%=typeVo.getMaterial_type()%>"> <%=typeVo.getMaterial_type() %> </option>

        <%

            }

        %>

    </select><br>

    零件质量：<input type="text" name="workpiece_weight_kg"/><br>
    多面：<input name="multiaspect" type="checkbox" value="true" />
    旋转体：<input name="rotation" type="checkbox" value="true" /><br>
    <input type="submit" value="下一步" ><br>
</form>

</body>

</html>
