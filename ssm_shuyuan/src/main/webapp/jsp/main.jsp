<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/esl.js"></script>
<link href="https://unpkg.com/video.js/dist/video-js.css" rel="stylesheet">
  <script src="https://unpkg.com/video.js/dist/video.js"></script>
  <script src="https://unpkg.com/videojs-contrib-hls/dist/videojs-contrib-hls.js"></script>
</head>

<body>
<div id="container">
	<!-- This is the Header -->
  <div id="header">
    <!-- <div class="logo"> --><img class="logo" src="../images/logo.jpg" width="150" height="50">
    <div class="head"><span class="headtext">智能物联网管理系统</span></div>
      <ul id="headuser">
          <li><img src="../images/0.jpg" width="40" height="40"></li>
          <li class="lix"><a href="/user/get_information.do" class="lixa">用户信息</a></li>
          <li><img src="../images/sort_desc.png"></li>
      </ul>
  </div>
  <div id="mainContent">
    <div id="sidebar">
    	<ul class="common">
           <li><a href="#" class="a1 a2">温湿度标签</a></li>
           <li><a href="#" class="a1 a3">溯源系统</a></li>
           <li><a href="#" class="a1 a2">实时温湿度监控</a></li>
    	</ul>
       <div class="list">
          <table border="0px" cellspacing="1px" width="220px"  cellpadding="0px" align="center" bgcolor="black" id="tablel">
		    <caption align="top">在线设备列表</caption>
		       <tr  bgcolor="white">
		        <th class="th1">序号</th>
		        <th class="th2">设备ID</th>
		       </tr>


		    </table>
       </div>
    </div>
    <div id="content">
       <video id="my_video_1" class="video-js vjs-default-skin" controls preload="auto" width="800" height="450" data-setup='{}'>
           <source src="http://d2zihajmogu5jn.cloudfront.net/bipbop-advanced/bipbop_16x9_variant.m3u8" type="application/x-mpegURL"><!-- http://1p5e803947.imwork.net:18634/hls/hls.m3u8 -->
       </video>
       
    </div>

    <div class="contentright">
          <%--加载的是最新的（记录）--%>
          <table border="0px" cellspacing="1px"  cellpadding="0px" align="center" bgcolor="" id="table">

          </table>

       </div>
  </div>
    <c:forEach items="${weeklist}" var="item">
        <c:forEach var="map" items="${item}">
            <c:out value="${map.key}"></c:out>
            <c:out value="${map.value}"></c:out>
        </c:forEach>

    </c:forEach>
  <div class="main" id="main" style="height: 300px;width: 1200px;">
     
  </div>
  <!-- tubiao chajian  -->
<script type="text/javascript" src="../js/echarts.min.js"></script>
<script type="text/javascript" src="../js/echarts.js"></script>


<script type="text/javascript">
    var myChart = echarts.init(document.getElementById('main'));
    require.config({
            paths: {
                echarts: '../js'
            }
        });
        require(
            [
                'echarts',
                'echarts/chart/line',   // 按需加载所需图表，如需动态类型切换功能，别忘了同时加载相应图表
                'echarts/chart/bar'
            ],
            function (ec) {

                var option = {
			         tooltip : {
			         trigger: 'axis'
			       },
                title:{
                	text:'\n环境监测历史记录',
                	x:'center',
                	y:'top'
                },

			    toolbox: {
			        show : true,
			        feature : {
			            mark : {show: true},
			            dataView : {show: true, readOnly: false},
			            magicType: {show: true, type: ['line', 'bar']},
			            restore : {show: true},
			            saveAsImage : {show: true}
			        }
			    },
			    calculable : true,
			    legend: {
			        data:['光照强度','降水量','平均温度']
			    },
			    xAxis : [
			        {
			            type : 'category',
			            //data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
                        data : ['星期一','星期二','星期三','星期四','星期五','星期六','星期天']
			        }
			    ],
			    yAxis : [
			        {
			            type : 'value',
			            name : '水量',
			            axisLabel : {
			                formatter: '{value} ml'
			            }
			        },
			        {
			            type : 'value',
			            name : '温度',
			            axisLabel : {
			                formatter: '{value} °C'
			            }
			        }
			    ],
			    series : [

			        {
			            name:'光照强度',
			            type:'bar',
			            //data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                        data :[]

			        },
			        {
			            name:'降水量',
			            type:'bar',
			            /*data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]*/
                        data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6]
			        },
			        {
			            name:'平均温度',
			            type:'line',
			            yAxisIndex: 1,
			            data:[2.0, 2.2, 3.3, 4.5, 6.3, 10.2, 20.3]//, 23.4, 23.0, 16.5, 12.0, 6.2
			        }
			    ]
                }
                //myChart.setOption(option);
            }
        );
    myChart.showLoading();    //数据加载完之前先显示一段简单的loading动画

        var lights = [];
        var rains = [];
        $.ajax({
            type : "GET",
            /*async : false, //同步执行*/
            url : "/echart/echartWeek.do?devId=100000213",
            dataType : "json", //返回数据形式为json
            success : function(result) {
                if (result) {
                    //lights = result.light;  //console.log(light);
                    lights.push(result.light);

                    myChart.hideLoading();    //隐藏加载动画
                    myChart.setOption({        //加载数据图表

                        series: [/*{
                            // 根据名字对应到相应的系列
                            name: '销量',
                            data: nums
                        }*/
                            {
                                name:'光照强度',
                                type:'bar',
                                //data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]
                                data :lights

                            }]
                    });

                }
            },
            error : function(errorMsg) {
                alert("图表请求数据失败!");
                myChart.hideLoading();
            }
        })

</script>

<script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    var firstList;
    var light,rain,air_temp,air_humi,soil_temp,soil_humi,soil_electric,soil_salt = new Array();
    $(document).ready(function() {
        $.ajax({
            type:"POST",
            url: "/device/findId.do",
            dataType: "json",
            success:function(data){
                addfindid(data);
                firstList = data[0].deviceId;
                RinghtList(firstList);
                EchartMainLight(firstList);
            }

        });
        function addfindid(data) {
            //var data  = eval( '('+ data + ')' );
            //alert(data.deviceId);
            $.each(data,function(index,obj){
                $("#tablel").append("<tr  align='center' bgcolor='white'>"
                    +"<td class='td'>" + (index + 1) + "</td>"
                    +"<td class='td' id='t"+index+"'>" + obj['deviceId'] + "</td>"
                    +"</tr>");
            });
        }

        function RinghtList(devId) {
            $.ajax({
                type: "GET",
                url: "/device/findListRecord_his.do?devId=" +devId,
                dataType: "json",
                success: function (data) {
                    $("#table").append("<tbody>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "光照强度:" + "</td>"+
                        "<td class='td1'>" + data.light+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "降雨量:" + "</td>"+
                        "<td class='td1'>" + data.rain+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "空气温度:" + "</td>"+
                        "<td class='td1'>" + data.airTemp+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "空气温度:" + "</td>"+
                        "<td class='td1'>" + data.airHumi+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "土壤温度:" + "</td>"+
                        "<td class='td1'>" + data.soilTemp+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "土壤湿度:" + "</td>"+
                        "<td class='td1'>" + data.soilHumi+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "土壤电导率:" + "</td>"+
                        "<td class='td1'>" + data.soilElectric+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "土壤盐分:" + "</td>"+
                        "<td class='td1'>" + data.soilSalt+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "空气气压:" + "</td>"+
                        "<td class='td1'>" + data.airPressure+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "风速:" + "</td>"+
                        "<td class='td1'>" + data.windSpeed+ "</td>"+
                        "</tr>"+
                        "<tr  bgcolor='white' class='tr'>"+
                        "<td align='center' class='td1'>" + "风向:" + "</td>"+
                        "<td class='td1'>" + data.wind+ "</td>"+
                        "</tr>"+
                        "</tbody>"
                    );
                }
            });
        }


        //点击左侧列表id  改变右边列表
        $(document).on('click','#tablel tr',function () {
            $(this).click(function () {
                var deleteTr = document.getElementById("#tablel");
                deleteTr.find("tr").remove();//删除所有tr

                var td = $(this).find("td");//this指向了当前点击的行，通过find我们获得了该行所有的td对象
                var devId = td.eq(1).html();
                //var devId = td[1].innerHTML;
                //isNaN(devId);
                RinghtList(devId);
                EchartMainLight(devId)
            });

        });

        function EchartMainLight(devId) {
            //var arr=[];
            $.ajax({
                type : "GET",
                /*async : false, //同步执行*/
                url : "/echart/echartWeek.do?devId=" +devId,
                dataType : "json", //返回数据形式为json
                success : function(result) {
                    if (result) {
                       /*$.each(result,function (index, result) {
                            //var data = result[index];
                            //alert(eval("(" +data+ ")")); //undefined
                            //var data1 = eval("(" +data+ ")");
                        })*/
                       light = result.light;
                       alert(light);
                  }
                },
                error : function(errorMsg) {
                    alert("不好意思，图表请求数据失败啦!");
                }
            })
            //return arr;
        }


	});


</script>
</div>
<%@include file="/jsp/include/footer.jsp"%>
</body>

</html>
