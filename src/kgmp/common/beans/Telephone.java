package kgmp.common.beans;

public class Telephone{
	private int telephone_seq; //통화목록 번호
	private String company; //상호/이름
	private String phone1;  //폰번호1
	private String phone2;	//폰번호2
	private String phone3;	//폰번호3
	private String to_kgmp; //찾는사람
	private String content; //내용
	private String writer;  //글쓴사람
	private String add_date;
	private String check_date;
	
	
	public String getCheck_date() {
		return check_date;
	}
	public void setCheck_date(String check_date) {
		this.check_date = check_date;
	}
	public int getTelephone_seq() {
		return telephone_seq;
	}
	public void setTelephone_seq(int telephone_seq) {
		this.telephone_seq = telephone_seq;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
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
	public String getTo_kgmp() {
		return to_kgmp;
	}
	public void setTo_kgmp(String to_kgmp) {
		this.to_kgmp = to_kgmp;
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
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
}
