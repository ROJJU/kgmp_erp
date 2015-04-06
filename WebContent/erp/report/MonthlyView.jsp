<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
		<style type="text/css">
			div.{border:solid 1px red;}
			#titlePlace{position:relative; height:110px;}
			#pageTitle{position:relative; top: 30px; left:50px; width:500px; border-top:1px solid #C0C0C0; border-bottom:1px solid #C0C0C0; background-color:#EAEAEA; padding:3px;}
			#bottons{position:relative; left:370px; width:100px;}
			#enter{position:absolute; top:0px; left:235px;}
			#serch{position:relative; left:0px; top:100xp; width:240px;}
		</style>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
		<div id="container">
		
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Monthly Report</b></div>
				</div>
				<div id = "tablePlace">
					<center>
						[월간업무보고]<br>
						<h1 style="font-family:맑은고딕;">죄송합니다.. 개발 중입니다...</h1><br>
						<img src="../main/images/gong.png" width="300px">
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>