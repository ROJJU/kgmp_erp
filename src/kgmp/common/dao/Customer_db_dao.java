package kgmp.common.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import kgmp.common.beans.Customer;
import kgmp.common.db.SessionPool;
import kgmp.common.mapper.Customer_Mapper;

public class Customer_db_dao {
	
	//고객 DB 저장
	public String insertCustomer(Customer customer){
		SqlSession session = SessionPool.getSession();
		String check="true";
		try{
			Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
			mapper.insertCustomer(customer);
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

	//고객 DB 전체 출력
		public Map<String, Object> getCustomers(int currentPage, String linkURL, String search, String find){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> pageAll = new HashMap<String, Object>();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("search", search);
			info.put("find", find);
			int bundlePage = 3;
			int bundlePosts = 14;
			
			try {
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				int totalPostsQty = 0;
				if(search == null || search.equals("all"))
					totalPostsQty = mapper.getCustomersQty(info);
				else if(search.equals("state"))
					totalPostsQty =mapper.getTrashQty(info);
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
				List<Customer> list =null;
				if(search == null || search.equals("all"))
					list=mapper.getCustomerList(info);
				else if(search.equals("state"))
					list=mapper.selectTrashCan(info);
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
	
	//고객 정보 선택 출력
		public Customer getCustomer(int customer_seq){
			SqlSession session = SessionPool.getSession();
			Customer customer = null;
			try {
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				customer = mapper.getCustomer(customer_seq);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				if(session!=null)
					session.close();
			}
			return customer;
		}
		
	//고객 정보 코맨트 입력
		public String insertComment(Customer customer){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				mapper.insertComment(customer);
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
		
	//고객 정보 코맨트 출력
		public Map<String, Object> getComment(int currentPage, String linkURL, int customer_seq, int list_currentPage) {
			SqlSession session = SessionPool.getSession();
			Map<String, Object> pageAll = new HashMap<String, Object>();
			Map<String, Integer> info = new HashMap<String, Integer>();
			int bundlePage = 3;
			int bundlePosts = 15;
			
			try {
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				int totalPostsQty = mapper.getCommentQty(customer_seq);
				
				//페이징 관련 정보 구하기
				int totalPageQty = ((totalPostsQty-1)/bundlePosts)+1;
				int startPage = ((currentPage-1)/bundlePage)*bundlePage+1;
				int endPage = (((startPage-1)+bundlePage)/bundlePage)*bundlePage;
				int startNum = (currentPage*bundlePosts)-(bundlePosts-1);
				int endNum = currentPage*bundlePosts;
				
				info.put("startNum", startNum);
				info.put("endNum", endNum);
				info.put("customer_seq", customer_seq);
				
				int linkPage = 0;
				String pageList = "";
				String btn1 = "/kgmp/erp/main/images/but-pre.png";//버튼 이미지<<
				String btn2 = "/kgmp/erp/main/images/but-next.png";//버튼 이미지>>
				
				//<<버튼 설정
				if(currentPage > 1){
					linkPage = currentPage-1; 
					pageList += "<a href='" + linkURL + "?c_currentPage=" + linkPage + "&customer_seq=" + customer_seq +"&currentPage="+list_currentPage+"'>&nbsp;&nbsp;<img src = "+btn1+"></a>";
				}else{
					pageList = "<a href='#'><input type='image' src = "+btn1+">&nbsp;&nbsp;</a>";
				}
				
				linkPage = startPage;
				while(linkPage <= endPage){
					if(linkPage == currentPage)
						pageList += "&nbsp;<b  style='color:red; text-decoration:underline;'>" + currentPage + "</b>&nbsp;";
					else
						pageList += "<a href='" + linkURL + "?c_currentPage=" + linkPage + "&customer_seq=" + customer_seq +"&currentPage="+list_currentPage+"'>&nbsp;" + linkPage + "&nbsp;</a>";
					
					linkPage++;
					
					if(linkPage > totalPageQty)
						break;
				}
				
				//>>버튼 설정
				if(currentPage < totalPageQty){
					linkPage = currentPage+1; 
					pageList += "<a href='" + linkURL + "?c_currentPage=" + linkPage + "&customer_seq=" + customer_seq +"&currentPage="+list_currentPage+ "'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}else{
					pageList += "<a href='#'>&nbsp;&nbsp;<img src = "+btn2+"></a>";
				}
				
				//게시물 리스트
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
		
	//고객 정보 휴지통 이동
		public String moveCustomer(int customer_seq, int state){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				if(state==0){mapper.upState(customer_seq);}else{mapper.downState(customer_seq);}
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
		
	//고객 정보 삭제
		public String delCustomer(int customer_seq){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				mapper.delCustomer(customer_seq);
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
	
	//고객 정보 수정
		public String modifyCustomer(Customer customer){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				mapper.modifyCustomer(customer);
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
	
	//고객 정보 휴지통 개수
		public int getTrashQty(){
			SqlSession session = SessionPool.getSession();
			int trash=0;
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				trash=mapper.getAllTrashQty();
			}catch(Exception e) {
				e.printStackTrace();
				session.rollback();
			}finally {
				session.close();
			}
			return trash;
		}
		
	// 메인페이지 고객정보 출력
		public List<Customer> getMainCustomer(){
			SqlSession session = SessionPool.getSession();
			List<Customer> list = null;
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				list=mapper.getMainCustomer();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			return list;
		}
		
	//고객 정보 개수 출력
		public int countCustomer(String search, String find){
			SqlSession session = SessionPool.getSession();
			Map<String, Object> info = new HashMap<String, Object>();
			info.put("search", search);
			info.put("find", find);
			int count=0;
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				if(search == null || search.equals("all"))
					count = mapper.getCustomersQty(info);
				else if(search.equals("state"))
					count =mapper.getTrashQty(info);
				else
					count =mapper.getSearchQty(info);
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return count;
		}
		
	//고객 히스토리 삭제
		public String delComment(int c_comment_seq){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				mapper.delComment(c_comment_seq);
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
		
	//고객 히스토리 수정
		public String modifyComment(Customer customer){
			SqlSession session = SessionPool.getSession();
			String check="true";
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				mapper.modifyComment(customer);
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
	
	//고객 히스토리 선택 출력
		public Customer getComment(int c_comment_seq){
			SqlSession session = SessionPool.getSession();
			Customer customer = null;
			try{
				Customer_Mapper mapper = session.getMapper(Customer_Mapper.class);
				customer=mapper.getComment(c_comment_seq);
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				session.close();
			}
			return customer;
		}
		
}
