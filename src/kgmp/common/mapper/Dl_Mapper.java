package kgmp.common.mapper;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.DL;

public interface Dl_Mapper {
	void hi_work(DL dl);
	DL getState(Map<String, Object> info);//state check
	void bye_work(DL dl);
	int getTotalDlQty(Map<String, Object> info); 
	int getSearchQty(Map<String, Object> info);
	List<DL> getTotalDlList(Map<String, Object> info);
	List<DL> getSearch(Map<String, Object> info);
	List<DL> getMembers(String find);
	List<DL> getSum(Map<String, Object> info);
	DL getOneDl(int dl_seq);
	void updateState(Map<String, Object> info);
	int getAdminQty(Map<String, Object> info);
	int getAdminSearchQty(Map<String, Object> info);
	List<DL> getAdminList(Map<String, Object> info);
	List<DL> getAdminSearch(Map<String, Object> info);
	void adminstate(Map<String, Object> info);
	void insertVacation(Map<String, Object> info);
}
