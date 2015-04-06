<%@page import="com.sun.javafx.scene.accessibility.Attribute"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Member" %>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
String id=(String)session.getAttribute("member_id");
String member_sign=member_dao.printSign(id);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/Hr_A.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <script type="text/javascript">
	    function isMember_sign(member_sign){
	    	var pattern = new RegExp(/^[^ㄱ-ㅣ가-힣]+$/);
	    	return pattern.test(member_sign);
	    }
	    function formCheck(){
		    var member_sign = document.Hr.member_sign.value;
		    if(!isMember_sign(member_sign)){
				alert('파일명에 한글이 포함되어 있거나 선택하지 않으셨습니다.');
				return false;
			}
		    if(confirm('저장 하시겠습니까?'))
				document.Hr.submit();
	    }
	    </script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/SideMenu.jsp"/>
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Personnel</b></div>
				</div>
				<div id = "tablePlaceA">
					<table width="740px">
						<tr>
							<td><font color="red">* </font>개인 서명 관리</td>
						</tr>
						<tr>
							<td>
							<form action="Hr_add_proc.jsp" method="post" name="Hr" enctype="multipart/form-data">
								<table width="260px">
									<tr>
										<td height="80px" align="center" colspan="2">
											<%if(member_sign==null||member_sign=="-"){%>
												<font color="red">사용하실 서명이<br> 없습니다.<br>서명을 등록해 주세요.</font><br>
											<%}else{%>
												<b>등록된 서명 :</b> <br><br><img src="/save/Member_Sign/<%=member_sign%>" width="80px"><br><br>
											<%}%>
										</td>
									</tr>
									<tr>
										<td>
											<input type="file" name="member_sign">
											<input type="hidden" name="old_file" value="<%=member_sign%>">
											<input type="hidden" value="${member_id}" name="id">
										</td>
										<td>
										<%if(member_sign==null||member_sign=="-"){%>
											<input type="button" value="등록" onclick="formCheck()">
										<%}else{%>
											<input type="button" value="수정" onclick="formCheck()">
										<%}%>
										</td>
									</tr>
								</table>
							</form>
							</td>
						</tr>
					</table>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>