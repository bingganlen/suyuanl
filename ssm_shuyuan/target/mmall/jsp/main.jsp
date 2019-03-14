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
    <link href="../css/foot.css" rel="stylesheet" type="text/css"/>
    <!-- 单选框  -->      <%--<%=request.getContextPath()%>   不推荐使用  因其对终端用户的用户体验存在负面影响--%>
    <script type="text/javascript" src="../js/jquery-3.3.1.js"></script>
    <link rel="stylesheet" href="../css/jquery-labelauty.css" />

    <!-- 视频插件 -->
    <%--<script src="../m3u8/swfobject.js"></script>
    <script src="../m3u8/html5media.min.js"></script>--%>

</head>

<body>
<div id="container">
    <!-- This is the Header -->
    <div id="header">
        <img class="logo" src="../images/logo.jpg" width="150" height="50">
        <div class="head"><span class="headtext">智能物联网管理系统</span></div>
        <ul id="headuser">
            <li><img src="../images/0.jpg" width="40" height="40"></li>
            <li class="lix"><a href="/user/get_information.do" class="lixa">用户信息</a></li>
            <li><img src="../images/sort_desc.png"></li>
        </ul>
    </div>
    <!-- This is the Content -->
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
            <script type="text/javascript" src="../js/baiduVideo/baidu/cyberplayer.js"></script>
            <script src="https://open.ys7.com/sdk/js/1.4/ezuikit.js"></script>
            <%--//手机浏览器上不支持加密视频的解密播放    不支持flv和rtmp--%>

            <%--<script src="https://cdn.jsdelivr.net/hls.js/latest/hls.min.js"></script>
            <video id="video" controls></video>
            <script>
                if(Hls.isSupported()) {
                    var video = document.getElementById('video');
                    var hls = new Hls();
                    hls.loadSource('http://hls.open.ys7.com/openlive/5542726f05db4d139783b2c9c4dac1d9.m3u8');
                    hls.attachMedia(video);
                    hls.on(Hls.Events.MANIFEST_PARSED,function() {
                        video.play();
                    });
                }
            </script>--%>

            <%--视频模块--%>
            <div id="playercontainer" >
                <source src>
            </div>

            <script type="text/javascript">
              /*  自适应hls*/
                var player = cyberplayer("playercontainer").setup({
                    width: 880,
                    height: 450,
                    file: "http://hls.open.ys7.com/openlive/5542726f05db4d139783b2c9c4dac1d9.m3u8", // 多码率hls地址
                    image: "http://gcqq450f71eywn6bv7u.exp.bcevod.com/mda-hcztxwn9bkc94r0z/mda-hcztxwn9bkc94r0z.jpg",
                    autostart: true,
                    stretching: "uniform",
                    volume: 100,
                    controls: true,
                    ak: "cc94de6803904f2ca7159eedeaced55d" // 公有云平台注册即可获得accessKey
                });
            </script>

        </div>

        <div class="contentright">
            <%-- 实时数据显示1分钟   加载的是最新的（记录）--%>
            <table border="0px" cellspacing="1px"  cellpadding="0px" align="center" bgcolor="" id="table" title="实时数据显示（一分钟记录一次）"></table>
        </div>
    </div>

    <div class="select">
        <ul class="dowebok">
            <%--一天   最近一周 除今天外（原本星期、上星期）--%>
            <li ><input id="v1" value="0" checked="checked" type="radio" name="radio" data-labelauty="近一周" ></li>
            <li ><input id="v2" value="1" type="radio" name="radio" data-labelauty="24小时" ></li>
            <li ><input id="v3" value="2" type="radio" name="radio" data-labelauty="上个月" ></li>
            <li > <input id="v4" value="3" type="radio" name="radio" data-labelauty="上一年" ></li>

        </ul>
    </div>

    <%--echart 历史数据显示--%>
    <div class="main" id="main">

    </div>

    <script type="text/javascript" src="../js/echarts.min.js"></script>
    <script type="text/javascript" src="../js/echarts.js"></script>
    <script type="text/javascript">

        var firstList;
        var devId ;
        var url = "http://1p5e803947.imwork.net:18634";
        var bt = "/sensor/sensor.php";
        $(document).ready(function() {
            getPHP();//加载页面时第一次刷新，之后延迟一分钟
            setTimeout(function(){
                getPHP();
            },60000);



            $.ajax({
                type:"POST",
                url: "/device/findId.do",
                dataType: "json",
                success:function(data){
                    addfindid(data);
                    firstList = data[0].deviceId;
                    Echart(firstList);
                    devId = firstList;
                }
            });
            function addfindid(data) {
                //var data  = eval( '('+ data + ')' );
                $.each(data,function(index,obj){
                    $("#tablel").append("<tr  align='center' bgcolor='white'>"
                        +"<td class='tdcolor'>" + (index + 1) + "</td>"
                        +"<td class='tdcolor' onclick='addcolor(this.id)' id='t"+index+"'>" + obj['deviceId'] + "</td>"
                        +"</tr>");
                });
               /* var e = "2019-03-06 10:00:01.0";
                var c = e.substring(5,10);
                alert(c);*/
            }});

           /* function RightList(devId) {
                $.ajax({
                    type: "GET",
                    url: "/device/findListRecord_his.do?devId=" +devId,
                    dataType: "json",
                    success: function (data) {
                        rightappend(data);
                    }
                });
            }*/


            //点击左侧列表id  改变右边列表
            $(document).on('click','#tablel tr',function () {
                $(this).click(function () {
                    // 取消上次延时未执行的方法
                    var clickTimeId;
                    $("#table").find("tr").remove();//删除所有tr
                    var td = $(this).find("td");//this指向了当前点击的行，通过find我们获得了该行所有的td对象
                    devId = td.eq(1).html();//var devId = td[1].innerHTML;     设备ID变成点击左侧列表的id
                    clearTimeout(clickTimeId);
                    clickTimeId = setTimeout(function() {//执行延时
                        $("#tdbody").remove();//删除所有tr
                        Echart(devId);
                        $("#v1").prop("checked",true);//todo
                    }, 200);

                });
        });



        function addcolor(x){//  点击该ID 颜色变 点另一个ID的时候恢复（另一个ID 颜色变）   该元素ID的父亲的其他兄弟的第二个儿子颜色
            $("#"+x).css('color','#00a0f0').parent().siblings().children(1).css('color','#000');//.siblings() 同辈的其他效果变色
        }

        function getPHP() {
            $.ajax({
                type:"POST",
                async:false,
                url: url+bt,
                dataType: "json",
                success:function(data){
                    rightappend(data);
                },
                error:function(XMLHttpRequest, textStatus, errorThrown) {
                    alert("加载错误，错误原因：\n"+errorThrown);
                }
            })
        }
        function division(a){
            var num = a/10;
            return a.toFixed(1);
        }



        function rightappend(data) {
             $("#table").find("tr").remove();//删除所有tr
             $("#table").append("<tbody id='tdbody'>"+
                 "<tr  bgcolor='white' class='tr'>"+
                 "<td align='center' class='td1'>" + "光照强度:" + "</td>"+
                 "<td class='td3'>" + data.illumination+ "</td>"+ /*light*/
                 "<td class='td2'>" + "lux"+ "</td>"+
                 "</tr>"+
                 "<tr  bgcolor='white' class='tr'>"+
                 "<td align='center' class='td1'>" + "降雨量:" + "</td>"+
                 "<td class='td3'>" + data.rainfall/10+ "</td>"+/*rain*/
                 "<td class='td2'>" + "mm"+ "</td>"+
                 "</tr>"+
                 "<tr  bgcolor='white' class='tr'>"+
                 "<td align='center' class='td1'>" + "空气温度:" + "</td>"+
                 "<td class='td3'>" + data.air_temp/10+ "</td>"+/*airTemp*/
                 "<td class='td2'>" + "℃"+ "</td>"+
                 "</tr>"+
                 "<tr  bgcolor='white' class='tr'>"+
                 "<td align='center' class='td1'>" + "空气温度:" + "</td>"+
                 "<td class='td3'>" + data.air_hum/10+ "</td>"+/*airHumi*/
                 "<td class='td2'>" + "%"+ "</td>"+
                 "</tr>"+
                 "<tr  bgcolor='white' class='tr'>"+
                 "<td align='center' class='td1'>" + "土壤温度:" + "</td>"+
                 "<td class='td3'>" + data.soil_temp/10+ "</td>"+/*soilTemp*/
                 "<td class='td2'>" + "℃"+ "</td>"+
                 "</tr>"+
                 "<tr  bgcolor='white' class='tr'>"+
                 "<td align='center' class='td1'>" + "土壤湿度:" + "</td>"+
                 "<td class='td3'>" + data.soil_hum/10+ "</td>"+/*soilHumi*/
                 "<td class='td2'>" + "%"+ "</td>"+
                 "</tr>"+
                 "<tr  bgcolor='white' class='tr'>"+
                 "<td align='center' class='td1'>" + "土壤电导率:" + "</td>"+
                 "<td class='td3'>" + data.soil_conductivity+ "</td>"+/*soilElectric*/
                 "<td class='td2'>" + "uS/cm"+ "</td>"+
                 "</tr>"+
                 "<tr  bgcolor='white' class='tr'>"+
                 "<td align='center' class='td1'>" + "土壤盐分:" + "</td>"+
                 "<td class='td3'>" + data.soil_salinity+ "</td>"+ /*soilSalt*/
                 "<td class='td2'>" + "mg/L"+ "</td>"+
                 "</tr>"+

                 "</tbody>"
             );
         }
        /*"<tr  bgcolor='white' class='tr'>"+
        "<td align='center' class='td1'>" + "空气气压:" + "</td>"+
        "<td class='td1'>" + data.airPressure+ "</td>"+
        "<td class='td2'>" + ""+ "</td>"+
        "</tr>"+
        "<tr  bgcolor='white' class='tr'>"+
        "<td align='center' class='td1'>" + "风速:" + "</td>"+
        "<td class='td1'>" + data.windSpeed+ "</td>"+
        "<td class='td2'>" + ""+ "</td>"+
        "</tr>"+
        "<tr  bgcolor='white' class='tr'>"+
        "<td align='center' class='td1'>" + "风向:" + "</td>"+
        "<td class='td1'>" + data.wind+ "</td>"+
        "<td class='td2'>" + ""+ "</td>"+
        "</tr>"+*/


    <!-- tubiao chajian  -->
        //var numg = 1416; //59*24
        var echartUrl = "/echart/echartWeek.do";
        var myColumns = [];
        var num = 0;
        var chart = 1799;//Day

        $(".dowebok li").on('click',function () {
            $(this).click(function () {
                num = $(this).find("input").val();
                select(num);

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
                        myChart = ec.init(document.getElementById('main'));
                        $.ajax({
                            type : "GET",
                            /*async : false, //同步执行*/
                            url : echartUrl+"?devId="+devId,
                            dataType : "json", //返回数据形式为json
                            success : function(result) {
                                if (result) {
                                    drawEchart(result);
                                }
                            },
                            error : function(errorMsg) {
                                alert("无设备ID! 请点击设备列表上的ID");
                            }
                        });
                    }
                );
            });

        });
        function select(num) {
            if (num == 0){
                //myColumns = week;
                chart = 59;//1799;
                echartUrl = "/echart/echartWeek.do";
                //var chart = echartUrl.substring(14,17);

            } else if(num == 1){
                chart = 59;
                echartUrl = "/echart/echartDay.do";
                //var chart = echartUrl.substring(14,17);
            }else if(num == 2){
                chart = 1799;
                echartUrl = "/echart/echartMonth.do";
                //var chart = echartUrl.substring(14,17);
            }else {
                chart = 1800*30-1;
                alert(chart);
                echartUrl = "/echart/echartYear.do";
                //var chart = echartUrl.substring(14,17);
            }
        }


        function Echart(DevId) {
            select(0);
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
                    myChart = ec.init(document.getElementById('main'));
                    //myChart.hideLoading();

                    $.ajax({
                        type : "GET",
                        /*async : false, //同步执行*/
                        url : echartUrl+"?devId="+DevId,
                        dataType : "json", //返回数据形式为json
                        success : function(result) {
                            if (result) {
                                drawEchart(result);
                            }
                        },
                        error : function(errorMsg) {
                            alert("图表请求数据失败!");
                        }
                    });

                }
            );
        }

        function drawEchart(result) {
            var arr = [];
            //时间间隔代码
            arr = result.create_time;
            // var size = getJsonLength(result.create_time);
            // for (var i = 0; i < size; i++) {
            //     if (arr[i] == arr[i+1]){
            //
            //     }
            // }
            //alert(result.create_time[0]);   // 3月 06号   1551837601000   03月06号10:00

            myChart.setOption({
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
                    data:['光照强度','降水量','温度','湿度','土壤温度','土壤湿度','土壤电导率','土壤盐分']
                },
                xAxis : [
                    {

                        type : 'category',/*category*/
                        data : arr,/*result.create_time*/

                        axisLabel:{
                            //rotate:10, //刻度旋转45度角
                            interval:chart,//横坐标隐藏个数

                            textStyle:{
                                color:"#24C5DB",
                                fontSize:12
                            }
                        }
                        /*type: "time",
                        timeFormat: 'yyyy-MM-dd',
                        tickMax: true,
                        data:result.create_time,
                        axisLabel: {
                            tooltip: {
                                show: false
                            },
                            formatter: function (params) {
                                return new Date(params).Format('MM-dd');
                            }
                        },
                        silent: false,
                        triggerEvent: true,
                        selectEvent: true*/

                    }
                ],
                yAxis : [
                    {
                        type : 'value',
                        name : '水量',
                        axisLabel : {
                            formatter: '{value} mm'
                        }
                    },
                    {
                        type : 'value',
                        name : '温度',
                        axisLabel : {
                            formatter: '{value}'+' °C',
                            min:-10,
                            max:10
                        }
                    }
                ],
                series: [/*{
                 // 根据名字对应到相应的系列
                 name: '销量',
                 data: nums
                 }*/
                    {
                        name:'光照强度',
                        type:'bar',
                        connectNulls: true,
                        data :result.light//[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3]

                    },
                    {
                        name:'降水量',
                        type:'bar',
                        connectNulls: true,
                        data: result.rain//[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3]
                    },
                    {
                        name:'温度',
                        type:'line',
                        yAxisIndex: 1,
                        connectNulls: true,
                        data:result.air_temp
                    },
                    {
                        name:'湿度',
                        type:'line',
                        yAxisIndex: 1,
                        connectNulls: true,
                        data:result.air_humi
                    },
                    {
                        name:'土壤温度',
                        type:'line',
                        yAxisIndex: 1,
                        connectNulls: true,
                        data:result.soil_temp
                    },
                    {
                        name:'土壤湿度',
                        type:'line',
                        yAxisIndex: 1,
                        connectNulls: true,
                        data:result.soil_humi
                    },
                    {
                        name:'土壤电导率',
                        type:'line',
                        yAxisIndex: 1,
                        connectNulls: true,
                        data:result.soil_electric
                    },
                    {
                        name:'土壤盐分',
                        type:'line',
                        yAxisIndex: 1,
                        connectNulls: true,
                        data:result.soil_salt
                    }
                ]
            },true)
        }

        function getJsonLength(jsonData){
            var jsonLength = 0;
            for(var item in jsonData){
                jsonLength++;
            }
            return jsonLength;
        }


        window.onscroll=function(){
            var scrollTop = document.documentElement.scrollTop||document.body.scrollTop;
            if(scrollTop>=document.body.offsetHeight-document.documentElement.clientHeight)
            {
                document.getElementById("look").style.display="none";
            }
            if(scrollTop<=document.body.offsetHeight-document.documentElement.clientHeight){
                document.getElementById("look").style.display="block";
            }
        }

    </script>
</div>


<%@include file="/jsp/include/footer.jsp"%>
<!-- 单选框美化 -->
<script type="text/javascript" src="../js/jquery-labelauty.js"></script>
<script type="text/javascript">/*<!-- 放在后面 防止与Echart冲突-->*/
    $(function(){
        $(":input").labelauty();
    });

</script>
</body>

</html>
