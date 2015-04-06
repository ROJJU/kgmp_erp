package kgmp.common.beans;

public class Schedule{
	private int year;
	private int month;
	private int day;
	private String f_hour;
	private String f_min;
	private String s_hour;
	private String s_min;
	private String type;
	private String title;
	private String location;
	private String content;
	private String writer;
	private String send0;
	private int schedule_seq;
	private String emp_pic;
	private int alram;
	private String date2;
	private String date_cal;
	private int step;
	private int state;
	private String add_date;
	private int date_check;
	private String id;
	
	
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id = id;
	}
	public int getDate_check(){
		return date_check;
	}
	public void setDate_check(int date_check) {
		this.date_check = date_check;
	}
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getDate_cal() {
		return date_cal;
	}
	public void setDate_cal(String date_cal) {
		this.date_cal = date_cal;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getDate2() {
		return date2;
	}
	public void setDate2(String date2) {
		this.date2 = date2;
	}
	public int getAlram() {
		return alram;
	}
	public void setAlram(int alram) {
		this.alram = alram;
	}
	public String getEmp_pic() {
		return emp_pic;
	}
	public void setEmp_pic(String emp_pic) {
		this.emp_pic = emp_pic;
	}
	public int getSchedule_seq() {
		return schedule_seq;
	}
	public void setSchedule_seq(int schedule_seq) {
		this.schedule_seq = schedule_seq;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public String getF_hour() {
		return f_hour;
	}
	public void setF_hour(String f_hour) {
		this.f_hour = f_hour;
	}
	public String getF_min() {
		return f_min;
	}
	public void setF_min(String f_min) {
		this.f_min = f_min;
	}
	public String getS_hour() {
		return s_hour;
	}
	public void setS_hour(String s_hour) {
		this.s_hour = s_hour;
	}
	public String getS_min() {
		return s_min;
	}
	public void setS_min(String s_min) {
		this.s_min = s_min;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSend0() {
		return send0;
	}
	public void setSend0(String send0) {
		this.send0 = send0;
	}
}
