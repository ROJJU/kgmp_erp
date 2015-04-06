<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao" scope="session"/>
<%
/*이름 받아오기*/
String writer = (String)session.getAttribute("member_id");
//msg 개수 출력
int countMsg = msg_dao.countGetMsg(writer);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function goUrl(url){
	location.href=url;
}
function popupMenu(){
	window.open("/kgmp/erp/main/MessageView.jsp","msg","width=650px, height=650px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
}
function popupCheck(){
	window.open("/kgmp/erp/hr/DL_logic.jsp","check","width=350px, height=150px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
}
</script>
<style type="text/css">
	.quickBG{background-color:#5D5D5D; color:#ffffff; font-family:맑은 고딕; font-size:12px; padding:5px; margin:2px; width:80px;}
	.quickBG:hover{background-color:blue; cursor:pointer; cursor:hand; }
	#quickPlace{position:absolute; width:105px; height:100%; left:1170px;  border-right-width:2px;
		  border-right-style:solid;
		  border-right-color:grey;}
</style>
</head>
<body>
	<div id="quickPlace" >
		<div class="quick" style="position:absolute; top:100px; left:24px;">
		<div id="work" class="quickBG" onclick="popupCheck()">출/퇴근</div>
		<div id="message" onclick="popupMenu()" class="quickBG" >MSG (<b style="color:red; font-size:9px; text-decoration:blink;" id="myDiv"></b><b style="color:#FFBB00; font-size:9px;"> <%=countMsg%> </b>)</div>
		<div class="quickBG" onclick="goUrl('/kgmp/erp/report/DailyView.jsp')">K-BOX</div>
		</div>
	</div>
</body>
<script type="text/javascript">
var quickBox = $('.quick'); //퀵메뉴 코딩한 div의 클래스 네임 - 자신의 이름에 맞게 수정
var quick_top = 120; // 기준이 되는 높이 값
quickBox.css('top', $(window).height());
$(document).ready(function(){
quickBox.animate( { "top": $(document).scrollTop() + quick_top +"px" },  500 ); //숫자값을 변경하시면 속도변화
 $(window).scroll(function(){
  quickBox.stop();
  quickBox.animate( { "top": $(document).scrollTop() + quick_top + "px" }, 500 ); //숫자값을 변경하시면 속도변화
 });
});
</script>
</html>