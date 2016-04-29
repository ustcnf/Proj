<%@ page language="java" import="java.util.*,Entity.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
ArrayList<JsonStr> jsonStr = (ArrayList<JsonStr>) request.getAttribute("jsonList");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  
  <body>
   <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
               第一个产品
    <hr>
    <div id="main" style="height:400px"></div>
    <hr>
              第二个产品
    <hr>
    <div id="main1" style="height:600px"></div>
    
    <!-- ECharts单文件引入 -->
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">
        // 路径配置
        require.config({
            paths: {
                echarts: 'http://echarts.baidu.com/build/dist'
            }
        });
        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                option = <%=jsonStr.get(0).getJsonlen()%>;      
                // 为echarts对象加载数据 
                myChart.setOption(option); 
            }
        );
    </script> 
    dflaskjdflkdsajf
    saldfjldskfjlkdsajfls 
    <hr> 
    <%  out.write(jsonStr.get(0).getJsonlen()) ;
    %> 
    <hr> 
    <%  out.write(jsonStr.get(1).getJsonlen()) ;
    %> 
    <script src="http://echarts.baidu.com/build/dist/echarts.js"></script>
    <script type="text/javascript">        
        // 使用
        require(
            [
                'echarts',
                'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main1')); 
                
          		var option1 = <%=jsonStr.get(1).getJsonlen()%>;
        
                // 为echarts对象加载数据 
                myChart.setOption(option1); 
            }
        );
    </script>    
    
	</body>
</html>