<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<%
	sqlu="select * from sbxx where id="&Clng(request("id"))
		set rsu=conn.execute(sqlu)
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="cn" lang="cn">
<head>
<title>二维码生成器</title>
<style type="text/css">
<!--
table {
	color: #ffffff;
	font-weight: bold;
	font-size:11px;
	font-family:"微软雅黑";
	background-color:#23b14d;
}
-->


</style>
<meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no" />
<script type="text/javascript" src="../js/qrcode/jquery.min.js"></script>
<script type="text/javascript" src="../js/qrcode/qrcode.js"></script>

</head>
<body>
<p>
  <input id="text" type="hidden" value="<%=www%>/asset.asp?id=<%=rsu("id")%>" style="width:80%" />
</p>
<p><br />
</p>
<table width="318" border="1" cellpadding="0" cellspacing="0" >
  <tr>
    <td colspan="2"><img src="../images/asset_logo4.gif" width="318" height="35" /></td>
  </tr>
  <tr>
    <td width="149">编号：<%=rsu("sbbh")%></td>
	<td width="69" rowspan="5"><div id="qrcode" style="width:169px; height:169px;"></div>
<script type="text/javascript">
var qrcode = new QRCode(document.getElementById("qrcode"), {
	width : 169,	/* 二维码宽度，单位：像素 */
	height : 169,	/* 二维码高度，单位：像素 */
	typeNumber : 4,	/* 未知选项 */
	colorDark : "#000000",	/* 二维码背景色 */
	colorLight : "#ffffff",	/* 二维码前景色 */
	correctLevel : QRCode.CorrectLevel.L	/* 二维码容错级别：L、M、Q、H */
});

function makeCode () {		
	var elText = document.getElementById("text");
	
	if (!elText.value) {
		alert("Input a text");
		elText.focus();
		return;
	}
	
	qrcode.makeCode(elText.value);
}

makeCode();

$("#text").
	on("blur", function () {
		makeCode();
	}).
	on("keydown", function (e) {
		if (e.keyCode == 13) {
			makeCode();
		}
	});
</script>
</td>
  </tr>
  <tr>
    <td width="149">类型：<%=rsu("zilei")%></td>
  </tr>
  <tr>
    <td width="149">型号：<%=rsu("xh")%></td>
  </tr>
  <tr>
    <td width="149">部门：<%=rsu("department")%></td>
  </tr>
  <tr>
    <td width="149">使用人：<%=rsu("cfdd")%>-<%=rsu("syz")%></td>
  </tr>
</table>

</body>