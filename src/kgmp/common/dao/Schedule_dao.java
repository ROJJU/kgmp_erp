package kgmp.common.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Schedule;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Schedule_Mapper;

import org.apache.ibatis.session.SqlSession;

public class Schedule_dao {
	
	//insert schedule
		public String insertSchedule(Schedule schedule){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				mapper.insertSchedule(schedule);
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
		
	//?
		public List<Schedule> getSchedule(){
			SqlSession session = SessionPool.getSession();
			List<Schedule> list=null;
			
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				list=mapper.getSchedule();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return list;
		}
		
	//count schedule info
		public int countSchedule(String writer, int year, int month, int day){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("year", year);
			info.put("month", month);
			info.put("day", day);
			int count=0;
			
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				count=mapper.countSchedule(info);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return count;
		}
		
	//
		public List<Schedule> getList(String writer, int year, int month, int day){
			SqlSession session = SessionPool.getSession();
			List<Schedule> list=null;
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("year", year);
			info.put("month", month);
			info.put("day", day);
			
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				list=mapper.getList(info);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			return list;
		}
		
	//select one schedule info
		public Schedule selectSchedule(int schedule_seq){
			SqlSession session = SessionPool.getSession();
			Schedule schedule=null;
			
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				schedule=mapper.selectSchedule(schedule_seq);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				session.close();
			}
			
			return schedule;
		}
		
		
	//delete schedule info
		public String delSchedule(int schedule_seq){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				mapper.delSchedule(schedule_seq);
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
		
		
	//print schedule for side menu
		public List<Schedule> getSideSchedule(String writer, int year, int month, int day){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("year", year);
			info.put("month", month);
			info.put("day", day);
			List<Schedule> list = null;
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				list=mapper.getSideSchedule(info);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return list;
		}
		
	//print schedule list for main page
		public List<Schedule> getMainSchedule(){
			SqlSession session = SessionPool.getSession();
			List<Schedule> list = null;
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				list=mapper.getMainSchedule();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return list;
		}	
	
	//print all weekly schedule
		public List<Schedule> getWeekSchedule(int year, int month){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("year", year);
			info.put("month", month);
			List<Schedule> list = null;
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				list=mapper.getWeekSchedule(info);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return list;
		}
		
	//modify schedule
		public String modifySchedule(Schedule schedule){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				mapper.modifySchedule(schedule);
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
	
	//update schedule alram
		public int checkalram(String writer, int year ,int month, int day){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("year", year);
			info.put("month", month);
			info.put("day", day);
			int alram=0;
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				alram=mapper.checkAlram(info);
			}catch(Exception e) {
				//e.printStackTrace();
			}finally {
				session.close();
			}
			return alram;
		}
	
	//update alram off
		public String offAlram(String writer, int year ,int month, int day){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("year", year);
			info.put("month", month);
			info.put("day", day);
			String check="true";
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				mapper.offAlram(info);
				session.commit();
			}catch(Exception e) {
				//e.printStackTrace();
				session.rollback();
				check="false";
			}finally {
				session.close();
			}
			return check;
		}
		
	//insert vacation info
		public String insertVacation(Schedule schedule){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				mapper.insertVacation(schedule);
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
		
	//print all schedule list
		public Map<String, Object> getVacation(int currentPage, String linkURL, String search, String find){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> pageAll = new HashMap<String, Object>();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("search", search);
			info.put("find", find);
			int bundlePage = 3;
			int bundlePosts = 14;
			
			try {
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				int totalPostsQty = 0;
				if(search == null || search.equals("all"))
					totalPostsQty = mapper.getVacationQty(info);
				else
					totalPostsQty =mapper.getSearchQty(info);
				
				
				//setting page list
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
				
				List<Schedule> list =null;
				if(search == null || search.equals("all"))
					list=mapper.getVacationList(info);
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
		
		//print one schedule info
		public Schedule printSche(int schedule_seq){
			SqlSession session = SessionPool.getSession();
			Schedule sche = null;
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				sche=mapper.printSche(schedule_seq);
			}catch(Exception e){
				e.printStackTrace();
			}finally{
				if(session!=null)
					session.close();
			}
			return sche;
		}
		
		public String modifyVacation(Schedule schedule){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				mapper.modifyVacation(schedule);
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
		
		//update State
		public String updateState(int schedule_seq, int state){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("schedule_seq", schedule_seq);
			info.put("state", state);
			String check="true";
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
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
		
		//count used vacation day
		public double countVacation(String writer, int nowYear){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("writer", writer);
			info.put("nowYear", nowYear);
			double countV=0;
			try{
				Schedule_Mapper mapper = session.getMapper(Schedule_Mapper.class);
				countV=mapper.countVacation(info);
				session.commit();
			}catch(Exception e) {
				System.out.println("["+writer+"]이미 처리된 인원");
				session.rollback();
			}finally {
				session.close();
			}
			return countV;
		}
		
		
}
