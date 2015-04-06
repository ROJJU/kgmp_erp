package kgmp.common.mapper;

import java.util.List;
import java.util.Map;

import kgmp.common.beans.Customer;
import kgmp.common.beans.Report;

public interface Report_Mapper{
	void insert_d_report(Report report);
	int getDailyQty_g(Map<String, Object> info);
	int getSearchQty_g(Map<String, Object> info);
	int getDailyQty_s(Map<String, Object> info);
	int getSearchQty_s(Map<String, Object> info);
	List<Report> getDailyList_g(Map<String, Object> info);
	List<Report> getDailyList_s(Map<String, Object> info);
	Report getReport_d(int daily_seq);
	void updateHit(int daily_seq);
	int getCommentQty(int customer_seq);
	List<Customer> getCommentList(Map<String, Integer> info);
	void insertComment(Report report);
	List<Report> getSearch_g(Map<String, Object> info);
	List<Report> getSearch_s(Map<String, Object> info);
	void getCountComment_d(int daily_seq);
	//
	String checkPostsStep(Map<String, Object> info);
	int getMaxPostsStep(Map<String, Object> info);
	void setPostsStep(Map<String, Object> info);
	void insertPostsReply(Report report);
	//
	String checkCommentStep(Map<String, Object> info);
	int getMaxCommentStep(Map<String, Object> info);
	void setCommentStep(Map<String, Object> info);
	void insertCommentReply(Report report);
	List<Report> getMainReport(Map<String, Object> info);
	void upState(int daily_seq);
	void downState(int daily_seq);
	int countGet(Map<String, Object> info);
	int countSend(Map<String, Object> info);
}
