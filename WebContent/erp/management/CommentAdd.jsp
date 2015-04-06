<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%
int customer_seq = Integer.parseInt(request.getParameter("customer_seq"));
Calendar cal=Calendar.getInstance();
SimpleDateFormat year = new SimpleDateFormat("yyyy-MM-dd [HH:mm]");
String nowDay = year.format(cal.getTime());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<script type="text/javascript">
	function formcheck(){
		var c_comment = document.c_comment_add.c_comment.value;
		if(c_comment==null||c_comment==" "){
			alert('내용을 입력하세요');
			return false;
		}else{
			document.c_comment_add.submit();
		}
	}
	</script>
</head>
<body>
	<hr>
	<form action="CommentAdd_proc.jsp" method="post" name="c_comment_add">
		<input type="radio" name="color" value="red">red<input type="radio" name="color" value="blue">blue<input type="radio" name="color" value="black">black<a style="margin:0px 0px 0px 133px; font-family:맑은 돋움; font-size:11px;">* 작성자 : [ <input type="text" value="${member_name}" name="member_name" style="width:36px; border:none; font-size:11px;" readonly>]</a><br>
		<textarea rows="10" cols="50" name="c_comment"></textarea><br>
		<a style="color:red">*</a><a style="font-family:맑은 고딕; font-size:12px;">색상 미선택 시 기본값(검정색)이 적용 됩니다.</a>
		<hr>
		<input type="image" src="img/add.png" width="50px" align="right" onclick="formcheck()">
		<input type="hidden" value="<%=nowDay%>" name="add_date">
		<input type="hidden" value="<%=request.getParameter("customer_seq")%>" name="customer_seq">
	</form>
</body>
</html>