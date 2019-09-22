
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.i4tp.entity.material_type" %>
<%@include file="../common/common.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">

    window.onload=function(){
        var isProcess = <%=request.getSession().getAttribute("allPart")%>;
        if( isProcess === "" ){
        }

        alert(<%=request.getAttribute("processInt")%>);
    }

</script>

<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <title>添加工艺</title>
</head>

<body>
<input type="hidden" id="info" value=0>
<p>当前工艺：</p><br>
<pre id="p_inf">无 </pre><br>
<form action="${basePath}/index/processSelect" method="post">
    选择已有工艺：
    <select id="processSelect" name="processSelect"  onchange="myFunction()">
        <option value=NULL> ---请选择工艺--- </option>
<%--        <%--%>
<%--            List<processType> ls = (List<processType>)request.getSession().getAttribute("allProcess");--%>
<%--            for (processType typeVo : ls) {%>--%>
<%--        <option value="<%=typeVo%>"> <%=typeVo.getPartName() %> </option>--%>
<%--        <%--%>


<%--            }--%>
<%--        %>--%>
    </select><br>
    <input type="button" value="新增工艺" onclick="createRow()">
    <table id="editTable" border="1" width="800">
        <tr>
            <th>特征编号</th>
            <th>特征参数1</th>
            <th>特征参数2</th>
        </tr>
        <tbody id="tbody">
        </tbody>
    </table>
    <input type="button" value="保存并应用工艺" onclick="save()">
    <input type="submit" value="下一步"  > <br>
</form>

</body>

<script type="text/javascript" >
function createRow(){
    document.getElementById('info').value
        = parseFloat(document.getElementById('info').value)+1;
var editTable=document.getElementById("tbody");	var tr=document.createElement("tr");

var td1=document.createElement("td");
td1.innerHTML="<input type='text' />";
var td2=document.createElement("td");
td2.innerHTML="<input type='text' />";
var td3=document.createElement("td");
td3.innerHTML="<input type='text' />";
tr.appendChild(td1);
tr.appendChild(td2);
tr.appendChild(td3);
editTable.appendChild(tr);
}
</script>
</html>

