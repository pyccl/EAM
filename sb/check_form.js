
//alert('signzip2');
if (document.order.signzip2.value.length>0) 
{
	if ( !isInteger(document.order.signzip2.value) || document.order.signzip2.value.length != 12 ) {
		window.alert('��������ȷ��MAC��ַ!!');
		document.order.signzip2.select();
		document.order.signzip2.focus();
        return false;
	}
}
else
{
	alert('������MAC��ַ!');
	return false;
}
//-->