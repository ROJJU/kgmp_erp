<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import=" java.util.*" %>
<%
//setting calendar
Calendar cal =Calendar.getInstance(); 
int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH)+1; // +1
int nowDay = cal.get(Calendar.DAY_OF_MONTH);

//last day of month
GregorianCalendar today = new GregorianCalendar ();
today.set(nowYear, nowMonth-1, nowDay);
int maxday = today.getActualMaximum ((today.DAY_OF_MONTH ));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
        <script type="text/javascript" src="js/TimeCircles.js"></script>
        <link rel="stylesheet" href="css/TimeCircles.css" />
        <link rel="stylesheet" href="css/DL_check.css" />
        <script type="text/javascript">
        function popupCheck(){
        	window.open("/kgmp/erp/hr/DL_logic.jsp","check","width=350px, height=150px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
        }
        function popupEtc(){
        	window.open("DL_etc_add.jsp","etc","width=600px, height=450px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
        }
        </script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
			<jsp:include page="../main/QuickMenu.jsp"/>
			<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="pageTitle"><b>Diligence and Laziness</b></div>
				</div>
				<div id = "DLTable">
					<center>
						<div id="workBlank">
							<div style="padding: 10px;" >
				                TODAY : <input type="date" id="date" readonly>
				            </div>
							<div id="DateCountdown" data-date="<%=nowYear%>-<%=nowMonth%>-<%=maxday%> 23:00:00" style="width: 500px; height: 125px; padding: 0px; box-sizing: border-box; background-color: #E0E8EF"></div>
				            <br/><br/><hr width="500px"><br/><br/>
						</div>
						<div id="workBox" align="center">
							<div id="blankBox"></div>
							<div id ="goLeave"><br><h1><a href="javaScript:popupCheck();">WORK / LEAVE</a></h1></div><br>
							<div id ="ViewList">
								<input type="image" src="img/etc_add.png" width="200px" onclick="popupEtc()">
								<input type="image" src="img/goList.png" width="200px" onclick="goUrl('DLView.jsp')">
							</div><br>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
		 <script>
        var now = new Date();
        document.getElementById('date').valueAsDate = now;
            $("#DateCountdown").TimeCircles();
            $("#CountDownTimer").TimeCircles({ time: { Days: { show: false }, Hours: { show: false } }});
            $("#PageOpenTimer").TimeCircles();
            
            var updateTime = function(){
                var date = $("#date").val();
                var time = $("#time").val();
                var datetime = date + ' ' + time + ':00';
                $("#DateCountdown").data('date', datetime).TimeCircles().start();
            }
            $("#date").change(updateTime).keyup(updateTime);
            $("#time").change(updateTime).keyup(updateTime);
        </script>       
	</body>
</html>