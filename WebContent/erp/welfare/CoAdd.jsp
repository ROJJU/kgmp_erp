<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>K-GMP</title>
<style type="text/css">
	body{background-color:#EAEAEA; margin:0 auto;}
	table{border-collapse:collapse;}
	#header{position: relative; background-color:grey; width:100%; height:20px;}
	#container{position: relative;}
	#contents{border:1px solid grey; margin:0 auto; width:280px; padding:10px;}
	#footer{position: relative; background-color:grey; width:100%; height:20px;}
	.font{font-family:맑은 고딕; font-size:11px;padding:5px;}
	.font2{font-family:맑은 고딕; font-size:12px; color:#ffffff;}
</style>
</head>
<body>
	<div id="header" class="font2">&nbsp;건의하기</div><br>
	<div id="container">
		<div id="contents">
			<table>
				<tr style="border-bottom:#EAEAEA 3px solid;">
					<td class="font" style="background-color:#ffffff;">제목</td>
					<td style="background-color:#ffffff;"><input type="text" style="border:none; border" placeholder="제목입력"></td>
					<td rowspan="2" style="background-color:#5D5D5D; border-left:4px solid #EAEAEA; cursor:pointer; cursor:hand;" class="font2" width="50px" align="center">건의</td>
				</tr>
				<tr>
					<td class="font" style="background-color:#ffffff;">내용</td>
					<td style="background-color:#ffffff;"><textarea style="border:none; border" placeholder="내용입력"></textarea></td>
				</tr>
			</table>
		</div>
	</div>
	<br><div id="footer" class="font2" align="right">K-GMP&nbsp;</div>
</body>
</html>