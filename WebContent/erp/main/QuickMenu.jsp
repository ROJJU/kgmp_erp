<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.util.*, java.text.*, kgmp.common.beans.Telephone, kgmp.common.beans.Schedule"  %>
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao" scope="session"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao" scope="session"/>
<%
/*이름 받아오기*/
String writer = (String)session.getAttribute("member_id");
//msg 개수 출력
int countMsg = msg_dao.countGetMsg(writer);

/*id 받아오기*/
String id=(String)session.getAttribute("member_id");

/*설정_오늘날자*/
Calendar cal =Calendar.getInstance();
SimpleDateFormat now = new SimpleDateFormat("yy/MM/dd");
String getNow= now.format(cal.getTime());
pageContext.setAttribute("now", getNow);
SimpleDateFormat year = new SimpleDateFormat("yyyy");
SimpleDateFormat month = new SimpleDateFormat("MM");
SimpleDateFormat day = new SimpleDateFormat("dd");
String nowYear= year.format(cal.getTime());
String nowMonth= month.format(cal.getTime());
String nowDay = day.format(cal.getTime());
int Year = cal.get(Calendar.YEAR);
int Month = cal.get(Calendar.MONTH)+1; // +1
int Day = cal.get(Calendar.DAY_OF_MONTH);

/*state check*/
pageContext.setAttribute("state", dl_DAO.getState(id, nowYear, nowMonth, nowDay));
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		<c:choose>
			<c:when test="${state.state==null||state.state==' '}">
				<div id="work" class="quickBG" onclick="popupCheck()" style="border-bottom:3px solid blue;">출근&nbsp;<img src="/kgmp/erp/hr/img/hi.gif" width="25px"></div>
			</c:when>
			<c:otherwise>
				<div id="work" class="quickBG" onclick="popupCheck2()" style="border-bottom:3px solid red;">퇴근&nbsp;<img src="/kgmp/erp/hr/img/bye.gif" width="30px"></div>
			</c:otherwise>
		</c:choose>
		<br>
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
function popupCheck2(){
	var con_test =confirm('정말 퇴근 처리 하시겠습니까?')
	if(con_test ==true){
		window.open("/kgmp/erp/hr/DL_logic.jsp","check","width=350px, height=150px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
	}else if(con_test==false){
		alert("취소하였습니다.");
	}
	
}

</script>
</html>