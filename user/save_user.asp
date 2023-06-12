<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/mysession.asp" -->
<!--#include file="../inc/md5.asp"-->
<%if Instr(session("juese"),"|306,")<>0 or Cint(request("id"))=Cint(request("qx")) then %>
<html>
<%
id=Cint(request("id"))
action=request("action")
if action="add" then
    sql1="select * from admin where id='"+ id +"'"
    rs.open sql1,connstr,1,3
    if not rs.eof then
          response.write ("<script>alert('该账号已经存在！请重新输入！');window.location.replace('add_user.asp');</script>")
    else
        chk_id="ok"
    end if
   rs.close
    if chk_id="ok" Then
        sql="select * from admin"
        rs.open sql,connstr,1,3
        rs.addnew()
	end if
else                                                    '修改管理员
	sql="select * from admin where id="& id &""
	rs.open sql,connstr,1,3
end if
    if action="add" then                                    '如果添加管理员
        rs("admin_id")=trim(request("userid"))                  '添加用户名
        rs("admin_pw")=md5(request("userpw"))                   '添加密码
        rs("admin_name")=trim(request("name"))                  '添加姓名
        rs("rank")=Request.Form("y_name")                       '添加权限
		rs("juese")=Request.Form("juese") 						'添加角色
       rs("amwork")=0
        if Request.Form("Working")=1 then                     '添加状态
            rs("Working")=Request.Form("Working")               '选中启用
        else
            rs("Working")=0
        end if
        rs.update                                               '更新到数据库
        response.write ("<script>alert('用户添加操作成功！');location.href='user_info.asp';</script>")
    else                                                    '如果是修改管理员
        password=rs("admin_pw")
        dim oldpwd,newpwd,newpwd2
        oldpwd=Request("userpw")
        newpwd=Request("newpw")
        newpwd2=Request("newpw2")
        if Instr(session("juese"),"|306,")<>0 then
		' 判断是否是超级管理员修改，若是直接修改，否则重复密码确认密码修改
		if not(md5(request("userpw"))=rs("admin_pw") or request("userpw")=rs("admin_pw")) then
			rs("admin_pw")=md5(request("userpw"))			'判断是否修改密码，没有则跳过。
		end if
   			if rs("admin_id")<>"admin" then				'判断用户名是否为admin
				if Request.Form("working")=1 then				'账户是否可用
					rs("working")=1								'是
				else
					rs("working")=0
				end if
			end if
            rs("amwork")=0
            rs("admin_name")=trim(request("name"))            '姓名
            rs("rank")=Request.Form("y_name")                 '权限
   			if id <> 1 then
   				rs("juese")=Request.Form("juese") 			  '角色
			end if
            response.write ("<script>alert('用户修改成功！');location.href='user_info.asp';</script>")
            rs.update
            response.end
        else                                                '若不是超级管理员
            if newpwd=newpwd2 then                          '判断两次输入密码是否一致
                if oldpwd=password or md5(oldpwd)=password then     '如果一致，再判断密码是否与旧密码相同
                    if newpwd="" and newpwd2="" then                       '如果新密码为空，则不修改密码
                       if trim(request("name"))=rs("admin_name") then
                            response.write "<script language=javascript>alert('所有信息均未修改，请返回重新填写！');location='xg_user.asp?id="&rs("id")&"&qx="&rs("id")&"'</script>"
                           response.end
                        end if
                        rs("admin_name")=trim(request("name"))  '修改姓名
                        rs.update                               '添加到数据库
                        response.write "<script language=javascript>alert('用户信息修改成功!');location='user_info.asp'</script>"
                        response.end
                    else
                        rs("admin_pw")=md5(newpwd)              '修改密码
                        rs("admin_name")=trim(request("name"))  '修改姓名
                        rs.update                               '添加到数据库
                        session("web_admin")=""
                        response.write "<script language=javascript>alert('密码修改成功!');location='user_info.asp'</script>"
                        response.end
                    end if
                else
                    response.write "<script language=javascript>alert('密码输入错误，返回重新输入！');location='xg_user.asp?id="&rs("id")&"&qx="&rs("id")&"'</script>"
                    response.end
                end if
            else
                response.write "<script language=javascript>alert('两次新密码输入不一致，请返回重新输入！');location='xg_user.asp?id="&rs("id")&"&qx="&rs("id")&"'</script>"
                response.end
            end if 
        end if
    end if
else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>