package kgmp.common.beans;

import java.sql.Date;

public class Member {
	private String code_seq;
	private String department;
	private String emp_type;
	private String work_type;
	private String w_level;
	private String kor_name;
	private String cha_name;
	private String eng_name;
	private String address;
	private String phone1;
	private String phone2;
	private String phone3;
	private String cell_phone1;
	private String cell_phone2;
	private String cell_phone3;
	private String email1;
	private String email2;
	private String emp_pic;
	private String id;
	private String pw;
	private Date join_date;
	private String member_sign; // 2014.11.10 new add
	private int vacation_year; // 2014.11.13 new add
	private int vacation_date; // 2014.11.13 new add
	private int vacation_month; //2014.11.14 new add
	
	
	public int getVacation_month() {
		return vacation_month;
	}
	public void setVacation_month(int vacation_month) {
		this.vacation_month = vacation_month;
	}
	public int getVacation_date(){
		return vacation_date;
	}
	public void setVacation_date(int vacation_date) {
		this.vacation_date = vacation_date;
	}
	public int getVacation_year(){
		return vacation_year;
	}
	public void setVacation_year(int vacation_year){
		this.vacation_year = vacation_year;
	}
	public String getMember_sign() {
		return member_sign;
	}
	public void setMember_sign(String member_sign) {
		this.member_sign = member_sign;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
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
	public String getEmp_type() {
		return emp_type;
	}
	public void setEmp_type(String emp_type) {
		this.emp_type = emp_type;
	}
	public String getWork_type() {
		return work_type;
	}
	public void setWork_type(String work_type) {
		this.work_type = work_type;
	}
	public String getW_level() {
		return w_level;
	}
	public void setW_level(String w_level) {
		this.w_level = w_level;
	}
	public String getKor_name() {
		return kor_name;
	}
	public void setKor_name(String kor_name) {
		this.kor_name = kor_name;
	}
	public String getCha_name() {
		return cha_name;
	}
	public void setCha_name(String cha_name) {
		this.cha_name = cha_name;
	}
	public String getEng_name() {
		return eng_name;
	}
	public void setEng_name(String eng_name) {
		this.eng_name = eng_name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getCell_phone1() {
		return cell_phone1;
	}
	public void setCell_phone1(String cell_phone1) {
		this.cell_phone1 = cell_phone1;
	}
	public String getCell_phone2() {
		return cell_phone2;
	}
	public void setCell_phone2(String cell_phone2) {
		this.cell_phone2 = cell_phone2;
	}
	public String getCell_phone3() {
		return cell_phone3;
	}
	public void setCell_phone3(String cell_phone3) {
		this.cell_phone3 = cell_phone3;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getEmp_pic() {
		return emp_pic;
	}
	public void setEmp_pic(String emp_pic) {
		this.emp_pic = emp_pic;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
}
