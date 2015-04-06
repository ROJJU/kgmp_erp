package kgmp.common.beans;


public class DL {
	private int dl_seq;
	private String id;
	private int insert_year;
	private int insert_month;
	private int insert_day;
	private int hi_work_hour;
	private int bye_work_hour;
	private int hi_work_min;
	private int bye_work_min;
	private String hi_work_time;
	private String bye_work_time;
	private int work_check;
	private int over_work_check;
	private int total_work_check;
	private int work;
	private int late;
	private int give_up;
	private int dont;
	private int vacation;
	private int month_vacation;
	private int half_vacation;
	private int year_vacation;
	private String add_date;
	private String state;
	private String code_seq; //쪼인 맴버 빈
	private String department; //쪼인 맴버 빈
	private String kor_name; //쪼인 맴버 빈
	private String w_level; //쪼인 맴버 빈
	private int etc;
	private int biz_trip;
	private String excuse="정상출근";
	private String rel_add_date;
	
	
	public String getRel_add_date() {
		return rel_add_date;
	}
	public void setRel_add_date(String rel_add_date) {
		this.rel_add_date = rel_add_date;
	}
	public String getExcuse() {
		return excuse;
	}
	public void setExcuse(String excuse){
		this.excuse = excuse;
	}
	public int getEtc() {
		return etc;
	}
	public void setEtc(int etc) {
		this.etc = etc;
	}
	public int getBiz_trip() {
		return biz_trip;
	}
	public void setBiz_trip(int biz_trip) {
		this.biz_trip = biz_trip;
	}
	public String getCode_seq() {
		return code_seq;
	}
	public void setCode_seq(String code_seq) {
		this.code_seq = code_seq;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public String getW_level() {
		return w_level;
	}
	public void setW_level(String w_level) {
		this.w_level = w_level;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getDl_seq() {
		return dl_seq;
	}
	public void setDl_seq(int dl_seq) {
		this.dl_seq = dl_seq;
	}
	public int getInsert_year() {
		return insert_year;
	}
	public void setInsert_year(int insert_year) {
		this.insert_year = insert_year;
	}
	public int getInsert_month() {
		return insert_month;
	}
	public void setInsert_month(int insert_month) {
		this.insert_month = insert_month;
	}
	public int getInsert_day() {
		return insert_day;
	}
	public void setInsert_day(int insert_day) {
		this.insert_day = insert_day;
	}
	public int getHi_work_hour() {
		return hi_work_hour;
	}
	public void setHi_work_hour(int hi_work_hour) {
		this.hi_work_hour = hi_work_hour;
	}
	public int getBye_work_hour() {
		return bye_work_hour;
	}
	public void setBye_work_hour(int bye_work_hour) {
		this.bye_work_hour = bye_work_hour;
	}
	public int getHi_work_min() {
		return hi_work_min;
	}
	public void setHi_work_min(int hi_work_min) {
		this.hi_work_min = hi_work_min;
	}
	public int getBye_work_min() {
		return bye_work_min;
	}
	public void setBye_work_min(int bye_work_min) {
		this.bye_work_min = bye_work_min;
	}
	public String getHi_work_time() {
		return hi_work_time;
	}
	public void setHi_work_time(String hi_work_time) {
		this.hi_work_time = hi_work_time;
	}
	public String getBye_work_time() {
		return bye_work_time;
	}
	public void setBye_work_time(String bye_work_time) {
		this.bye_work_time = bye_work_time;
	}
	public int getWork_check() {
		return work_check;
	}
	public void setWork_check(int work_check) {
		this.work_check = work_check;
	}
	public int getOver_work_check() {
		return over_work_check;
	}
	public void setOver_work_check(int over_work_check) {
		this.over_work_check = over_work_check;
	}
	public int getTotal_work_check() {
		return total_work_check;
	}
	public void setTotal_work_check(int total_work_check) {
		this.total_work_check = total_work_check;
	}
	public int getWork() {
		return work;
	}
	public void setWork(int work) {
		this.work = work;
	}
	public int getLate() {
		return late;
	}
	public void setLate(int late) {
		this.late = late;
	}
	public int getGive_up() {
		return give_up;
	}
	public void setGive_up(int give_up) {
		this.give_up = give_up;
	}
	public int getDont() {
		return dont;
	}
	public void setDont(int dont) {
		this.dont = dont;
	}
	public int getVacation() {
		return vacation;
	}
	public void setVacation(int vacation) {
		this.vacation = vacation;
	}
	public int getMonth_vacation() {
		return month_vacation;
	}
	public void setMonth_vacation(int month_vacation) {
		this.month_vacation = month_vacation;
	}
	public int getHalf_vacation() {
		return half_vacation;
	}
	public void setHalf_vacation(int half_vacation) {
		this.half_vacation = half_vacation;
	}
	public int getYear_vacation() {
		return year_vacation;
	}
	public void setYear_vacation(int year_vacation) {
		this.year_vacation = year_vacation;
	}
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
}
