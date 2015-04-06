<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.DL, java.util.Map, java.util.*, java.text.*" %>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao" scope="session"/>
<%
//맴버 출력
request.setCharacterEncoding("utf-8");
String find="";
if(request.getParameter("find") != null)
	find= request.getParameter("find");
List<DL> list = dl_DAO.getMembers(find);
pageContext.setAttribute("list", list);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<title>K-GMP</title>
	<script type="text/javascript">
	//채크박스 모두 선택 해제 
	$(document).ready(function(){
		$('#all').click(function(){
			if ($("#all").is(":checked")) { 
			$('input:checkbox[id^=solo]:not(checked)').attr("checked", true); 
			} else { 
			$('input:checkbox[id^=solo]:checked').attr("checked", false); 
			} 
				
		}); 
		
		$("#btn_exit").bind("click",function(){
			//선택 여부 확인(개수 확인)
			var chkbox = document.send.check;
			var cnt=0;
			for(i=0;i<chkbox.length; i++){
				if(chkbox[i].checked)
				cnt++;
			}
			//선택 재한
			if(cnt>5){
				alert('최대 5명 까지 선택 가능합니다.');
				return false;
			}else{
				if(confirm('선택인원을 추가하시겠 습니까 ?')){
					//window.opener.document.daily.send.value=document.getElementsByName("check");
					var fData = document.getElementById("send");
					fData.target="parent";
					fData.action="../report/DailyAdd.jsp";
					fData.submit();
					window.close();
				}
			}
		});
	});
	</script>
	<style type="text/css">
		div.{border:1px solid red;}
		body{background-color:#F6F6F6; margin:0 auto;}
		#body{position:relative; }
		#footer{position:fixed; width:100%; bottom:0px; background-color:#EAEAEA; height:35px; border-top:1px solid grey;}
		#box{position:relative; height:50px;}
		table{border-collapse:collapse; width:400px;}
		td{border:1px solid grey; family-font:맑은돋움; font-size:11px;}
		th{border:1px solid grey; family-font:맑은돋움; font-size:11px; color:#030066; background-color:#D9E5FF; height:20px;}
		input, img, input.type-image{/* border: 0 none; */ vertical-align:middle;}
	</style>
</head>
	<body>
		<div id="wrap">
			<div id="body"><br/>
				<form action="MessageSearch.jsp" method="post" onSubmit="return false" name="find">
					<table align="center">
						<tr><th>빠른검색을 원한다면 해당 항목 설정 후 검색 바랍니다.</th></tr>
							<tr>
								<td align="center" style="background-color:#EAEAEA;"><input type="text" name="find">&nbsp;&nbsp;<input type="image" src="../hr/img/serch.png" width="44px" onclick="javaScript:document.find.submit();"></td>
							</tr>
					</table><br/>
				</form>
				<form method="get" name="send" id="send">
					<table align="center">
						<tr>
							<th><input type="checkbox" id="all"/></th>
							<th>소속부서</th>
							<th>성명</th>
							<th>ID</th>
						</tr>
					<c:forEach var="member" items="${list}">
						<tr>
							<td align="center"><input type="checkbox" value="${member.id}" name="check" id="solo" /></td>
							<td>&nbsp; ${member.department}</td>
							<td>&nbsp; ${member.kor_name}</td>
							<td>&nbsp; ${member.id}</td>
						</tr>
					</c:forEach>
					</table><br>
					<center><img src="../main/images/total_delIcon.gif" width=7px;><a style="color:red; font-size:10px;"> 최대 5명 까지 선택 가능합니다.</a></center>
				</form>
				<div id=box></div>
			</div>
			<div id="footer" align="right">
				<div id=buttons style="padding:7px;">
					<input type="image" src="../hr/img/add.png" width="40px" id="btn_exit"/>
					<input type="image" src="images/exit.png" width="40px" onclick="javaScript:window.close();"/>
				</div>
			</div>
		</div>
	</body>
</html>