function chk(){

	/************************************************************************/
	if (document.post.user_id.value==""){
	alert('��¼ID�Ǳ�����д��!');
	document.post.user_id.focus();
	return false;
	}


	/************************************************************************/
	if (document.post.user_pw1.value==""){
	alert('�����Ǳ�����д��! ��');
	document.post.user_pw1.focus();
	return false;
	}
	
	if (document.post.user_pw2.value==""){
	alert('��ȷ������! ��');
	document.post.user_pw2.focus();
	return false;
	}
	
	if (document.post.user_pw1.value!=document.post.user_pw2.value){
		alert('������������벻һ����');
		document.post.user_pw1.focus();
		return false;
		}


	/************************************************************************/

	var name=document.post.user_name.value
	if (document.post.user_name.value==""){
	alert('����д��ʵ������');
	document.post.user_name.focus();
	return false;
	}

	for(i=0;i<=name.length;i++){
		if ((name.substring(i,(i+1))=="1")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="2")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="3")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="4")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="5")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="6")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="7")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="8")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="9")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="0")){
			alert('���зǷ����֣����������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="/")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))==".")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="~")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="`")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="'")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))==";")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))==",")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="!")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="@")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="$")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="%")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="&")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))==" ")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
		if ((name.substring(i,(i+1))=="��")){
			alert('���зǷ��ַ������������룡');
			document.post.user_name.focus();
			return false;		
		}
	}

}