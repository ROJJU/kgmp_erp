package kgmp.common.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Spend;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Spend_Mapper;

import org.apache.ibatis.session.SqlSession;

public class Spend_dao{
	
	//insert spend info
	public String insertSpend(Spend spend){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Spend_Mapper mapper = session.getMapper(Spend_Mapper.class);
			mapper.insertSpend(spend);
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
	
	//print all spend list
	public Map<String, Object> getSpend(int currentPage, String linkURL, int year, int month){
		SqlSession session = SessionPool.getSession();
		Map<String, Object> pageAll = new HashMap<String, Object>();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("year", year);
		info.put("month", month);
		int bundlePage = 3;
		int bundlePosts = 14;
		
		try {
			Spend_Mapper mapper = session.getMapper(Spend_Mapper.class);
			int totalPostsQty = 0;
				totalPostsQty = mapper.getSpendQty(info);
			
			
			//setting numbers
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
				pageList = "<a href='" + linkURL + "?currentPage=" + linkPage + "&year=" + year + "&month=" + month +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
			}else{
				pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
			}
			
			//number
			linkPage = startPage;
			while(linkPage <= endPage){
				if(linkPage == currentPage)
					pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
				else
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage +"&year=" + year + "&month=" + month + "'>&nbsp;" + linkPage + "&nbsp;</a>";
				
				linkPage++;
				
				if(linkPage > totalPageQty)
					break;
			}
			
			//>>button
			if(currentPage < totalPageQty){
				linkPage = currentPage+1; 
				pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "&year=" + year + "&month=" + month +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
			}else{
				pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
			}
			
			//get list info
			List<Spend> list =null;
				list=mapper.getSpendList(info);
			
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
	
	//select spend data
	public Spend selectSpend(int spend_seq){
		SqlSession session = SessionPool.getSession();
		Spend spend = null;
		try {
			Spend_Mapper mapper = session.getMapper(Spend_Mapper.class);
			spend = mapper.selectSpend(spend_seq);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(session!=null)
				session.close();
		}
		return spend;
	}
	
	//del spned data
	public String delSpend(int spend_seq){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Spend_Mapper mapper = session.getMapper(Spend_Mapper.class);
			mapper.delSpend(spend_seq);
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
	
	//modify spend data
	public String modifySpend(Spend spend){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Spend_Mapper mapper = session.getMapper(Spend_Mapper.class);
			mapper.modifySpend(spend);
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
	
	//update state for admin page
	public String updateState(int spend_seq, int state){
		SqlSession session = SessionPool.getSession();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("spend_seq", spend_seq);
		info.put("state", state);
		String check="true";
		try{
			Spend_Mapper mapper = session.getMapper(Spend_Mapper.class);
			mapper.updateState(info);
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
}
