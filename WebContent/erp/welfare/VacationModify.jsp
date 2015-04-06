<%@ page language="java" contentType="text/html; charset=euc-kr"    pageEncoding="euc-kr"%>
<%@ page import="kgmp.common.beans.Schedule, java.util.*" %>
<jsp:useBean id="schedule_dao" class="kgmp.common.dao.Schedule_dao" scope="session"/>
<jsp:useBean id="member_dao" class="kgmp.common.dao.member_join_dao" scope="session"/>
<%
//Before modify info
int schedule_seq = Integer.parseInt(request.getParameter("schedule_seq"));
Schedule sche= schedule_dao.printSche(schedule_seq);
//for calendar
Calendar cal =Calendar.getInstance(); 
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH)+1; // +1
int nowDay = cal.get(Calendar.DAY_OF_MONTH);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=euc-kr">
<link rel="stylesheet" type="text/css" href="css/Vacation_A.css"/>
<script src="js/jquery-1.9.1.js"></script>
<title>Vacation</title>
<script type="text/javascript">
//byte check!
function displayBytes( sz, id ){
    var form= document.form;
    var obj = document.getElementById( id );
    if (obj.value.bytes() > sz)
    { //if over 80byte, popup message
        if (event.keyCode != '8') //back space logic
        {
            alert( sz+'바이트까지 입력이 가능합니다.');
        }
        obj.value = obj.value.substring(0, obj.value.length-1);
    }
    eval('document.all.'+id+'_bytes').innerHTML = eval('form.'+id).value.bytes()+" / 20 Byte(S)";
}
String.prototype.bytes = function(){
    var str = this;
    var l = 0;
    for (var i=0; i<str.length; i++) l += (str.charCodeAt(i) > 128) ? 2 : 1;
    return l;
}

$(function(){ 
	$("#date_2").bind("change",function(){ /* cal date */
		var year = document.getElementById("syear").value;
		var month = document.getElementById("smonth").value;
		var day = document.getElementById("sday").value;
		var date2 = $("#date_2").val();
		var d1 = new Date(year+"-"+month+"-"+day).getTime();
		var d2 = new Date(date2).getTime();
		if(d1==d2||d1<d2){
		var per = 1000*60*60*24;
		var txt = Math.round(((d2-d1)/per)+1);
		document.getElementById("date_check").value=txt;
		document.getElementById("date_cal").value=txt;
		}else{
			alert('종료일은 시작일보다 작을 수 없습니다.');
		}
	});
});

$(function(){  /* cal half */
	$("#half").bind("click",function(){
		var test = $("#half").val();
		var txt1 = Number($("#date_check").val());
		if(test=="hi"){
			if(confirm('[반차] 적용을 취소 하시겠습니까?')){
			var test11 = txt1+0.5;
			document.getElementById("date_cal").value=test11;
			$("#half").val("ture");
			}
		}else{
			if(confirm('[반차] 적용 하시겠습니까?')){
				var test11 = txt1-0.5;
				document.getElementById("date_cal").value=test11;
			$("#half").val("hi");
			}
		}
	});
});

function select_onload(){
	for ( i=<%=nowYear%>;i<=<%=nowYear+10%> ; i++){
        var op= new Option(i+ "년",i);
         syear.options[i -<%=nowYear%>]=op; 
         if(i== <%=sche.getYear()%> ){
            syear.options[i -<%=nowYear%>].selected ="selected" ;
         }
   }
     for ( i=1;i<=12 ; i++){
        var op= new Option(i+ "월",i);
         smonth.options[i -1]=op;
         if(i== <%=sche.getMonth()%>){
             smonth.options[i -1].selected = "selected";
         }
     }
     for ( i=1;i<=31 ; i++){
         var op= new Option(i+ "일",i);
          sday.options[i -1]=op;
          if(i== <%=sche.getDay()%>){
              sday.options[i -1].selected = "selected";
          }
      }
 }
</script>
</head>
<body onload ="select_onload()">
	<div id="hearder"><a style="padding:20px; font-size:25px;">Vacation</a><div id="writer">작성자 : 김 찬홍</div></div>
	<div id="body"><br/>
		<form name="form" action="Vacation_modify_proc.jsp" method="post">
			<table>
				<tr>
					<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;날자</th>
					<td>
						<select id ="syear" name="year" ><option ></option ></select >
					    <select   id="smonth" name="month"><option ></option ></select >
					    <select   id="sday" name="day"><option ></option ></select >
						<a>~</a><input type="date" id="date_2" name="date2" value="<%=sche.getDate2()%>"> 
						<input type="text" value="<%=sche.getDate_cal() %>" id="date_cal" style="background:none; text-align:center; width:20px;" name="date_cal">일
						<input type="hidden"  id="date_check" name="date_check" value="<%=sche.getDate_check()%>">
					</td>
				</tr>
				<tr>
					<th><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;휴가명</th>
					<td >
						<input type="text" name="title" value="<%=sche.getTitle()%>"><input type="checkbox" id="half" value="true"> 반차
						<input type="hidden" name="add_date" value="<%=nowYear%>년 <%=nowMonth%>월 <%=nowDay%>일">
						<input type="hidden" name="schedule_seq" value="<%=schedule_seq%>">
					</td>
				</tr>
				<tr>
					<th ><a style="color:red;">&nbsp;*&nbsp;</a>&nbsp;상세일정</th>
					<td ><textarea cols="45" id='chk1' name='content'  onkeyup='javascript_:displayBytes(20,"chk1");'><%=sche.getContent()%></textarea><br/><div id='chk1_bytes' style="text-align:right;"><a style="color:grey; font-family:맑은 돋움; font-size:12px;">0/ 20 Byte(S)</a></div></td>
				</tr>
			</table><br/>
		</form>
		<center><a style="color:red; font-size:11px;">적요는 짧고 명확하게 작성해 주십시오.</a></center>
		<center><a style="color:red; font-size:11px;">휴가 신청 시 주말이 있는경우, 나누어서 신청 바랍니다.</a></center>
	</div>
	<div id="footer" align="right">
		<div id="buttons" style="padding:5px;">
			<input type="image" src="../hr/img/add.png" width="40px" onclick="document.form.submit();"/>
			<input type="image" src="../main/images/exit.png" width="40px" onclick="javaScript:window.close();"/>
		</div>
	</div>
</body>
</html>