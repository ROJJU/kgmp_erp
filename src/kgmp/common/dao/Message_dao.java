package kgmp.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kgmp.common.beans.Message;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Message_Mapper;

import org.apache.ibatis.session.SqlSession;

public class Message_dao {
	
	//msg insert
		public String insertMessage(Message msg){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Message_Mapper mapper = session.getMapper(Message_Mapper.class);
				mapper.insertMessage(msg);
				session.commit();
			}catch(Exception e) {
				e.printStackTrace();
				session.rollback();
				check="false";
			}finally {
				session.close();
			}
			return check;
		}
		
	//msg check
		public int checkState(String writer){
			SqlSession session = SessionPool.getSession();
			int state=0;
			try{
				Message_Mapper mapper = session.getMapper(Message_Mapper.class);
				state=mapper.checkState(writer);
			}catch(Exception e) {
				
			}finally {
				session.close();
			}
			return state;
		}
		
	//off msg alram
		public void offMsg(String writer, int msg_seq){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("msg_seq", msg_seq);
			try{
				Message_Mapper mapper = session.getMapper(Message_Mapper.class);
				mapper.offMsg(info);
				session.commit();
			}catch(Exception e) {
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
		}
		
	//read new msg
		public Message newMsg(String writer){
			SqlSession session = SessionPool.getSession();
			Message msg=null;
			try{
				Message_Mapper mapper = session.getMapper(Message_Mapper.class);
				 msg=mapper.newMsg(writer);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return msg;
		}
		
//select message list(get)
		public Map<String, Object> getMsg(int currentPage, String linkURL, String send0) {
			SqlSession session = SessionPool.getSession();
			Map<String, Object> pageAll = new HashMap<String, Object>();
			Map<String, Object> info = new HashMap<String, Object>();
			int bundlePage = 3;
			int bundlePosts = 14;
			info.put("send0", send0);
			
			try {
				Message_Mapper mapper = session.getMapper(Message_Mapper.class);
				int totalPostsQty = 0;
					totalPostsQty = mapper.getMsgQty(info);
				
				
				//setting
				int totalPageQty = ((totalPostsQty-1)/bundlePosts)+1;
				int startPage = ((currentPage-1)/bundlePage)*bundlePage+1;
				int endPage = (((startPage-1)+bundlePage)/bundlePage)*bundlePage;
				int startNum = (currentPage*bundlePosts)-(bundlePosts-1);
				int endNum = currentPage*bundlePosts;
				info.put("startNum", startNum);
				info.put("endNum", endNum);
				
				int linkPage = 0;
				String pageList = "";
				String btn1 = "/kgmp/erp/main/images/but-pre.png";//踰꾪듉 �씠誘몄�<<
				String btn2 = "/kgmp/erp/main/images/but-next.png";//踰꾪듉 �씠誘몄�>>
				
				//<<button
				if(currentPage > 1){
					linkPage = currentPage-1; 
					pageList = "<a href='" + linkURL + "?currentPage=" + linkPage +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}else{
					pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}
				
				//number
				linkPage = startPage;
				while(linkPage <= endPage){
					if(linkPage == currentPage)
						pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
					else
						pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "'>&nbsp;" + linkPage + "&nbsp;</a>";
					
					linkPage++;
					
					if(linkPage > totalPageQty)
						break;
				}
				
				//>>button
				if(currentPage < totalPageQty){
					linkPage = currentPage+1; 
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}else{
					pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}
				
				//setting list
				List<Message> list =null;
					list=mapper.getMsgList(info);
				
				pageAll.put("pageList", pageList);
				pageAll.put("list", list);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
			return pageAll;
		}
		
//select message list(send)
		public Map<String, Object> sendMsg(int currentPage, String linkURL, String writer){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> pageAll = new HashMap<String, Object>();
			Map<String, Object> info = new HashMap<String, Object>();
			int bundlePage = 3;
			int bundlePosts = 14;
			info.put("writer", writer);
			
			try {
				Message_Mapper mapper = session.getMapper(Message_Mapper.class);
				int totalPostsQty = 0;
					totalPostsQty = mapper.sendMsgQty(info);
				
				
				//setting
				int totalPageQty = ((totalPostsQty-1)/bundlePosts)+1;
				int startPage = ((currentPage-1)/bundlePage)*bundlePage+1;
				int endPage = (((startPage-1)+bundlePage)/bundlePage)*bundlePage;
				int startNum = (currentPage*bundlePosts)-(bundlePosts-1);
				int endNum = currentPage*bundlePosts;
				info.put("startNum", startNum);
				info.put("endNum", endNum);
				
				int linkPage = 0;
				String pageList = "";
				String btn1 = "/kgmp/erp/main/images/but-pre.png";//踰꾪듉 �씠誘몄�<<
				String btn2 = "/kgmp/erp/main/images/but-next.png";//踰꾪듉 �씠誘몄�>>
				
				//<<button
				if(currentPage > 1){
					linkPage = currentPage-1; 
					pageList = "<a href='" + linkURL + "?currentPage=" + linkPage +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}else{
					pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}
				
				//number
				linkPage = startPage;
				while(linkPage <= endPage){
					if(linkPage == currentPage)
						pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
					else
						pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "'>&nbsp;" + linkPage + "&nbsp;</a>";
					
					linkPage++;
					
					if(linkPage > totalPageQty)
						break;
				}
				
				//>>button
				if(currentPage < totalPageQty){
					linkPage = currentPage+1; 
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}else{
					pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}
				
				//insert ilst
				List<Message> list =null;
					list=mapper.sendMsgList(info);
				
				pageAll.put("pageList", pageList);
				pageAll.put("list", list);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
			return pageAll;
		}
		
//read message
	public Message selectMsg(int msg_seq){
		SqlSession session = SessionPool.getSession();
		Message msg=null;
		try {
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			msg=mapper.selectMsg(msg_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return msg;
	}
	
//update check time (when somone read msg)
	public String ReadCheckMsg(String chk_time, int msg_seq){
		SqlSession session = SessionPool.getSession();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("chk_time", chk_time);
		info.put("msg_seq", msg_seq);
		String check="true";
		try{
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			mapper.ReadCheckMsg(info);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
			check="false";
		}finally {
			session.close();
		}
		return check;
	}
		
// delete msg
	public void delMsg(int msg_seq){
		SqlSession session = SessionPool.getSession();
		try{
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			mapper.delMsg(msg_seq);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
	}
	
	//count msg(get)
	public int countGetMsg(String writer){
		SqlSession session = SessionPool.getSession();
		int count=0;
		try{
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			count=mapper.countGetMsg(writer);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
		return count;
	}
	
	//auto delete system
	public void autoDel(int month){
		SqlSession session = SessionPool.getSession();
		try{
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			mapper.autoDel(month);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally{
			session.close();
		}
	}
	
	//update state(move msg to save part)
	public String saveMsg(int msg_seq){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			mapper.saveMsg(msg_seq);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
			check="false";
		}finally {
			session.close();
		}
		return check;
	}
	
	//print save list
	public Map<String, Object> saveMsgList(int currentPage, String linkURL, String send0){
		SqlSession session = SessionPool.getSession();
		Map<String, Object> pageAll = new HashMap<String, Object>();
		Map<String, Object> info = new HashMap<String, Object>();
		int bundlePage = 3;
		int bundlePosts = 14;
		info.put("send0", send0);
		
		try {
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			int totalPostsQty = 0;
				totalPostsQty = mapper.getSaveMsgQty(info);
			
			
			//setting
			int totalPageQty = ((totalPostsQty-1)/bundlePosts)+1;
			int startPage = ((currentPage-1)/bundlePage)*bundlePage+1;
			int endPage = (((startPage-1)+bundlePage)/bundlePage)*bundlePage;
			int startNum = (currentPage*bundlePosts)-(bundlePosts-1);
			int endNum = currentPage*bundlePosts;
			info.put("startNum", startNum);
			info.put("endNum", endNum);
			
			int linkPage = 0;
			String pageList = "";
			String btn1 = "/kgmp/erp/main/images/but-pre.png";//踰꾪듉 �씠誘몄�<<
			String btn2 = "/kgmp/erp/main/images/but-next.png";//踰꾪듉 �씠誘몄�>>
			
			//<<button
			if(currentPage > 1){
				linkPage = currentPage-1; 
				pageList = "<a href='" + linkURL + "?currentPage=" + linkPage +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
			}else{
				pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
			}
			
			//number
			linkPage = startPage;
			while(linkPage <= endPage){
				if(linkPage == currentPage)
					pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
				else
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "'>&nbsp;" + linkPage + "&nbsp;</a>";
				
				linkPage++;
				
				if(linkPage > totalPageQty)
					break;
			}
			
			//>>button
			if(currentPage < totalPageQty){
				linkPage = currentPage+1; 
				pageList += "<a href='" + linkURL + "?currentPage=" + linkPage +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
			}else{
				pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
			}
			
			//insert list
			List<Message> list =null;
				list=mapper.getSaveMsgList(info);
			
			pageAll.put("pageList", pageList);
			pageAll.put("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return pageAll;
	}
	
	//update state(move to trash part)
	public void goTrash(int msg_seq){
		SqlSession session = SessionPool.getSession();
		try{
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			mapper.goTrash(msg_seq);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
			session.rollback();
		}finally {
			session.close();
		}
	}
	
	//print trash
	public Map<String, Object> trashList(int currentPage, String linkURL, String writer){
		SqlSession session = SessionPool.getSession();
		Map<String, Object> pageAll = new HashMap<String, Object>();
		Map<String, Object> info = new HashMap<String, Object>();
		int bundlePage = 3;
		int bundlePosts = 14;
		info.put("writer", writer);
		
		try {
			Message_Mapper mapper = session.getMapper(Message_Mapper.class);
			int totalPostsQty = 0;
				totalPostsQty = mapper.getTrashMsgQty(info);
			
			
			//setting
			int totalPageQty = ((totalPostsQty-1)/bundlePosts)+1;
			int startPage = ((currentPage-1)/bundlePage)*bundlePage+1;
			int endPage = (((startPage-1)+bundlePage)/bundlePage)*bundlePage;
			int startNum = (currentPage*bundlePosts)-(bundlePosts-1);
			int endNum = currentPage*bundlePosts;
			info.put("startNum", startNum);
			info.put("endNum", endNum);
			
			int linkPage = 0;
			String pageList = "";
			String btn1 = "/kgmp/erp/main/images/but-pre.png";//踰꾪듉 �씠誘몄�<<
			String btn2 = "/kgmp/erp/main/images/but-next.png";//踰꾪듉 �씠誘몄�>>
			
			//<<button
			if(currentPage > 1){
				linkPage = currentPage-1; 
				pageList = "<a href='" + linkURL + "?currentPage=" + linkPage +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
			}else{
				pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
			}
			
			//number
			linkPage = startPage;
			while(linkPage <= endPage){
				if(linkPage == currentPage)
					pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
				else
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "'>&nbsp;" + linkPage + "&nbsp;</a>";
				
				linkPage++;
				
				if(linkPage > totalPageQty)
					break;
			}
			
			//>>button
			if(currentPage < totalPageQty){
				linkPage = currentPage+1; 
				pageList += "<a href='" + linkURL + "?currentPage=" + linkPage +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
			}else{
				pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
			}
			
			//insert list
			List<Message> list =null;
				list=mapper.getTrashMsgList(info);
			
			pageAll.put("pageList", pageList);
			pageAll.put("list", list);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return pageAll;
	}
}
