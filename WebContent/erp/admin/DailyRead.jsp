<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Report, java.util.Map, java.util.List" %>
<jsp:useBean id="report_DAO" class="kgmp.common.dao.Report_dao" scope="session"/>
<%
/*선택 출력*/
int daily_seq = Integer.parseInt(request.getParameter("daily_seq"));
int year_m = Integer.parseInt(request.getParameter("year_m"));
int month_m = Integer.parseInt(request.getParameter("month_m"));
int year_s = Integer.parseInt(request.getParameter("year_m"));
int month_s = Integer.parseInt(request.getParameter("month_m"));
int day_s = 0;
int year_g = Integer.parseInt(request.getParameter("year_m"));
int month_g = Integer.parseInt(request.getParameter("month_m"));
int day_g = 0;
String id = request.getParameter("id");

if(request.getParameter("year_s") != null)
	year_s = Integer.parseInt(request.getParameter("year_s"));
if(request.getParameter("month_s") != null)
	month_s = Integer.parseInt(request.getParameter("month_s"));
if(request.getParameter("day_s") != null)
	day_s = Integer.parseInt(request.getParameter("day_s"));
if(request.getParameter("year_g") != null)
	year_g = Integer.parseInt(request.getParameter("year_g"));
if(request.getParameter("month_g") != null)
	month_g = Integer.parseInt(request.getParameter("month_g"));
if(request.getParameter("day_g") != null)
	day_g = Integer.parseInt(request.getParameter("day_g"));


pageContext.setAttribute("d", report_DAO.getReport_d(daily_seq));
//일간업무 코맨트 출력!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
//설정
	String linkURL = "CDRead.jsp";
//현재페이지 번호 설정
	int currentPage = 1;
	if(request.getParameter("currentPage") != null)
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
//페이징과 리스트 가져오기
	Map<String, Object> pageAll = report_DAO. getComment(currentPage, linkURL, daily_seq);
	String pageList = (String)pageAll.get("pageList");
	List<Report> list = (List<Report>)pageAll.get("list");
//페이지속성 추가
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pageList", pageList);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="../main/css/BasicBody.css"/>
	    <link rel="stylesheet" type="text/css" href="../report/css/Daily_R.css"/>
		<script type="text/javascript">
		//tr 숨기기 보이기
		$(document).ready(function() {
			<%
			for(Report a : list) {
			%>
		    $("#menu1<%=a.getD_comment_seq()%>").bind("click", function() {
		    	$('#commentForm<%=a.getD_comment_seq()%>').show("blind, 200");
		      return false;
		    });
		    
		    $("#bye<%=a.getD_comment_seq()%>").bind("click", function() {
		    	$('#commentForm<%=a.getD_comment_seq()%>').hide("blind, 200");
		      return false;
		    });
		    $( ".commentForm" ).hide();
		    <%
			}
		    %>
		});
		
		function formCheck() {
			var sub = document.submit.submit.value;
			if(sub==1){
				if(confirm('해당 서류를 컴펌 처리 하겠습니까? 컴펌 처리 된 서류는 주간 업무에 추가 가능하게 됩니다.'))
					document.submit.submit();
			}
			if(sub==2){
				if(confirm('해당 서류를 보완 처리 하겠습니까?'))
					document.submit.submit();
			}
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
					<div id ="pageTitle"><h1 style="font-size:33px;margin:15px 0;font-family:Verdana, Arial, sans-serif">DailyReport</h1></div>
				</div>
				<div id = "bodyTable">
					<center>
						<table class="daily">
							<tr>
								<th width="50px">제 목</th><td width="340px" colspan="3">${d.title}</td>
								<th width="50px">작성자</th>	<td>${d.writer}</td>
								<th width="50px">조회수</th>	<td>${d.hit}</td>
							</tr>
							<tr>
								<th>전달</th>
								<td  width="200px" >
									<c:if test="${d.send0!=null}"><img src="../report/img/person.png" width="5px" title="${d.send0}"></c:if>
									<c:if test="${d.send1!=null}"><img src="../report/img/person.png" width="5px" title="${d.send1}"></c:if>
									<c:if test="${d.send2!=null}"><img src="../report/img/person.png" width="5px" title="${d.send2}"></c:if>
									<c:if test="${d.send3!=null}"><img src="../report/img/person.png" width="5px" title="${d.send3}"></c:if>
									<c:if test="${d.send4!=null}"><img src="../report/img/person.png" width="5px" title="${d.send4}"></c:if>	
								</td>
								<th width="50px">구 분</th><td width="90px"><c:if test="${d.type==1}">내부업무</c:if><c:if test="${d.type==2}">외부업무</c:if></td>
								<th>진 행</th>
								<form action ="Daily_commit_proc.jsp" method="post" name="submit">
									<td align="center"  colspan="3">
										<c:if test="${d.state==0}">
											<c:if test="${member_id==d.id}"><select name="submit"><option value="2">보완</option><option value="1">컴펌 완료</option></select>&nbsp; <input type="image" src="../report/img/condition.png" width="56px" onClick="formCheck()"/></c:if>
											<c:if test="${member_id!=d.id}">[대기 서류]</c:if>
										</c:if>
										<c:if test="${d.state==-1}"><font color="blue" title="이 서류는 보고 완료 된 서류입니다.">[컴펌 서류]</font></c:if>
										<c:if test="${d.state==1}"><font color="red" title="이 서류는 보완 하셔야 합니다.">[보완 서류]</font></c:if>
										<input type="hidden" value="<%=daily_seq%>" name="daily_seq">
									</td>
								</form>
							</tr>
							<tr>
								<th>첨 부</th>
								<td colspan="7">
									<form action="Download_d.jsp" method="post" name="down">
										<a href="javaScript:document.down.submit();">${d.d_file}</a>
										<c:if test="${d.d_file==null}"><a style="color:red;">첨부된 파일이 없습니다.</a></c:if>
										<input type="hidden" name="d_file" value="${d.d_file}">
									</form>
								</td>
							</tr>
							<tr>
								<th height="330px">내 용</th><td colspan="7" style="background-color:#FFFFFF;"><div style="overflow:scroll; height:325px; width:625px;">${d.content}</div></td>
							</tr>
						</table><br/>
						<p style="color:red; font-family:맑은 돋움; font-size:11px;"><img src="../main/images/total_delIcon.gif" width="8px">&nbsp; 컴펌 받은 서류는 수정 할 수 없습니다</p>
						<div id="bottonPlace">
							<div id="bottons">
							<%if(day_s==0){%>
								<input type="image" src="../notice/img/list.png" width="50px" onclick="goUrl('adminWork.jsp?year_m=<%=year_m%>&month_m=<%=month_m%>&id=<%=id%>&year_g=<%=year_g%>&month_g=<%=month_g%>&day_g=<%=day_g%>')">
							<%}else if(day_g==0){%>
								<input type="image" src="../notice/img/list.png" width="50px" onclick="goUrl('adminWork.jsp?year_m=<%=year_m%>&month_m=<%=month_m%>&id=<%=id%>&year_s=<%=year_s%>&month_s=<%=month_s%>&day_s=<%=day_s%>')">
							<%}%>
								<c:if test="${d.state==1||d.state==0}"><input type="image" src="../report/img/supplement.png" width="74px" onClick="goUrl('Daily_reply_add.jsp?ref_seq=${d.ref_seq}&step=${d.step}&depth=${d.depth}&daily_seq=<%=daily_seq%>&title=${d.title}')"></c:if>
								<c:if test="${d.state==-1}"><input type="image" src="../report/img/submit.png" width="72px" onclick="javaScript:alert('컴펌완료된 서류는 보완 제출할 수 없습니다.')"></c:if>
							</div>
						</div>
						<table class="daily"  style="word-wrap:break-word ; word-break:break-all">
							<tr>
								<th width="40px">번호</th>
								<th width="80px">작성자</th>
								<th width="460px">내용</th>
								<th width="80px">일자</th>
								<th width="40px">답글</th>
							</tr>
						<c:if test="${list=='[]'}"><tr><td colspan="5" align="center" style="color:red">등록된 코맨트가 없습니다</td></tr></c:if>
						<c:forEach var="a" items="${list}">
							<tr>
								<td align="center">${a.d_comment_seq}</td>
								<td align="center">${a.c_writer}</td>
								<td >
									<c:if test="${a.depth!=0}">
								  		<c:forEach begin="1" end="${a.depth-1}">
								  			&nbsp;&nbsp;&nbsp;
								  		</c:forEach>
								  		<font color="red">└ RE:</font>
							  		</c:if>
									${a.c_content}
								</td>
								<td align="center">${a.c_add_date}</td>
								<td align="center" id="menu1${a.d_comment_seq}"><input type="image" src="../report/img/link.png" width="10px"></td>
							</tr>
<!--hide 된 tr START!!-->
							<tr id="commentForm${a.d_comment_seq}" class="commentForm">
							<form action="Daily_comment_reply_add_proc.jsp" method="post" name="comment_reply">
								<td colspan="3" align="right"><font color="red">└ RE: </font><input type="text" size="65px" name="c_content"/></td>
								<td align="center"><input type="image" src="../report/img/Comment.png" width="40px" onclick="javaScript:document.comment_reply.submit();"></td>
								<td id="bye${a.d_comment_seq}" align="center">
									<input type="image" src="../report/img/icon_x.png" width="10px"/>
									<input type="hidden" value="<%=daily_seq%>" name="daily_seq">
									<input type="hidden" value="${member_name}" name ="c_writer">
									<input type="hidden" name="step" value="${a.step}">
									<input type="hidden" name="depth" value="${a.depth}">
									<input type="hidden" name="ref_seq" value="${a.ref_seq}">
									<input type="hidden" value="<%=id%>" name="id">	
									<%if(day_s==0){%>
										<input type="hidden" value="<%=year_m%>" name="year_m">
										<input type="hidden" value="<%=month_m%>" name="month_m">
										<input type="hidden" value="<%=year_g%>" name="year_g">
										<input type="hidden" value="<%=month_g%>" name="month_g">
										<input type="hidden" value="<%=day_g%>" name="day_g">						
									<%}else if(day_g==0){%>
										<input type="hidden" value="<%=year_m%>" name="year_m">
										<input type="hidden" value="<%=month_m%>" name="month_m">
										<input type="hidden" value="<%=year_s%>" name="year_s">
										<input type="hidden" value="<%=month_s%>" name="month_s">
										<input type="hidden" value="<%=day_s%>" name="day_s">	
									<%}%>
								</td>
							</form>
							</tr>
					</c:forEach>
<!--hide 된 tr END!!-->
							<tr>
							<form action="Daily_comment_add_proc.jsp" method="post" name="comment" >
								<td colspan="4" align="center"><input type="text" style="width:600px;" name="c_content"/></td>
								<td align="center">
									<%if(day_s==0){%>
										<input type="hidden" value="<%=year_m%>" name="year_m">
										<input type="hidden" value="<%=month_m%>" name="month_m">
										<input type="hidden" value="<%=year_g%>" name="year_g">
										<input type="hidden" value="<%=month_g%>" name="month_g">
										<input type="hidden" value="<%=day_g%>" name="day_g">
									<%}else if(day_g==0){%>
										<input type="hidden" value="<%=year_m%>" name="year_m">
										<input type="hidden" value="<%=month_m%>" name="month_m">
										<input type="hidden" value="<%=year_s%>" name="year_s">
										<input type="hidden" value="<%=month_s%>" name="month_s">
										<input type="hidden" value="<%=day_s%>" name="day_s">	
									<%}%>
									<input type="image" src="../report/img/Comment.png" width="40px;" onclick="javaScript:document.comment_reply.submit();">
									<input type="hidden" value="${member_name}" name ="c_writer">
									<input type="hidden" value="<%=daily_seq%>" name="daily_seq">
									<input type="hidden" value="<%=id%>" name="id">	
								</td>
							</form>
							</tr>
						</table><br/>
						${pageList}<br/><br/><br/>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>