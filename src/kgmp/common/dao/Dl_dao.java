package kgmp.common.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.DL;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Dl_Mapper;

import org.apache.ibatis.session.SqlSession;


public class Dl_dao {
	
	//check someone is working or not
		public String checkDL(DL dl){
			SqlSession session = SessionPool.getSession();
			Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("id", dl.getId());
			info.put("insert_year", dl.getInsert_year());
			info.put("insert_month", dl.getInsert_month());
			info.put("insert_day", dl.getInsert_day());
			DL state = mapper.getState(info);
			String check="true";
			try{
				if(state==null){
					mapper.hi_work(dl);
				}else{
					mapper.bye_work(dl);
				}
				session.commit();
			}catch(Exception e) {
				e.printStackTrace();
				session.rollback();
				check="false";
			}finally{
				session.close();
			}
			return check;
		}

		//check session state
		public DL getState(String id, String year, String month, String day){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("id", id);
			info.put("insert_year", year);
			info.put("insert_month", month);
			info.put("insert_day", day);
			DL state = null;
			try {
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				state = mapper.getState(info);
			}catch(Exception e) {
				System.out.println("============================== session close ====================================");
				e.printStackTrace();
				System.out.println("============================== session close ====================================");
			}finally {
				if(session!=null)
					session.close();
			}
			return state;
		}
		
		//check state
		public boolean isState(String id, String year, String month, String day){
			return (getState(id, year, month, day)!= null)? true : false;
		}
		
		// print all list of dl
		public Map<String, Object> getTotalDl(int currentPage, String linkURL, String search, String find){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> pageAll = new HashMap<String, Object>();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("search", search);
			info.put("find", find);
			int bundlePage = 3;
			int bundlePosts = 14;
			
			try {
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				int totalPostsQty = 0;
				if(search == null || search.equals("all"))
					totalPostsQty = mapper.getTotalDlQty(info);
				else
					totalPostsQty =mapper.getSearchQty(info);
				
				
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
				
				if(currentPage > 1){
					linkPage = currentPage-1; 
					pageList = "<a href='" + linkURL + "?currentPage=" + linkPage + "&search=" + search + "&find=" + find +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}else{
					pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}
				
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
				
				if(currentPage < totalPageQty){
					linkPage = currentPage+1; 
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "&search=" + search + "&find=" + find +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}else{
					pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}
				
				List<DL> list =null;
				if(search == null || search.equals("all"))
					list=mapper.getTotalDlList(info);
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
		
		//print member db for monthly list
		public List<DL>getMembers(String find){
			SqlSession session = SessionPool.getSession();
			List<DL> member = null;
			try {
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				member = mapper.getMembers(find);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
			return member;
		}
		
		//print dl info for monthly list
		public List<DL>getSums(String id, int insert_year, int insert_month){
			SqlSession session = SessionPool.getSession();
			List<DL> sum = null;
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("id", id);
			info.put("insert_year", insert_year);
			info.put("insert_month", insert_month);
			try {
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				sum = mapper.getSum(info);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
			return sum;
		}
		
		//select dl info for excuse paper
		public DL getOneDl(int dl_seq){
			SqlSession session = SessionPool.getSession();
			DL dl= null;
			try {
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				dl = mapper.getOneDl(dl_seq);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
			return dl;
		}
		
		//state change
		public void updateState(int dl_seq, String state, String id, String insert_year, String insert_month, String insert_day){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("dl_seq", dl_seq);
			info.put("state", state);
			info.put("id", id);
			info.put("insert_year", insert_year);
			info.put("insert_month", insert_month);
			info.put("insert_day", insert_day);
			try {
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				mapper.updateState(info);
				session.commit();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
		}
		
		// print all list of dl for admin page
		public Map<String, Object> printAdmin(int currentPage, String linkURL, String search, String find){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> pageAll = new HashMap<String, Object>();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("search", search);
			info.put("find", find);
			int bundlePage = 3;
			int bundlePosts = 14;
			
			try {
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				int totalPostsQty = 0;
				if(search == null || search.equals("all"))
					totalPostsQty = mapper.getAdminQty(info);
				else
					totalPostsQty =mapper.getAdminSearchQty(info);
				
				
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
				
				if(currentPage > 1){
					linkPage = currentPage-1; 
					pageList = "<a href='" + linkURL + "?currentPage=" + linkPage + "&search=" + search + "&find=" + find +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}else{
					pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}
				
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
				
				if(currentPage < totalPageQty){
					linkPage = currentPage+1; 
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "&search=" + search + "&find=" + find +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}else{
					pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}
				
				List<DL> list =null;
				if(search == null || search.equals("all"))
					list=mapper.getAdminList(info);
				else
					list=mapper.getAdminSearch(info);
				
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
		
		//update state
		public String adminstate(int dl_seq, int state){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("dl_seq", dl_seq);
			info.put("state", state);
			String check="true";
			try{
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				mapper.adminstate(info);
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
		
	//insert vacation info
		public void insertVacation(int insert_year, int insert_month, int insert_day, String id, String add_date){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("insert_year", insert_year);
			info.put("insert_month", insert_month);
			info.put("insert_day", insert_day);
			info.put("id", id);
			info.put("add_date", add_date);
			try{
				Dl_Mapper mapper = session.getMapper(Dl_Mapper.class);
				mapper.insertVacation(info);
				session.commit();
			}catch(Exception e) {
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
		}
}
