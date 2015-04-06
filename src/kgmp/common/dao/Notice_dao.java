package kgmp.common.dao;

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Notice;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Notice_Mapper;

import org.apache.ibatis.session.SqlSession;

public class Notice_dao {
	//공지사항 등록
		public String insertTelephone(Notice notice){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Notice_Mapper mapper = session.getMapper(Notice_Mapper.class);
				mapper.insertNotice(notice);
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
		
	//공지 DB 전체 출력
		public Map<String, Object> getNotice(int currentPage, String linkURL, String search, String find){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> pageAll = new HashMap<String, Object>();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("search", search);
			info.put("find", find);
			int bundlePage = 3;
			int bundlePosts = 10;
			
			try {
				Notice_Mapper mapper = session.getMapper(Notice_Mapper.class);
				int totalPostsQty = 0;
				if(search == null || search.equals("all"))
					totalPostsQty = mapper.getNoticeQty(info);
				else
					totalPostsQty =mapper.getSearchQty(info);
				
				
				//페이징 관련 정보 구하기
				int totalPageQty = ((totalPostsQty-1)/bundlePosts)+1;
				int startPage = ((currentPage-1)/bundlePage)*bundlePage+1;
				int endPage = (((startPage-1)+bundlePage)/bundlePage)*bundlePage;
				int startNum = (currentPage*bundlePosts)-(bundlePosts-1);
				int endNum = currentPage*bundlePosts;
				info.put("startNum", startNum);
				info.put("endNum", endNum);
				
				int linkPage = 0;
				String pageList = "";
				String btn1 = "/kgmp/erp/main/images/but-pre.png";//버튼 이미지<<
				String btn2 = "/kgmp/erp/main/images/but-next.png";//버튼 이미지>>
				
				//<<버튼 설정
				if(currentPage > 1){
					linkPage = currentPage-1; 
					pageList = "<a href='" + linkURL + "?currentPage=" + linkPage + "&search=" + search + "&find=" + find +"'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}else{
					pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}
				
				//중간 번호 설정
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
				
				//>>버튼 설정
				if(currentPage < totalPageQty){
					linkPage = currentPage+1; 
					pageList += "<a href='" + linkURL + "?currentPage=" + linkPage + "&search=" + search + "&find=" + find +"'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}else{
					pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}
				
				//게시물 리스트
				List<Notice> list =null;
				if(search == null || search.equals("all"))
					list=mapper.getNoticeList(info);
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
		
		//공지 선택 출력
		public Notice getNotice(int notice_seq){
			SqlSession session = SessionPool.getSession();
			Notice notice = null;
			try{
				Notice_Mapper mapper = session.getMapper(Notice_Mapper.class);
				notice = mapper.getNotice(notice_seq);
				mapper.hitNotice(notice_seq);
				session.commit();
			}catch(Exception e){
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
			return notice;
		}
		
		//공지 삭제
		public String delNotice(int notice_seq){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Notice_Mapper mapper = session.getMapper(Notice_Mapper.class);
				mapper.delNotice(notice_seq);
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
		
		//공지 수정
		public String modiftyNotice(Notice notice){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Notice_Mapper mapper = session.getMapper(Notice_Mapper.class);
				mapper.modiftyNotice(notice);
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
		
		//공지사항 메인페이지 출력
		public List<Notice> getMainNotice(){
			SqlSession session = SessionPool.getSession();
			List<Notice> list = null;
			try{
				Notice_Mapper mapper = session.getMapper(Notice_Mapper.class);
				list=mapper.getMainNotice();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return list;
		}	
}
