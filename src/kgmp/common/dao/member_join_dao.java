package kgmp.common.dao;


import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kgmp.common.beans.Member;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Member_Mapper;

public class member_join_dao {
	
	//join member
	public String insertMember(Member member){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Member_Mapper mapper = session.getMapper(Member_Mapper.class);
			mapper.insertMember(member);
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
	
	//check id is ok
	public Member getCustomer(Member member){
		SqlSession session = SessionPool.getSession();
		Member result = null;
		try{
			Member_Mapper mapper = session.getMapper(Member_Mapper.class);
			if(member.getPw()==null || member.getPw()==""){
			result=mapper.getCustomer(member);
			}else{
			result=mapper.getMember(member);
			}
		}catch(Exception e){
			e.printStackTrace();
			result = null;
		}finally{
			session.close();
		}
		return result;
	}
	
	//result of id check
	public boolean isCustomer(Member member){
		return (getCustomer(member) != null) ? true : false;
	}
	
	//print info of vacation(part of member)
	public Member printVacation(String writer){
		SqlSession session = SessionPool.getSession();
		Member member=null;
		try{
			Member_Mapper mapper = session.getMapper(Member_Mapper.class);
			member=mapper.printVacation(writer);
		}catch(Exception e){
			e.printStackTrace();
			member = null;
		}finally{
			session.close();
		}
		return member;
	}
	
	//print List of member
	public Map<String, Object> getMembers(int currentPage, String linkURL, String search, String find){
		SqlSession session = SessionPool.getSession();
		Map<String, Object> pageAll = new HashMap<String, Object>();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("search", search);
		info.put("find", find);
		int bundlePage = 3;
		int bundlePosts = 14;
		
		try {
			Member_Mapper mapper = session.getMapper(Member_Mapper.class);
			int totalPostsQty = 0;
			if(search == null || search.equals("all"))
				totalPostsQty = mapper.getMemberQty(info);
			else
				totalPostsQty =mapper.getSearchQty(info);
			
			
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
				pageList = "<a href='" + linkURL + "?currentPage=" + linkPage + "&search=" + search + "&find=" + find +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
			}else{
				pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
			}
			
			//number
			linkPage = startPage;
			while(linkPage <= endPage){
				if(linkPage == currentPage)
					pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
				else
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage +"&search=" + search + "&find=" + find + "'>&nbsp;" + linkPage + "&nbsp;</a>";
				
				linkPage++;
				
				if(linkPage > totalPageQty)
					break;
			}
			
			//>>button
			if(currentPage < totalPageQty){
				linkPage = currentPage+1; 
				pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "&search=" + search + "&find=" + find +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
			}else{
				pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
			}
			
			//print list
			List<Member> list =null;
			if(search == null || search.equals("all"))
				list=mapper.getMemberList(info);
			else
				list=mapper.getSearch(info);
			
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
	
	//select and print member info
	public Member selectMmeber(int code_seq){
		SqlSession session = SessionPool.getSession();
		Member member = null;
		try {
			Member_Mapper mapper = session.getMapper(Member_Mapper.class);
			member = mapper.selectMmeber(code_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return member;
	}
	
	//insert sign image
	public String insertSign(Member member){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Member_Mapper mapper = session.getMapper(Member_Mapper.class);
			mapper.insertSign(member);
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
	
	//print sign image
	public String printSign(String id){
		SqlSession session = SessionPool.getSession();
		String member_sign = null;
		try{
			Member_Mapper mapper = session.getMapper(Member_Mapper.class);
			member_sign=mapper.printSign(id);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return member_sign;
	}
	
	//select member list
	public List<Member> printAdmin(){
		SqlSession session = SessionPool.getSession();
		List<Member> list=null;
		try{
			Member_Mapper mapper = session.getMapper(Member_Mapper.class);
			list=mapper.printAdmin();
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			session.close();
		}
		return list;
	}
	
	//check member vacation is ok
		public int getVacation(String id, int year, int month){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("id", id);
			info.put("year", year);
			info.put("month", month);
			int result = 0;
			try{
				Member_Mapper mapper = session.getMapper(Member_Mapper.class);
				result=mapper.getVacation(info);
			}catch(Exception e){
				e.printStackTrace();
				result = 0;
			}finally{
				session.close();
			}
			return result;
		}
		
		//result of member vacation check
		public boolean isVacation(String id, int year, int month){
			return (getVacation(id, year, month) != 0) ? true : false;
		}
		
	//update member vacation info
		public void updateVacation(int year, int month, String id, int vacation_date){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("id", id);
			info.put("year", year);
			info.put("month", month);
			info.put("vacation_date", vacation_date);
			try{
				Member_Mapper mapper = session.getMapper(Member_Mapper.class);
				mapper.updateVacation(info);
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
				session.rollback();
			}finally{
				session.close();
			}
		}
		
	//print member vacation info
		public Member printDate(String id){
			SqlSession session = SessionPool.getSession();
			Member member = null;
			try{
				Member_Mapper mapper = session.getMapper(Member_Mapper.class);
				member=mapper.printDate(id);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return member;
		}
}


