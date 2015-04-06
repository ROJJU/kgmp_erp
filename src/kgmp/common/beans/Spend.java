package kgmp.common.beans;

public class Spend {
	private int spend_seq;
	private String writer;
	private String spend_date;
	private String title;
	private String money;
	private String money_kor;
	private String how;
	private String etc;
	private String spend_img;
	private String my_sign;
	private String summary;
	private String add_date;
	private int year;
	private int month;
	private int state;
	
	
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
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
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
	public String getSummary(){
		return summary;
	}
	public void setSummary(String summary){
		this.summary = summary;
	}
	public int getSpend_seq() {
		return spend_seq;
	}
	public void setSpend_seq(int spend_seq) {
		this.spend_seq = spend_seq;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSpend_date() {
		return spend_date;
	}
	public void setSpend_date(String spend_date) {
		this.spend_date = spend_date;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getMoney_kor() {
		return money_kor;
	}
	public void setMoney_kor(String money_kor) {
		this.money_kor = money_kor;
	}
	public String getHow() {
		return how;
	}
	public void setHow(String how) {
		this.how = how;
	}
	public String getEtc() {
		return etc;
	}
	public void setEtc(String etc) {
		this.etc = etc;
	}
	public String getSpend_img() {
		return spend_img;
	}
	public void setSpend_img(String spend_img) {
		this.spend_img = spend_img;
	}
	public String getMy_sign() {
		return my_sign;
	}
	public void setMy_sign(String my_sign) {
		this.my_sign = my_sign;
	}
}
