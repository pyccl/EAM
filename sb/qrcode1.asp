<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="gb2312" lang="gb2312">
<head>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
<title>固定资产标签打印</title>
<style type="text/css">
<!--
table {
	color: #ffffff;
	font-weight: bold;
	font-size:11px;
	font-family:"微软雅黑";

}
.STYLE4 {color: #000000}
-->
</style>
<script type="text/javascript" src="../js/qrcode/jquery.min.js"></script>
<script type="text/javascript" src="../js/qrcode/qrcode.js"></script>
<script language="javascript" src='../js/Lodop/Lodopfuncs.js'></script>
<script language="javascript" src='http://localhost:8000/Lodopfuncs.js?priority=1'></script>
</head>
<body>
<div align="center"> <a href="javascript:prn1_preview()">打印预览</a>,可<a href="javascript:prn1_print()">直接打印</a>也可 <a href="javascript:prn1_printA()">选择打印机</a> </div>
<div id="div1" >
<table border="0" cellpadding="0" cellspacing="0"  >
<tr>
<%
lbid=request("lbid")
sbid=split(lbid,",") 

for i=0 to ubound(sbid) 
Set rsu=Server.CreateObject("ADODB.Recordset")
	sqlu="select * from sbxx where id="& sbid(i)
rsu.open sqlu,connstr,1,3
if sbid(i)<>"" then
rsu("dyzt")=1
rsu.update
end if
%>


<td>
<table width="240" border="1" cellpadding="0" cellspacing="0" style="font-weight: bold;font-size:11px;font-family:微软雅黑;">
 <input id="text<%=sbid(i)%>" type="hidden" value="<%=www%>/asset.asp?id=<%=sbid(i)%>" >
  <tr>
    <td colspan="2"><img src="../images/asset_logo4.jpg"/></td>
  </tr>
  <tr>
    <td width="154"><span class="STYLE4">编号：<%=rsu("sbbh")%></span></td>
	
	<td width="80"  rowspan="4">
	<div id="qrcode<%=sbid(i)%>" style="width:80px; height:80px; "></div>
	<script type="text/javascript">
	var qrcode = new QRCode(document.getElementById("qrcode<%=sbid(i)%>"), {
	width : 80,
	height : 80
	});

	function makeCode () {		
	var elText = document.getElementById("text<%=sbid(i)%>");
	
	qrcode.makeCode(elText.value);
	}

	makeCode();
	</script></td>
	</tr>
  <tr>
    <td><span class="STYLE4">型号：<%=rsu("xh")%></span></td>
  </tr>
  <tr>
    <td><span class="STYLE4">类别：<%=rsu("pp")%></span></td>
  </tr>
  <tr>
    <td><span class="STYLE4">使用人：<%=rsu("syz")%></span></td>
  </tr>
</table>
</td>
<td width="18"></td>
<%
j=i+1
if (j mod 3)=0 Then       
  response.write "</tr><tr height=30><td colspan=6></td></tr><tr>"
end if
next%>
</table>
</div>
<script language="javascript" type="text/javascript">   
        var LODOP; //声明为全局变量 
	function prn1_preview() {	
		CreateOneFormPage();	
		LODOP.PREVIEW();	
	};
	function prn1_print() {		
		CreateOneFormPage();
		LODOP.PRINT();	
	};
	function prn1_printA() {		
		CreateOneFormPage();
		LODOP.PRINTA(); 	
	};	
	function CreateOneFormPage(){
		LODOP=getLodop();
		LODOP.PRINT_INIT("资产标签打印");
		LODOP.SET_PRINT_STYLE("FontSize",18);
		LODOP.SET_PRINT_STYLE("Bold",1);
    	LODOP.ADD_PRINT_HTM("0mm","0mm","210mm","297mm",document.getElementById("div1").innerHTML); 
		LODOP.SET_PREVIEW_WINDOW(1,2,0,0,0,"");	
		LODOP.PREVIEW();
	};	                     
</script> 
</body>