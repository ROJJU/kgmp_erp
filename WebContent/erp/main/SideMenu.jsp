<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*, kgmp.common.beans.Telephone, kgmp.common.beans.Schedule"  %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="dl_DAO" class="kgmp.common.dao.Dl_dao" scope="session"/>
<jsp:useBean id="tel_dao" class="kgmp.common.dao.Telephone_dao" scope="session"/>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao" scope="session"/>
<%
/*id 받아오기*/
String id=(String)session.getAttribute("member_id");
/*이름 받아오기*/
String writer = (String)session.getAttribute("member_name");
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
//통화기록부 출력
List<Telephone> list_tel = tel_dao.getSideTelephone(writer);
pageContext.setAttribute("list_tel", list_tel);
//오늘 일정 출력
List<Schedule> list_sche =schedule_dao.getSideSchedule(writer, Year, Month, Day);
pageContext.setAttribute("list_sche", list_sche);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
	function popUpTelephoneAdd(){
		window.open("/kgmp/erp/report/Telephone_add.jsp","tAdd","width=400px, height=220px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");		
	}
	function popUpMemoRead(){
		window.open("/kgmp/erp/main/MemoRead.jsp","mRead","width=200px, height=220px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");		
	}
	function popupTodayAdd(year, month, day){
		   window.open("/kgmp/erp/schedule/ScheduleAdd.jsp?year="+year+"&month="+month+"&day="+day,"todayAdd","width=520px, height=340px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
	}
	function popupTelModify(tel_seq){
		window.open("/kgmp/erp/report/Telephone_modify.jsp?tel_seq="+tel_seq,"tModify","width=400px, height=220px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
	}
	
//접속 확인
var xhr = null;
var data = null;
function getXMLHttpRequest(){
    if (window.ActiveXObject) {
        try {
            return new ActiveXObject("Msxml2.XMLHTTP");//IE 상위 버젼
        } catch (e1) {
            try {
                return new ActiveXObject("Microsoft.XMLHTTP");//IE 하위 버젼
            } catch (e2) {
                return null;
            }
        }
    } else if (window.XMLHttpRequest) {
        return new XMLHttpRequest();//IE 이외의 브라우저(FireFox 등)
    } else {
        return null;
    }
}// XMLHttpRequest 객체 얻기
 
function requestHello() {
    URL = "/kgmp/erp/member/ajax_user.jsp"
    xhr = getXMLHttpRequest();//XMLHttpRequest 객체 얻기
    xhr.open("GET", URL, true);//연결
    xhr.onreadystatechange = function () {//콜백 함수  등록
        if (xhr.readyState == 4) {//완료
            if (xhr.status == 200) {//오류없이 OK
                var str = xhr.responseText;//서버에서 보낸 내용 받기
                document.getElementById("member").innerHTML = str;//보여주기    
            } else {
               // alert("Fail : " + xhr.status);알수 없는 오류로 주석 처리
            }
        }
    }// 응답
    xhr.send(null);//전송
    
}// 서버에 요청
 


//메시지 상태 확인
function getData(){
    URL = "/kgmp/erp/main/Message_check_proc.jsp"
   	data = getXMLHttpRequest();//XMLHttpRequest 객체 얻기
	data.open("GET", URL, true);
	data.onreadystatechange = function() {//콜백 함수  등록
	    if (data.readyState == 4) {//완료
	        if (data.status == 200) {//오류없이 OK
	            var str = data.responseText;//서버에서 보낸 내용 받기
	           if(str==1){
	        	   document.getElementById("myDiv").innerHTML = "New !";//보여주기 
	        	   window.open("/kgmp/erp/main/MessageCheck.jsp","mRead","width=450px, height=277px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
	        	   }else{
        		   document.getElementById("myDiv").innerHTML =" ";
	        	   }
	        } else {
	            //alert("Fail : " + data.status);알수 없는 오류로 주석 처리
	        }
	    }
	}// 응답
	data.send(null);		
}
//db 변경
setInterval(" requestHello()", 1000);
setInterval("getData()", 4000);
	</script>
	</head>
<body>
	<div id="side" style="float:left;">
		<div id="side_wrap">
			<br>
				<table class="side" width="190px">
					<tr style="background-color:grey; color:#ffffff;"><td colspan="3"><b><a style="color:red;">*&nbsp;</a>사용자정보</b></td></tr>
					<tr>
						<td rowspan="3"><img src="/save/${member_pic}" width=60px;/></td>
						<td align="center" colspan="2"><b>[${member_level}]</b> ${member_name}</td>
					</tr>
					<tr><td class="side_font"><b>ㆍ보직</b></td><td align="center" width="53px">${member_department}</td></tr>
					<tr>
						<td class="side_font" width="50px"><b>ㆍ출/퇴근</b></td>
						<c:if test="${state.state==null||state.state==' '}">
							<td align="center" title="아직 출근 등록을 하지 않으셨습니다!!"><b style="color:red; font-size:9px;">- 미출근 -</b></td>
						</c:if>
						<c:if test="${state.state=='0'}">
							<td align="center" title="출근 등록이 완료 되었습니다 (<%=nowYear%>.<%=nowMonth%>.<%=nowDay%>)"><b style="color:blue; font-size:9px;">- 근무중 -</b></td>
						</c:if>
						<c:if test="${state.state=='1'}">
							<td align="center" title="수고하셨습니다 (<%=nowYear%>.<%=nowMonth%>.<%=nowDay%>)"><b>- 퇴근 -</b></td>
						</c:if>
						<c:if test="${state.state=='2'||state.state=='3'}">
							<td align="center" title="수고하셨습니다 (<%=nowYear%>.<%=nowMonth%>.<%=nowDay%>)"><b>- 출장 -</b></td>
						</c:if>
						<c:if test="${state.state=='4'||state.state=='5'}">
							<td align="center" title="수고하셨습니다 (<%=nowYear%>.<%=nowMonth%>.<%=nowDay%>)"><b>- 외근 -</b></td>
						</c:if>
						<c:if test="${state.state=='6'||state.state=='7'}">
							<td align="center" title="수고하셨습니다 (<%=nowYear%>.<%=nowMonth%>.<%=nowDay%>)"><b>- 기타 -</b></td>
						</c:if>
					</tr>
				</table><br>
				<table class="side" width="190px">
					<tr style="background-color:grey; color:#ffffff;"><td><b onclick="goUrl('/kgmp/erp/report/Telephone_view.jsp')" style="cursor:hand; cursor:pointer;" title="통화기록 페이지로 이동"><a style="color:red;">*&nbsp;</a>통화기록부</b></td><td align="right"><a class="change" href="javascript:popUpTelephoneAdd();" style="text-decoration:none; color:#ffffff;" title="통화기록 추가">+</a></td></tr>
					<tr>
						<td colspan="2">
							<form action="../report/Telephone_view.jsp" method="post" name="tel">
								<input type="text" style="width:120px; border:none;" name="find">
								<input type="hidden" value="all" name="search">&nbsp;
								<a href="javaScript:document.tel.submit()"><font color="blue"> Search</font></a>
							</form>
						</td>
					</tr>
					<c:if test="${list_tel=='[]'}"><tr><td align="center" style="color:red;" colspan="2">통화기록이 없습니다.</td></tr></c:if>
					<c:forEach var="a" items="${list_tel}">
						<tr class="a" onclick="popupTelModify(${a.telephone_seq});" title="${a.company}">
							<td width="100px">
								<div class="sideTel" style="float: left;"><a class="hover">${a.company}</a></div>
								<c:if test="${a.check_date==now}">&nbsp;<img src="/kgmp/erp/main/images/ico_new.gif" width=10px;></c:if>
							</td>
							<td width="10px" style="color:red;" title="No.${a.telephone_seq}"><div class="sideTelNum">No.${a.telephone_seq}</div></td>
						</tr>
					</c:forEach>
				</table>
				<br><br>
				<table class="side" width="190px">
					<tr style="background-color:grey; color:#ffffff;"><td><b onclick="goUrl('/kgmp/erp/schedule/ScheduleView.jsp')" style="cursor:hand; cursor:pointer;" title="스케줄 페이지로 이동"><a style="color:red;">*&nbsp;</a>오늘일정</b>(<%=nowYear%>.<%=nowMonth%>.<%=nowDay%>)</td><td align="right"><a class="change" href="javascript:popupTodayAdd(<%=nowYear%>, <%=nowMonth%>, <%=nowDay%>);" style="text-decoration:none; color:#ffffff;" title="스케줄 추가">&nbsp;+</a></td></tr>
				<c:forEach var="b" items="${list_sche}">
					<tr class="a"><td colspan="2"><a class="hover">▶ ${b.title}</a>&nbsp;<img src="/kgmp/erp/main/images/tuzki10_jar821.gif" width="10px"></td></tr>
				</c:forEach>
				<c:if test="${list_sche=='[]'}"><tr><td colspan="2">금일 일정은 없습니다..</td></tr></c:if>
				</table><br>
				<form name="f"></form>
				<table class="side" width="190px">
						<tr style="background-color:grey; color:#ffffff;"><td colspan="2"><b><a style="color:red;">*&nbsp;</a>Message</b></td></tr>
						<tr><td><div style="overflow:scroll; background-color:#ffffff; height:90px; width:175px; font-size:10px;"id="member">&nbsp;Lodding..</div></td></tr>
				</table>
		</div>
	</div>
</body>
</html>