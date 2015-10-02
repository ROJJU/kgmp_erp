<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Telephone, java.util.Map, java.util.*, java.text.*" %>
<jsp:useBean id="tel_dao" class="kgmp.common.dao.Telephone_dao" scope="session"></jsp:useBean>
<%
//선택 출력
int tel_seq = Integer.parseInt(request.getParameter("tel_seq"));
pageContext.setAttribute("t", tel_dao.getTelephone(tel_seq));
//날자 연산
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
	document.tel.action="Telephone_Modify_Email_proc.jsp";
	document.tel.submit();
} 
</script>
<body>
<b>Telephone_Message</b>_<a style="font-size:11px; color:red; text-decoration:none;" href="javaScript:document.tel.submit()" title="추가">Modify</a>_No.<font color="red">${t.telephone_seq}</font>
<hr>
	<form action="Telephone_modify_proc.jsp" name="tel" method="post">
		<div id="wrap" style="margin:0 auto; width:250px;">
			<table style="border:1px solid black; font-size:11px;">
				<tr title="${t.company}"><td><font color="red">*</font> 상호/성명</td><td><input type="text" name="company" value="${t.company}"></td></tr>
				<tr title="${t.phone1}-${t.phone2}-${t.phone3}"><td><font color="red">*</font> 전화번호</td><td align="center"><input type="text" style="width:47px;" name="phone1" value="${t.phone1}"> - <input type="text" style="width:47px;" name="phone2" value="${t.phone2}"> - <input type="text" style="width:47px;" name="phone3" value="${t.phone3}"></td></tr>
				<tr title="${t.to_kgmp}"><td><font color="red">*</font> 찾는사람</td><td><input type="text" name="to_kgmp" value="${t.to_kgmp}"></td></tr>
				<tr title="${t.content}">
					<td>
						<font color="red">*</font> 내용</td><td align="center"><textarea style="width:167px;" name="content" >${t.content}</textarea>
						<input type="hidden" name="writer" value="${member_name}">
						<input type="hidden" name="add_date" value="<%=nowDay%>">
						<input type="hidden" name="telephone_seq" value="<%=tel_seq %>">
					</td>
				</tr>
			</table>
		</div>
	<div id="send" style="text-align:center; margin-top:5px;">
			<select id="MailSender" name="MailSender" style="border:0px;cursor:pointer;">
				<option value="call@k-gmp.com">--From--</option>
				<option value="christine.kim@k-gmp.com">김효진</option>
				<option value="biz@k-gmp.com">이효은</option>
				<option value="it@k-gmp.com">최현익</option>
				<option value="fda@k-gmp.com">박진주</option>
			</select>
		</div>
	</form>
	<div id="btn_send" style="text-align:center;margin-left:190px; margin-top:-20px;">
		<input type="button" id="sendEm" name="sendEm" value="_Email&Site" style="margin-top:3px;margin-right:30px; background-color:white;border:0px;color:#0000cd; cursor:pointer;" onclick="sendEmail()"/>
	</div>
</body>
</html>