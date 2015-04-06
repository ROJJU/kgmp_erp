<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="java.util.*, java.text.*" %>
<%
Calendar cal=Calendar.getInstance();
SimpleDateFormat Time = new SimpleDateFormat("HH:mm");
String nowTime = Time.format(cal.getTime());
int nowM = cal.get(Calendar.MONTH)+1; // +1
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Message</title>
<style type="text/css">
	#header{position:relatice; background-color:#1380D3; height:35px; color:#ffffff; }
	body{margin:0 auto; font-family:맑은 돋움; font-size:12px;}
	table{margin:0 auto; width:440px;}
	input, img, input.type-image{/* border: 0 none; */ vertical-align:middle;}
</style>
<script type="text/javascript">
//바이트 채크
	function displayBytes( sz, id )
	{
	    var form= document.msg;
	    var obj = document.getElementById( id );
	    if (obj.value.bytes() > sz)
	    { //80바이트를 넘기면
	        if (event.keyCode != '8') //백스페이스는 지우기작업시 바이트 체크하지 않기 위해서
	        {
	            alert( sz+'바이트까지 입력이 가능합니다.');
	        }
	        obj.value = obj.value.substring(0, obj.value.length-1);
	    }
	    eval('document.all.'+id+'_bytes').innerHTML = eval('form.'+id).value.bytes()+" / 500 Byte(S)";
	}
	String.prototype.bytes = function()
	{
	    var str = this;
	    var l = 0;
	    for (var i=0; i<str.length; i++) l += (str.charCodeAt(i) > 128) ? 2 : 1;
	    return l;
	}
	function writeMst(){
		document.msg.focus();
	}
</script>
</head>
<body onload ="writeMst()">
	<form name="msg" action="Message_add_proc.jsp" method="post">
		<table>
			<tr id="header"><td>&nbsp;&nbsp;<input type="image" src="images/memo_icon1.gif">ㅣ<b>쪽지 보내기</b></td></tr>
			<tr height="80px;" >
				<td style="border-bottom:dotted 1px grey;">
					&nbsp;&nbsp;<img src="images/memo_icon3.gif" style="margin:0; padding:0;vertical-align:middle; ">
					&nbsp;받는사람 : <input type="text" style="width:200px; margin:0px; padding:1px; border:1px solid grey;  vertical-align:middle; background:#f4f4f4;" name="send0" value="<%=request.getParameter("id")%>">
	 			</td>
			</tr>
			<tr height="30px;"><td><b>쪽지내용</b></td></tr>
			<tr>
				<td align="center">
					<input type="hidden" value="<%=nowM %>" name="month">
					<input type="hidden" value="${member_name}" name="writer">
					<input type="hidden" value="${member_id}" name="writer_id">
					<input type="hidden" value="<%=nowTime%>" name="add_time">
					<textarea rows="15" cols="50" id='chk1' name='content' onkeyup='javascript_:displayBytes(500,"chk1");'></textarea><br/>
					<div id='chk1_bytes' align="right"><a style="color:grey; text-align:left; font-family:맑은 돋움; font-size:12px;">0/ 500 Byte(S)</a></div>
				</td>
			</tr>
			
		</table>
	</form>
		<table>
			<tr height="30px;">
				<td align="right">
					<input type="image" src="images/msg_send.png" width="40px" onclick="javaScript:document.msg.submit();"/>
					<input type="image" src="images/exit.png" width="40px" onclick="javaScript:window.close();"/>
				</td>
			</tr>
		</table>
</body>
</html>