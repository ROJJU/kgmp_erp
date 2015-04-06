<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="ct_db" class="kgmp.common.dao.member_join_dao" scope="session" />
<jsp:useBean id="member" class="kgmp.common.beans.Member"></jsp:useBean>
<jsp:setProperty property="*" name="member"/>
<center>
<form action="IDCheck.jsp" method="get">
	ID: <input type="text" name="id" value="<%=member.getId()%>" id="txt_id"> 
	<input type="submit" value="중복확인"><br>
</form>
<script src="../report/js/jquery-1.9.1.js"></script>
<script>
$(function(){
	<%
	if(ct_db.isCustomer(member)){
		%>
		$("#txt_result").html("아이디가 중복 됩니다. <br>다른 아이디를 사용해주세요.");
		<%
	}else{
		%>
		$("#txt_result").html("사용 가능한 아이디 입니다. <button id='btn_exit'>아이디 사용</button>");
		<%
	}
	%>
	
	$("#btn_exit").bind("click",function(){
		window.opener.document.forms[0].id.value = $("#txt_id").val();
		window.opener.document.forms[0].check_pw.value = $("#txt_id").val();
		window.close();
	});
});
</script>
<label id="txt_result"></label>
</center>