<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<!-- <link href="css/main.css" rel="stylesheet" type="text/css" /> -->
<link rel="stylesheet" type="text/css" href="../css/foot.css">
<link rel="stylesheet" type="text/css" href="../css/config.css">
<link rel="stylesheet" type="text/css" href="../css/warning_config_list.css">
</head>

<body>
	<div id="container">
	<!-- This is the Header -->
	  <div id="header">
	    <img class="logo" src="../images/logo.jpg" width="150" height="50">
	    <div class="head"><span class="headtext">智能物联网管理系统</span></div>

	  </div>
		<span id="atext"><a href="#">实时温湿度监控</a> >  报警设置</span>

            <form action="#" method="post" id="formconfig">
                <div class="THlist">
		          <table border="0" cellspacing="1px" width="1000px"  cellpadding="0px" align="center" bgcolor="white" id="tablelist">
				    
				       <tr  bgcolor="white">
				        <th class="l l1">类型</th>
				        <th class="l l3">是否开启警告</th>
		                <th class="l l5">警告上限</th>
		                <th class="l l6">警告下限</th>
				      </tr>
				      <tr  align="center">		       
				        <td class="tdl">光照强度</td>
				        <td class="tdl"></td>   
				        <td class="tdl">
                            <input type="range" id="light1" min="0" max="50" step="1" onchange="gmax.value=this.value"/>
	   						<output id="gmax" for="light1" ></output>
				        </td>
				        <td class="tdl">
                            <input type="range" id="light2" min="0" max="50" step="1" onchange="gmin.value=this.value"/>
	   						<output id="gmin" for="light2" ></output>
				        </td>    
				      </tr>
				        <tr  align="center">		       
				        <td class="tdl">降雨量</td>
				        <td class="tdl"></td>   
				        <td class="tdl"></td>
				        <td class="tdl"></td>    
				      </tr>
				      <tr  align="center">		       
				        <td class="tdl">温度</td>
				        <td class="tdl"></td>   
				        <td class="tdl"></td>
				        <td class="tdl"></td>    
				      </tr>
				        <tr  align="center">		       
				        <td class="tdl">湿度</td>
				        <td class="tdl"></td>   
				        <td class="tdl"></td>
				        <td class="tdl"></td>    
				      </tr>
				      <tr  align="center">		       
				        <td class="tdl">土壤温度</td>
				        <td class="tdl"></td>   
				        <td class="tdl"></td>
				        <td class="tdl"></td>    
				      </tr>
				        <tr  align="center">		       
				        <td class="tdl">土壤湿度</td>
				        <td class="tdl"></td>   
				        <td class="tdl"></td>
				        <td class="tdl"></td>    
				      </tr>
				      <tr  align="center">		       
				        <td class="tdl">土壤电导率</td>
				        <td class="tdl"></td>   
				        <td class="tdl"></td>
				        <td class="tdl"></td>    
				      </tr>
				        <tr  align="center">		       
				        <td class="tdl">土壤盐分</td>
				        <td class="tdl"></td>   
				        <td class="tdl"></td>
				        <td class="tdl"></td>    
				      </tr>
				    </table>
		       </div>
               
            </form>
		
       
    </div>
	<%@include file="/jsp/include/footer.jsp"%>

</body>

</html>
