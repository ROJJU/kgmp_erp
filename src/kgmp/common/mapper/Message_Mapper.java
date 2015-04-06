package kgmp.common.mapper;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Message;

public interface Message_Mapper {
	void insertMessage(Message msg);//msg 입력
	int checkState(String writer);//msg 확인
	void offMsg(Map<String, Object> info);//알람끄기
	Message newMsg(String writer);//신규 메시지 보기
	int getMsgQty(Map<String, Object> info);//받은 메시지 개수 출력
	List<Message> getMsgList(Map<String, Object> info);//받은 메시지 리스트 출력
	int sendMsgQty(Map<String, Object> info);//보낸 메시지 개수 출력
	List<Message> sendMsgList(Map<String, Object> info);//보낸 메시지 리스트 출력
	Message selectMsg(int msg_seq);//쪽지 내용 보기
	void ReadCheckMsg(Map<String, Object> info);//쪽지 확인처리
	void delMsg(int msg_seq);//쪽지 삭제
	int countGetMsg(String writer);//받은 쪽지 개수 확인
	void autoDel(int month);//자동 삭제
	void saveMsg(int msg_seq);//보관함 이동(영구저장)
	int getSaveMsgQty(Map<String, Object> info);//보관함 쪽지 개수 확인
	List<Message> getSaveMsgList(Map<String, Object> info);//보관함 리스트 출력
	void goTrash(int msg_seq);//휴지통 이동
	int getTrashMsgQty(Map<String, Object> info);
	List<Message> getTrashMsgList(Map<String, Object> info);
}
