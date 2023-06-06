function checkAll() {
		
  var code_Values = document.getElementsByTagName("input");  
  
  for (i = 0; i < code_Values.length; i++) { 

    if (code_Values[i].type == "checkbox") {  
  
      code_Values[i].checked = true;  
  
    }  
  }  
}   

function uncheckAll() {
	
  var code_Values = document.getElementsByTagName("input");  
  for (i = 0; i < code_Values.length; i++) {  
	  
	  
  if (code_Values[i].type == "checkbox") {  
    code_Values[i].checked = false;  
  }  
}  
} 