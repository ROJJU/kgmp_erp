<%@ page language="java" contentType="text/html; charset=euc-kr" pageEncoding="euc-kr"%>
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
		document.tel.action="Telephone_Email.jsp";
		document.tel.submit();
	}
</script>
<body>
<b>Telephone_Message</b>_<a style="font-size:11px; color:red; text-decoration:none;" href="javaScript:document.tel.submit()" title="�߰�">Add</a>
<hr>
	<form action="sendmmail.jsp" name="tel" method="post">
		<div id="wrap" style="margin:0 auto; width:250px;">
			<table style="border:1px solid black; font-size:11px;">
				<tr><td><font color="red">*</font> ��ȣ/����</td><td><input type="text" name="company"></td></tr>
				<tr><td><font color="red">*</font> ��ȭ��ȣ</td><td><input type="text" style="width:47px;" name="phone1"> - <input type="text" style="width:47px;" name="phone2"> - <input type="text" style="width:47px;" name="phone3"></td></tr>
				<tr><td><font color="red">*</font> ã�»��</td><td><input type="text" name="to_kgmp"></td></tr>
				<tr>
					<td>
						<font color="red">*</font> ����</td><td><textarea style="width:167px;" name="content"></textarea>
						<input type="hidden" name="writer" value="${member_name}">
						<input type="hidden" name="add_date" value="<%=nowDay%>">
					</td>
				</tr>
			</table>
		</div>
		<div id="send">
		
			<select id ="MailSender" name="MailSender">
				<option value="it@k-gmp.com">--�����»��--</option>
				<option value="christine.kim@k-gmp.com">��ȿ��</option>
				<option value="biz@k-gmp.com">��ȿ��</option>
				<option value="it@k-gmp.com">������</option>
				<option value="it@k-gmp.com">������</option>
				
			</select>
			<select id ="MailReceiver" name="MailReceiver">
				<option value="it@k-gmp.com">--�޴»��--</option>
				<option value="christine.kim@k-gmp.com">��ȿ��</option>
				<option value="it@k-gmp.com">������</option>
				<option value="biz@k-gmp.com">��ȿ��</option>
				<option value="biz@k-gmp.com">������</option>
				
			</select>
		</div>
	</form>
	<input type="button" id="sendEm" name="sendEm" value="SEND" onclick="sendEmail()"/>	
<hr>
</body>
</html>