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
          response.write ("<script>alert('���˺��Ѿ����ڣ����������룡');window.location.replace('add_user.asp');</script>")
    else
        chk_id="ok"
    end if
   rs.close
    if chk_id="ok" Then
        sql="select * from admin"
        rs.open sql,connstr,1,3
        rs.addnew()
	end if
else                                                    '�޸Ĺ���Ա
	sql="select * from admin where id="& id &""
	rs.open sql,connstr,1,3
end if
    if action="add" then                                    '�����ӹ���Ա
        rs("admin_id")=trim(request("userid"))                  '����û���
        rs("admin_pw")=md5(request("userpw"))                   '�������
        rs("admin_name")=trim(request("name"))                  '�������
        rs("rank")=Request.Form("y_name")                       '���Ȩ��
		rs("juese")=Request.Form("juese") 						'��ӽ�ɫ
       rs("amwork")=0
        if Request.Form("Working")=1 then                     '���״̬
            rs("Working")=Request.Form("Working")               'ѡ������
        else
            rs("Working")=0
        end if
        rs.update                                               '���µ����ݿ�
        response.write ("<script>alert('�û���Ӳ����ɹ���');location.href='user_info.asp';</script>")
    else                                                    '������޸Ĺ���Ա
        password=rs("admin_pw")
        dim oldpwd,newpwd,newpwd2
        oldpwd=Request("userpw")
        newpwd=Request("newpw")
        newpwd2=Request("newpw2")
        if Instr(session("juese"),"|306,")<>0 then
		' �ж��Ƿ��ǳ�������Ա�޸ģ�����ֱ���޸ģ������ظ�����ȷ�������޸�
		if not(md5(request("userpw"))=rs("admin_pw") or request("userpw")=rs("admin_pw")) then
			rs("admin_pw")=md5(request("userpw"))			'�ж��Ƿ��޸����룬û����������
		end if
   			if rs("admin_id")<>"admin" then				'�ж��û����Ƿ�Ϊadmin
				if Request.Form("working")=1 then				'�˻��Ƿ����
					rs("working")=1								'��
				else
					rs("working")=0
				end if
			end if
            rs("amwork")=0
            rs("admin_name")=trim(request("name"))            '����
            rs("rank")=Request.Form("y_name")                 'Ȩ��
   			if id <> 1 then
   				rs("juese")=Request.Form("juese") 			  '��ɫ
			end if
            response.write ("<script>alert('�û��޸ĳɹ���');location.href='user_info.asp';</script>")
            rs.update
            response.end
        else                                                '�����ǳ�������Ա
            if newpwd=newpwd2 then                          '�ж��������������Ƿ�һ��
                if oldpwd=password or md5(oldpwd)=password then     '���һ�£����ж������Ƿ����������ͬ
                    if newpwd="" and newpwd2="" then                       '���������Ϊ�գ����޸�����
                       if trim(request("name"))=rs("admin_name") then
                            response.write "<script language=javascript>alert('������Ϣ��δ�޸ģ��뷵��������д��');location='xg_user.asp?id="&rs("id")&"&qx="&rs("id")&"'</script>"
                           response.end
                        end if
                        rs("admin_name")=trim(request("name"))  '�޸�����
                        rs.update                               '��ӵ����ݿ�
                        response.write "<script language=javascript>alert('�û���Ϣ�޸ĳɹ�!');location='user_info.asp'</script>"
                        response.end
                    else
                        rs("admin_pw")=md5(newpwd)              '�޸�����
                        rs("admin_name")=trim(request("name"))  '�޸�����
                        rs.update                               '��ӵ����ݿ�
                        session("web_admin")=""
                        response.write "<script language=javascript>alert('�����޸ĳɹ�!');location='user_info.asp'</script>"
                        response.end
                    end if
                else
                    response.write "<script language=javascript>alert('����������󣬷����������룡');location='xg_user.asp?id="&rs("id")&"&qx="&rs("id")&"'</script>"
                    response.end
                end if
            else
                response.write "<script language=javascript>alert('�������������벻һ�£��뷵���������룡');location='xg_user.asp?id="&rs("id")&"&qx="&rs("id")&"'</script>"
                response.end
            end if 
        end if
    end if
else%>

<!--#include file="../inc/quanxian.asp"-->
	   
<%end if%>