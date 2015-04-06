package kgmp.common.mapper;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Notice;

public interface Notice_Mapper {
	void insertNotice(Notice notice);//공지사항 입력
	int getNoticeQty(Map<String, Object> info);//공지 개수 출력
	int getSearchQty(Map<String, Object> info);//검색 개수 출력
	List<Notice> getNoticeList(Map<String, Object> info);//공지 출력
	List<Notice> getSearch(Map<String, Object> info);//검색 출력
	Notice getNotice(int tel_seq);//공지 선택 출력
	void delNotice(int notice_seq);//공지 삭제
	void hitNotice(int notice_seq);//공지사항 조회수 증가
	void modiftyNotice(Notice notice);//공지사항 수정
	List<Notice> getMainNotice();//공지 메인화면 출력
}
