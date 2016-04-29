<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
  </head>
  
  	 <body>
  		<table border="1">
		  <tr>
		    <th>产品列表</th>
		  </tr >
		  <%
		  	ArrayList<String> listPrd = (ArrayList<String>)request.getAttribute("listPrd");
		  	for(String str: listPrd){
		   %>
		  <tr>
		    <td><%=str %></td>
		    <td> <button  onclick="setevent(<%=str %>)"><%=str %></button></td>
		  </tr>
		  <%
		  }
		   %>
		   
	<script type="text/javascript">
		function setevent(obj)
		{
		   alart(obj);
		};
	</script>
</table>
	</body>
</html>