<%@page import ="javax.mail.Transport" %>
<%@page import ="java.util.Date" %>
<%@page import ="javax.mail.internet.InternetAddress" %>
<%@page import ="javax.mail.Address" %>
<%@page import ="javax.mail.internet.MimeMessage" %>
<%@page import ="javax.mail.Message" %>
<%@page import ="javax.mail.Session" %>
<%@page import = "java.util.Properties" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    
 <%
 	request.setCharacterEncoding("utf-8");
 %>
 <%
 	String sender = request.getParameter("MailSender");
 	String receiver = "it@k-gmp.com";
 	String company = request.getParameter("company");
 	String subject = "System Mail";
 	String phone1 = request.getParameter("phone1");
 	String phone2 = request.getParameter("phone2");
 	String phone3 = request.getParameter("phone3");
 	String to_kgmp = request.getParameter("to_kgmp");
 	String content = request.getParameter("content");
 	String massage = "상호/이름 :"+company+","+"연락처 :"+phone1+"-"+phone2+"-"+phone3+","+"찾는사람 :"+to_kgmp+","+"내   용 : "+content;
 	String server ="localhost";//서버
 	
 	try{
 		Properties props = new Properties();
 		props.put("mail.smtp.host", server);
 		Session s = Session.getDefaultInstance(props, null); //인증작업을 거치지 않음
 		Message msg = new MimeMessage(s);
 		Address send_addr = new InternetAddress(sender);//발신자
 		Address to_addr = new InternetAddress(receiver);//수신자
 		
 		msg.setHeader("Content-Type","text/html;charset=utf-8");
 		msg.setFrom(send_addr);//메일 보내는 사람 등록
 		msg.addRecipient(Message.RecipientType.TO, to_addr);//메일에 받는사람 등록
 		msg.setSubject(subject);//메일제목
 		msg.setContent(massage,"text/html;charset=utf-8");//메일 내용
 		msg.setSentDate(new Date());//발송날짜
 		
 		Transport trans = s.getTransport("smtp");//smtp 프로토콜사용
 		trans.connect(server, null, null);//서버연결
 		trans.sendMessage(msg, msg.getAllRecipients());//메일을 수진자에게 전송
 		trans.close();
 	}catch(Exception e){
 		e.printStackTrace();
 		out.println("<script>alert('메일 보내는데 실패 하였습니다.');history.back();</script>");
 		return;
 	}
 	//mail 발송 성공시 전 단계 화면으로 이동
 	out.println("<script>alert('메일을 성공적으로 보냈습니다.');history.go(-1);</script>");
 
 %>
