package kgmp.common.mapper;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Spend;

public interface Spend_Mapper{
	void insertSpend(Spend spend);//insert spend info
	int getSpendQty(Map<String, Object> info);//count spned list
	int getSearchQty(Map<String, Object> info);// count spend list when search
	List<Spend> getSpendList(Map<String, Object> info);//print spned list
	List<Spend> getSearch(Map<String, Object> info);//print spned list when search
	Spend selectSpend(int spend_seq);//select spend data
	void delSpend(int spend_seq);//del spned data
	void modifySpend(Spend spend);//modify spend
	void updateState(Map<String, Object> info);//update state for admin page
	

}
