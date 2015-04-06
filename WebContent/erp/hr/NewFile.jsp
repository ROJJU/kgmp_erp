<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title></title>
    <script type="text/javascript" language="javascript">
        function trim(str){    
        	var pattern = new RegExp(/^[0-9]{4}/);
        	return pattern.test(str);
        }
 
        function clickTrim(){
            var str = document.getElementById("txtInput").value;
            if(trim(str)){
            	alert('hi');
            }else{
            	alert('bye');
            }
        }
 
    </script>
</head>
<body>
    <input type="text" id="txtInput" />
    <br>
    <input type="button" value="trim()" onclick="clickTrim()"> : 공백 제거" </br>
    <input type="text" id="txtTrim" />
</body>
</html>
