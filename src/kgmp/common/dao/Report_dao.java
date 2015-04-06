package kgmp.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kgmp.common.beans.Customer;
import kgmp.common.beans.Report;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Report_Mapper;

import org.apache.ibatis.session.SqlSession;


public class Report_dao {
	
	//insert daily report
	public String insert_d_report(Report report){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Report_Mapper mapper = session.getMapper(Report_Mapper.class);
			mapper.insert_d_report(report);
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
	
	//count(get)
		public int countDaily_g(int currentPage, String linkURL, String search, String find, String writer, int year, int month, int day){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("search", search);
			info.put("find", find);
			info.put("writer", writer);
			info.put("year_g", year);
			info.put("month_g", month);
			info.put("day_g", day);
			int totalPostsQty = 0;
			
			try {
				Report_Mapper mapper = session.getMapper(Report_Mapper.class);
				
				if(search == null || search.equals("all"))
					totalPostsQty = mapper.getDailyQty_g(info);
				else
					totalPostsQty =mapper.getSearchQty_g(info);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
			return totalPostsQty;
		}
		
		//count(send)
			public int countDaily_s(int currentPage, String linkURL, String search, String find, int year, int month, int day, String id){
				SqlSession session = SessionPool.getSession();
				Map<String, Object> info = new HashMap<String, Object>();
				info.put("search", search);
				info.put("find", find);
				info.put("year_s", year);
				info.put("month_s", month);
				info.put("day_s", day);
				info.put("id", id);
				int totalPostsQty = 0;
				
				try {
					Report_Mapper mapper = session.getMapper(Report_Mapper.class);
					
					if(search == null || search.equals("all"))
						totalPostsQty = mapper.getDailyQty_s(info);
					else
						totalPostsQty =mapper.getSearchQty_s(info);
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(session!=null)
						session.close();
				}
				return totalPostsQty;
			}
				
				
	//print(get)
			public Map<String, Object> getDaily_g(int currentPage, String linkURL, String search, String find, String writer, int year, int month, int day) {
				SqlSession session = SessionPool.getSession();
				Map<String, Object> pageAll = new HashMap<String, Object>();
				Map<String, Object> info = new HashMap<String, Object>();
				info.put("search", search);
				info.put("find", find);
				info.put("writer", writer);
				info.put("year_g", year);
				info.put("month_g", month);
				info.put("day_g", day);
				int bundlePage = 3;
				int bundlePosts = 7;
				
				try {
					Report_Mapper mapper = session.getMapper(Report_Mapper.class);
					int totalPostsQty = 0;
					if(search == null || search.equals("all"))
						totalPostsQty = mapper.getDailyQty_g(info);
					else
						totalPostsQty =mapper.getSearchQty_g(info);
					
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
					String btn1 = "/kgmp/erp/main/images/but-pre.png";//img<<
					String btn2 = "/kgmp/erp/main/images/but-next.png";//img>>
					
					//<<button
					if(currentPage > 1){
						linkPage = currentPage-1; 
						pageList = "<a href='" + linkURL + "?currentPage_g=" + linkPage + "&search_g=" + search + "&find_g=" + find +"&year_g="+year+"&month_g="+month+"&day_g="+day+"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
					}else{
						pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
					}
					
					//number
					linkPage = startPage;
					while(linkPage <= endPage){
						if(linkPage == currentPage)
							pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
						else
							pageList += "<a href='" + linkURL + "?currentPage_g=" + linkPage +"&search_g=" + search + "&find_g=" + find +"&year_g="+year+"&month_g="+month+"&day_g="+day+"'>&nbsp;" + linkPage + "&nbsp;</a>";
						
						linkPage++;
						
						if(linkPage > totalPageQty)
							break;
					}
					
					//>>button
					if(currentPage < totalPageQty){
						linkPage = currentPage+1; 
						pageList += "<a href='" + linkURL + "?currentPage_g=" + linkPage + "&search_g=" + search + "&find_g=" + find +"&year_g="+year+"&month_g="+month+"&day_g="+day+"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
					}else{
						pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
					}
					
					//print list(get)
					List<Report> list =null;
					if(search == null || search.equals("all"))
						list=mapper.getDailyList_g(info);
					else
						list=mapper.getSearch_g(info);
					
					pageAll.put("pageList_g", pageList);
					pageAll.put("list_g", list);
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					if(session!=null)
						session.close();
				}
				return pageAll;
			}
			
	//print(send)
			public Map<String, Object> getDaily_s(int currentPage, String linkURL, String search, String find, int year, int month, int day, String id) {
				SqlSession session = SessionPool.getSession();
				Map<String, Object> pageAll = new HashMap<String, Object>();
				Map<String, Object> info = new HashMap<String, Object>();
				info.put("search", search);
				info.put("find", find);
				info.put("year_s", year);
				info.put("month_s", month);
				info.put("day_s", day);
				info.put("id", id);
				int bundlePage = 3;
				int bundlePosts = 7;
				
				try {
					Report_Mapper mapper = session.getMapper(Report_Mapper.class);
					int totalPostsQty = 0;
					if(search == null || search.equals("all"))
						totalPostsQty = mapper.getDailyQty_s(info);
					else
						totalPostsQty =mapper.getSearchQty_s(info);
					
					
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
						pageList = "<a href='" + linkURL + "?currentPage_s=" + linkPage + "&search_s=" + search + "&find_s=" + find +"&year_s="+year+"&month_s="+month+"&day_s="+day+"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
					}else{
						pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
					}
					
					//number
					linkPage = startPage;
					while(linkPage <= endPage){
						if(linkPage == currentPage)
							pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
						else
							pageList += "<a href='" + linkURL + "?currentPage_s=" + linkPage +"&search_s=" + search + "&find_s=" + find +"&year_s="+year+"&month_s="+month+"&day_s="+day+ "'>&nbsp;" + linkPage + "&nbsp;</a>";
						
						linkPage++;
						
						if(linkPage > totalPageQty)
							break;
					}
					
					//>>button
					if(currentPage < totalPageQty){
						linkPage = currentPage+1; 
						pageList += "<a href='" + linkURL + "?currentPage_s=" + linkPage + "&search_s=" + search + "&find_s=" + find +"&year_s="+year+"&month_s="+month+"&day_s="+day+"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
					}else{
						pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
					}
					
					//print list(send)
					List<Report> list =null;
					if(search == null || search.equals("all"))
						list=mapper.getDailyList_s(info);
					else
						list=mapper.getSearch_s(info);
					
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
			
		//select print(get)
		public Report getReport_d(int daily_seq){
			SqlSession session = SessionPool.getSession();
			Report report_d = null;
			try {
				Report_Mapper mapper = session.getMapper(Report_Mapper.class);
				report_d = mapper.getReport_d(daily_seq);
				mapper.updateHit(daily_seq);//議고쉶�닔 利앷�
				session.commit();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
			return report_d;
		}
		
		
		//insert comment(all)
				public String insertComment(Report report){
					SqlSession session = SessionPool.getSession();
					String check="true";
					try{
						Report_Mapper mapper = session.getMapper(Report_Mapper.class);
						mapper.insertComment(report);
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
		
		//print comment(all)
			public Map<String, Object> getComment(int currentPage, String linkURL, int daily_seq) {
				SqlSession session = SessionPool.getSession();
				Map<String, Object> pageAll = new HashMap<String, Object>();
				Map<String, Integer> info = new HashMap<String, Integer>();
				int bundlePage = 3;
				int bundlePosts = 5;
				
				try {
					Report_Mapper mapper = session.getMapper(Report_Mapper.class);
					int totalPostsQty = mapper.getCommentQty(daily_seq);
					
					//setting
					int totalPageQty = ((totalPostsQty-1)/bundlePosts)+1;
					int startPage = ((currentPage-1)/bundlePage)*bundlePage+1;
					int endPage = (((startPage-1)+bundlePage)/bundlePage)*bundlePage;
					int startNum = (currentPage*bundlePosts)-(bundlePosts-1);
					int endNum = currentPage*bundlePosts;
					
					info.put("startNum", startNum);
					info.put("endNum", endNum);
					info.put("daily_seq", daily_seq);
					
					int linkPage = 0;
					String pageList = "";
					String btn1 = "/kgmp/erp/main/images/but-pre.png";//踰꾪듉 �씠誘몄�<<
					String btn2 = "/kgmp/erp/main/images/but-next.png";//踰꾪듉 �씠誘몄�>>
					
					//<<button
					if(currentPage > 1){
						linkPage = currentPage-1; 
						pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "&daily_seq=" + daily_seq + "'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
					}else{
						pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
					}
					
					linkPage = startPage;
					while(linkPage <= endPage){
						if(linkPage == currentPage)
							pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
						else
							pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "&daily_seq=" + daily_seq +"'>&nbsp;" + linkPage + "&nbsp;</a>";
						
						linkPage++;
						
						if(linkPage > totalPageQty)
							break;
					}
					
					//>>button
					if(currentPage < totalPageQty){
						linkPage = currentPage+1; 
						pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "&daily_seq=" + daily_seq + "'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
					}else{
						pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
					}
					
					//print comment list
					List<Customer> list = mapper.getCommentList(info);
					
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
			
	//count comment
			public int getCountComment_d(int daily_seq){
				int count=0;
				SqlSession session = SessionPool.getSession();
				try{
					Report_Mapper mapper = session.getMapper(Report_Mapper.class);
					count = mapper.getCommentQty(daily_seq);
				}catch(Exception e) {
					e.printStackTrace();
				}finally {
					session.close();
				}
				return count;
			}
			
	//insert reply
			public String insertPostsReply(Report report) {
				SqlSession session = SessionPool.getSession();
				Map<String, Object> info = new HashMap<String, Object>();
				int ref_seq = report.getRef_seq();
				int step = report.getStep();
				int depth = report.getDepth();
				info.put("ref_seq", ref_seq);
				info.put("step", step);
				info.put("depth", depth);
				String check = "true";
				try {
					Report_Mapper mapper = session.getMapper(Report_Mapper.class);
					//check step
					String reStr = "0";
					int result = 0;
					if(null != mapper.checkPostsStep(info)){
						reStr = mapper.checkPostsStep(info);
						result = Integer.parseInt(reStr);
					}
					
					info.put("result", result);
					if(result == 0) {//first
						step = mapper.getMaxPostsStep(info);
						step += 1;
						depth += 1;
					}else {//and so on
						mapper.setPostsStep(info);
						step = result;
						depth += 1;
					}
					report.setStep(step);
					report.setDepth(depth);
					mapper.insertPostsReply(report);
					session.commit();
				}catch(Exception e) {
					e.printStackTrace();
					session.rollback();
					check = "false";
				}finally {
					session.close();
				}
				return check;
			}
			
	//comment reply
			public String insertCommentReply(Report report) {
				SqlSession session = SessionPool.getSession();
				Map<String, Object> info = new HashMap<String, Object>();
				int ref_seq = report.getRef_seq();
				int step = report.getStep();
				int depth = report.getDepth();
				info.put("ref_seq", ref_seq);
				info.put("step", step);
				info.put("depth", depth);
				String check = "true";
				try {
					Report_Mapper mapper = session.getMapper(Report_Mapper.class);
					//check step
					String reStr = "0";
					int result = 0;
					if(null != mapper.checkCommentStep(info)){
						reStr = mapper.checkCommentStep(info);
						result = Integer.parseInt(reStr);
					}
					
					info.put("result", result);
					if(result == 0) {//first
						step = mapper.getMaxCommentStep(info);
						step += 1;
						depth += 1;
					}else {//and so on
						mapper.setCommentStep(info);
						step = result;
						depth += 1;
					}
					report.setStep(step);
					report.setDepth(depth);
					mapper.insertCommentReply(report);
					session.commit();
				}catch(Exception e) {
					e.printStackTrace();
					session.rollback();
					check = "false";
				}finally {
					session.close();
				}
				return check;
			}
			
	//print report for main page
			public List<Report> getMainReport(int year, int month, int day, String writer){
				SqlSession session = SessionPool.getSession();
				Map<String, Object> info = new HashMap<String, Object>();
				info.put("writer", writer);
				info.put("year_g", year);
				info.put("month_g", month);
				info.put("day_g", day);
				List<Report> list = null;
				try{
					Report_Mapper mapper = session.getMapper(Report_Mapper.class);
					list=mapper.getMainReport(info);
				}catch(Exception e){
					e.printStackTrace();
				}finally{
					session.close();
				}
				return list;
			}
			
	//update state for admin page(Submit)
		public void changeState(int submit, int daily_seq){
			SqlSession session = SessionPool.getSession();
			try{
				Report_Mapper mapper = session.getMapper(Report_Mapper.class);
				if(submit==1){
					mapper.downState(daily_seq);
				}else if(submit==2){
					mapper.upState(daily_seq);
				}
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
				session.rollback();
			}finally{
				session.close();
			}
		}
		
	//count(get) for search
		public int countGet(int year, int month, int day, String writer){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("year", year);
			info.put("month", month);
			info.put("day", day);
			int count=0;
			try{
				Report_Mapper mapper = session.getMapper(Report_Mapper.class);
				count = mapper.countGet(info);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return count;
		}
	
		//count(get) for search
		public int countSpend(int year, int month, int day, String writer){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("year", year);
			info.put("month", month);
			info.put("day", day);
			int count=0;
			try{
				Report_Mapper mapper = session.getMapper(Report_Mapper.class);
				count = mapper.countSend(info);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return count;
		}
}
