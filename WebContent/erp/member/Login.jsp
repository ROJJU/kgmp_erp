<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="http://www.k-gmp.co.kr/favicon.ico"/>
 <link rel="stylesheet" type="text/css" href="css/Login.css"/>
<title>K-GMP</title>
<script type="text/javascript">
function popupJoin(){
	window.open("Join.jsp","join","width=650px, height=480px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
}
function goUrl(url){
	location.href=url;
} 
</script>
</head>
<body>
	<div id = "header">
		<div id ="logo" align="center"><br><br><br><br><input type = "image" src="img/logo.gif" width="300px" onclick = "goUrl('http://www.k-gmp.co.kr/main/index.php?PHPSESSID=149675fe1939d3bc9d3805c45beee0df')"></div>
	</div>
	<div id ="container">
		<div id = "content" align="center">
			<hr width="350px"/><br>
			<form action="Login_proc.jsp" method="post" >
				<input type="text" name="id" maxlength="25" placeholder="&nbsp;Uername" style="background:#fff; padding:10px; width:330px;" ><br>		
				<input type="password" name="pw" maxlength="25" placeholder="&nbsp;Password" style="background:#fff; padding:10px; width:330px;" onKeypress="javascript:if(event.keyCode==13) {document.forms[0].submit()}"><br><br>
			</form>
			<input type="image" src="img/Sign_in.png" width="350px" onclick= "document.forms[0].submit();"><br><br>
			<hr width="350px"/><br>
			<span class="font">Forgot your <a href="#" class="font">Username</a> or <a href="#" class="font">Password</a>?</span>
			<span class="font" style="margin:0 4px;">| &nbsp;<a href="javascript:popupJoin();" class="font">Sign up</a> </span>
			<br><br><br>
		</div>
	</div>
	<div id = "footer"></div>
</body>
</html>