<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import=" java.util.*" %>
<%
int iDay=5;
Calendar temp=Calendar.getInstance ( );
StringBuffer sbDate=new StringBuffer ( );

temp.add ( Calendar.DAY_OF_MONTH, iDay );

int nYear = temp.get ( Calendar.YEAR );
int nMonth = temp.get ( Calendar.MONTH ) + 1;
int nDay = temp.get ( Calendar.DAY_OF_MONTH );

sbDate.append ( nYear );
if ( nMonth < 10 ) 
sbDate.append ( "0" );
sbDate.append ( nMonth );
if ( nDay < 10 ) 
sbDate.append ( "0" );
sbDate.append ( nDay );

String date =sbDate.toString ( );
/*
Calendar cCal = Calendar.getInstance();
cCal.add(Calendar.DATE, -5);
int now = cCal.get(Calendar.DATE);*/
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%=date%>
<%=Calendar.DAY_OF_MONTH %>
</body>
</html>