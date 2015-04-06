package kgmp.common.mapper;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Member;

public interface Member_Mapper {
	void insertMember(Member member);//join member
	Member getCustomer(Member member);//check id
	Member getMember(Member member);//check login
	Member printVacation(String writer);//print member for vacation page
	int getMemberQty(Map<String, Object> info);//count member
	int getSearchQty(Map<String, Object> info);//count search 
	List<Member> getMemberList(Map<String, Object> info);//print list of member
	List<Member> getSearch(Map<String, Object> info);//print member for search
	Member selectMmeber(int code_seq);//select member
	void insertSign(Member member);//insert sign
	String printSign(String id);//print sign
	List<Member> printAdmin();
	int getVacation(Map<String, Object> info);
	void updateVacation(Map<String, Object> info);
	Member printDate(String id);
	
}
