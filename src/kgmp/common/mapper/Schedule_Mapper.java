package kgmp.common.mapper;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Schedule;

public interface Schedule_Mapper {
	void insertSchedule(Schedule schedule);
	List<Schedule> getSchedule();
	int countSchedule(Map<String, Object> info);
	List<Schedule> getList(Map<String, Object> info);
	Schedule selectSchedule(int schedule_seq);
	void delSchedule(int schedule_seq);
	List<Schedule> getSideSchedule(Map<String, Object> info);
	List<Schedule> getMainSchedule();
	List<Schedule> getWeekSchedule(Map<String, Object> info);
	void modifySchedule(Schedule schedule);
	int checkAlram(Map<String, Object> info);
	void offAlram(Map<String, Object> info);
	////////////////////////////////////////////////////////////////////////////////////////
	void insertVacation(Schedule schedule);
	int getVacationQty(Map<String, Object> info);
	int getSearchQty(Map<String, Object> info);
	List<Schedule> getVacationList(Map<String, Object> info);
	List<Schedule> getSearch(Map<String, Object> info);
	Schedule printSche(int schedule_seq);
	void modifyVacation(Schedule schedule);
	void updateState(Map<String, Object> info);//update State
	double countVacation(Map<String, Object> info);//count left vacation day
}
