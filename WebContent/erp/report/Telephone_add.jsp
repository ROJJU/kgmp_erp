<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%
Calendar cal=Calendar.getInstance();
SimpleDateFormat year = new SimpleDateFormat("yyyy-MM-dd [HH:mm]");
String nowDay = year.format(cal.getTime());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<b>Telephone_Message</b>_<a style="font-size:11px; color:red; text-decoration:none;" href="javaScript:document.tel.submit()" title="추가">Add</a>
<hr>
	<form action="Telephone_add_proc.jsp" name="tel" method="post">
		<div id="wrap" style="margin:0 auto; width:250px;">
			<table style="border:1px solid black; font-size:11px;">
				<tr><td><font color="red">*</font> 상호/성명</td><td><input type="text" name="company"></td></tr>
				<tr><td><font color="red">*</font> 전화번호</td><td><input type="text" style="width:47px;" name="phone1"> - <input type="text" style="width:47px;" name="phone2"> - <input type="text" style="width:47px;" name="phone3"></td></tr>
				<tr><td><font color="red">*</font> 찾는사람</td><td><input type="text" name="to_kgmp"></td></tr>
				<tr>
					<td>
						<font color="red">*</font> 내용</td><td><textarea style="width:167px;" name="content"></textarea>
						<input type="hidden" name="writer" value="${member_name}">
						<input type="hidden" name="add_date" value="<%=nowDay%>">
					</td>
				</tr>
			</table>
		</div>
	</form>
<hr>
</body>
</html>