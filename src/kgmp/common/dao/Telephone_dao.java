package kgmp.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kgmp.common.beans.Telephone;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Telephone_Mapper;

import org.apache.ibatis.session.SqlSession;

public class Telephone_dao{
	
	//통화기록부 등록
	public String insertTelephone(Telephone tel){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Telephone_Mapper mapper = session.getMapper(Telephone_Mapper.class);
			mapper.insertTelephone(tel);
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
	
	//통화기록부 DB 전체 출력
	public Map<String, Object> getTel(int currentPage, String linkURL, String search, String find){
		SqlSession session = SessionPool.getSession();
		Map<String, Object> pageAll = new HashMap<String, Object>();
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("search", search);
		info.put("find", find);
		int bundlePage = 3;
		int bundlePosts = 10;
		
		try {
			Telephone_Mapper mapper = session.getMapper(Telephone_Mapper.class);
			int totalPostsQty = 0;
			if(search == null || search.equals("all"))
				totalPostsQty = mapper.getTelQty(info);
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
			List<Telephone> list =null;
			if(search == null || search.equals("all"))
				list=mapper.getTelList(info);
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
	
	//통화기록부 삭제
	public String delTelephone(int tel_seq){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Telephone_Mapper mapper = session.getMapper(Telephone_Mapper.class);
			mapper.delTelephone(tel_seq);
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
	
	//통화기록부 수정
		public String modiftyTelephone(Telephone tel){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Telephone_Mapper mapper = session.getMapper(Telephone_Mapper.class);
				mapper.modifyTelephone(tel);
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
		
	//통화기록 선택 출력
		public Telephone getTelephone(int tel_seq){
			SqlSession session = SessionPool.getSession();
			Telephone tel = null;
			try{
				Telephone_Mapper mapper = session.getMapper(Telephone_Mapper.class);
				tel = mapper.getTelephone(tel_seq);
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return tel;
		}
		
	//통화기록 사이드 메뉴 출력
		public List<Telephone> getSideTelephone(String member_name){
			SqlSession session = SessionPool.getSession();
			List<Telephone> list = null;
			try{
				Telephone_Mapper mapper = session.getMapper(Telephone_Mapper.class);
				list=mapper.getSideTelephone(member_name);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return list;
		}	
}
