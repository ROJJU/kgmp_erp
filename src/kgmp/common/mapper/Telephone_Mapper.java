package kgmp.common.mapper;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Telephone;

public interface Telephone_Mapper {
	void insertTelephone(Telephone tel);//통화기록부 등록
	int getTelQty(Map<String, Object> info);//통화기록부 개수
	int getSearchQty(Map<String, Object> info);//통화기록부 검색 개수
	List<Telephone> getTelList(Map<String, Object> info);//통화기록부 출력
	List<Telephone> getSearch(Map<String, Object> info);//통화기록부 검색 출력
	void delTelephone(int tel_seq);//통화기록부 삭제
	void modifyTelephone(Telephone tel);//통화기록부 수정
	Telephone getTelephone(int tel_seq);//통화기록 선택 출력
	List<Telephone> getSideTelephone(String member_name);//사이드 메뉴 통화기록 출력
}
