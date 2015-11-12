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
<script type="text/javascript">
function sendEmail() {
	document.tel.action="Telephone_Email_proc.jsp";
	document.tel.submit();
} 
</script>
<body>
<b>Telephone_Message</b>_<a style="font-size:11px; color:red; text-decoration:none;" href="javaScript:document.tel.submit()" title="추가">SiteOnly</a>
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
		<div id="send" style="text-align:center; margin-top:5px;">
			<select id="MailSender" name="MailSender" style="border:0px;cursor:pointer;">
				<option value="call@k-gmp.com">--From--</option>
				<option value="christine.kim@k-gmp.com">김효진</option>
				<option value="it@k-gmp.com">최현익</option>
				<option value="fda@k-gmp.com">박진주</option>
				<option value="info@k-gmp.com">박도현</option>
			</select>
		</div>
	</form>
	<div id="btn_send" style="text-align:center;margin-left:190px; margin-top:-20px;">
		<input type="button" id="sendEm" name="sendEm" value="_Email&Site" style="margin-top:3px;margin-right:30px; background-color:white;border:0px;color:#0000cd; cursor:pointer;" onclick="sendEmail()"/>
	</div>
</body>
</html>