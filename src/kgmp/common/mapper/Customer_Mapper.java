package kgmp.common.mapper;

import java.util.List;

import java.util.Map;

import kgmp.common.beans.Customer;

public interface Customer_Mapper {
	void insertCustomer(Customer customer);//고객 db 입력
	int getCustomersQty(Map<String, Object> info);//총 고객 db 개수 구하기
	List<Customer> getCustomerList(Map<String, Object> info);// 고객 all 출력
	Customer getCustomer(int customer_seq);//고객 one 출력
	void insertComment(Customer customer);//고객 코맨트 입력
	int getCommentQty(int customer_seq);//총 코맨트 db 개수 구하기
	List<Customer> getCommentList(Map<String, Integer> info);// 고객 코맨트 all 출력
	void delCustomer(int customer_seq);// 고객 db 삭제
	void modifyCustomer(Customer customer);//고객 db 수정
	void upState(int customer_seq);//고객 db 휴지통 이동
	List<Customer> selectTrashCan(Map<String, Object> info);//휴지통 출력
	List<Customer> getSearch(Map<String, Object> info);//고객 db 검색
	int getTrashQty(Map<String, Object> info);//검색 휴지통 db 개수 구하기
	int getSearchQty(Map<String, Object> info);//총 검색 db 개수 구하기
	int getAllTrashQty();//총 휴지통 db 개수 구하기
	void downState(int customer_seq);//고객 db 복구
	List<Customer> getMainCustomer();//메인페이지 고객정보 출력
	void delComment(int c_comment_seq);//히스토리 삭제
	void modifyComment(Customer customer);//히스토리 수정
	Customer getComment(int c_comment_seq);//히스토리 선택 출력
}
