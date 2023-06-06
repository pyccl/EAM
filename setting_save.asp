<!--#include file="inc/mysession.asp" -->
<!--#include file="inc/conn.asp"-->
<%
if Instr(session("juese"),"|300,")=0 then %>
<!--#include file="/inc/quanxian.asp"-->
<%response.write ("<font color='red')>你不具有该管理模块的操作权限，请返回！</font>")
  response.end
else 
sql="select * from setting"
rs.open sql,connstr,1,3
rs("companyname")=trim(request("companyname"))
rs("systemname")=trim(request("systemname"))
rs("lock")=request("lock")
   if len(trim(request("icpnum")))=0 then
   	rs("icpnum")=null
   else
	rs("icpnum")=request("icpnum")
   end if
   if len(trim(request("icphttp")))=0 then
   	rs("icphttp")=null
   else
	rs("icphttp")=request("icphttp")
   end if
   if len(trim(request("gongannum")))=0 then
   	rs("gongannum")=null
   else
	rs("gongannum")=request("gongannum")
   end if
   if len(trim(request("gonganhttp")))=0 then
   	rs("gonganhttp")=null
   else
	rs("gonganhttp")=request("gonganhttp")
   end if
            if request("pdkg")=1 then
                rs("pd")=1
            else
                rs("pd")=0
            end if
   if len(trim(request("message")))=0 then
   	rs("message")=null
   else
	rs("message")=request("message")
   end if
	rs("imgh")=request("imgh")
	rs("imgw")=request("imgw")
	rs("yuangongimgw")=request("yuangongimgw")
	rs("liebiao")=request("liebiao")
   rs("biaoqian")=request("biaoqian")
            if request("sfhb")=1 then
                rs("sfhb")=1
            else
                rs("sfhb")=0
            end if
			if len(request("kssj"))=0 then
				 rs("kssj") = null
			else
				rs("kssj")=request("kssj")
			end if
			if len(request("jssj"))=0 then
				 rs("jssj") = null
			else
				rs("jssj")=request("jssj")
			end if
rs.update
rs.close
set rs=nothing

response.write ("<script>alert('系统配置修改成功，部分选项需要重新登录后生效!');window.location.replace('setting.asp');</script>")

end if
%>
