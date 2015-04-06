package kgmp.common.beans;

public class Customer {
 private String client_num="-";
 private String company_num="-";
 private String company="-";
 private String ceo="-";
 private String address="-"; 
 private String bz_condition="-";
 private String type="-";
 private String site="-";
 private String main_part_name="-";
 private String sub_part_name="-";
 private String main_name="Not Assigned";
 private String sub_name="-";
 private String main_phone1="0";
 private String main_phone2="0";
 private String main_phone3="0";
 private String sub_phone1="0";
 private String sub_phone2="0";
 private String sub_phone3="0";
 private String main_cell_phone1="0";
 private String main_cell_phone2="0";
 private String main_cell_phone3="0";
 private String sub_cell_phone1="0";
 private String sub_cell_phone2="0";
 private String sub_cell_phone3="0";
 private String main_fax1="0";
 private String main_fax2="0";
 private String main_fax3="0";
 private String sub_fax1="0";
 private String sub_fax2="0";
 private String sub_fax3="0";
 private String main_email1="-";
 private String main_email2="-";
 private String sub_email1="-";
 private String sub_email2="-";
 private String writer="-";
 private String condition="open";
 private int state=0;
 private String member_name; //코맨트빈즈 동일
 private int customer_seq; //코맨트빈즈 동일
 private String add_date; //코맨트빈즈 동일
 //코맨트 빈즈 ▼
 private String c_comment;
 private String color="black";
 private int c_comment_seq;//코맨트 시퀀스
 private String type_renewal;
 private String address_p="-";
 private String sort;
	
	
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getAddress_p() {
		return address_p;
	}
	public void setAddress_p(String address_p) {
		this.address_p = address_p;
	}
	public String getType_renewal() {
		return type_renewal;
	}
	public void setType_renewal(String type_renewal) {
		this.type_renewal = type_renewal;
	}
	public int getState() {
	return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getAdd_date() {
	return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
	public String getC_comment() {
		return c_comment;
	}
	public void setC_comment(String c_comment) {
		this.c_comment = c_comment;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getC_comment_seq() {
		return c_comment_seq;
	}
	public void setC_comment_seq(int c_comment_seq) {
		this.c_comment_seq = c_comment_seq;
	}
	public int getCustomer_seq() {
	return customer_seq;
	}
	public void setCustomer_seq(int customer_seq) {
		this.customer_seq = customer_seq;
	}
	public String getMember_name() {
	return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getCondition() {
	return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getWriter() {
	return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getClient_num() {
		return client_num;
	}
	public void setClient_num(String client_num) {
		this.client_num = client_num;
	}
	public String getCompany_num() {
		return company_num;
	}
	public void setCompany_num(String company_num) {
		this.company_num = company_num;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getBz_condition() {
		return bz_condition;
	}
	public void setBz_condition(String bz_condition) {
		this.bz_condition = bz_condition;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getMain_part_name() {
		return main_part_name;
	}
	public void setMain_part_name(String main_part_name) {
		this.main_part_name = main_part_name;
	}
	public String getSub_part_name() {
		return sub_part_name;
	}
	public void setSub_part_name(String sub_part_name) {
		this.sub_part_name = sub_part_name;
	}
	public String getMain_name() {
		return main_name;
	}
	public void setMain_name(String main_name) {
		this.main_name = main_name;
	}
	public String getSub_name() {
		return sub_name;
	}
	public void setSub_name(String sub_name) {
		this.sub_name = sub_name;
	}
	public String getMain_phone1() {
		return main_phone1;
	}
	public void setMain_phone1(String main_phone1) {
		this.main_phone1 = main_phone1;
	}
	public String getMain_phone2() {
		return main_phone2;
	}
	public void setMain_phone2(String main_phone2) {
		this.main_phone2 = main_phone2;
	}
	public String getMain_phone3() {
		return main_phone3;
	}
	public void setMain_phone3(String main_phone3) {
		this.main_phone3 = main_phone3;
	}
	public String getSub_phone1() {
		return sub_phone1;
	}
	public void setSub_phone1(String sub_phone1) {
		this.sub_phone1 = sub_phone1;
	}
	public String getSub_phone2() {
		return sub_phone2;
	}
	public void setSub_phone2(String sub_phone2) {
		this.sub_phone2 = sub_phone2;
	}
	public String getSub_phone3() {
		return sub_phone3;
	}
	public void setSub_phone3(String sub_phone3) {
		this.sub_phone3 = sub_phone3;
	}
	public String getMain_cell_phone1() {
		return main_cell_phone1;
	}
	public void setMain_cell_phone1(String main_cell_phone1) {
		this.main_cell_phone1 = main_cell_phone1;
	}
	public String getMain_cell_phone2() {
		return main_cell_phone2;
	}
	public void setMain_cell_phone2(String main_cell_phone2) {
		this.main_cell_phone2 = main_cell_phone2;
	}
	public String getMain_cell_phone3() {
		return main_cell_phone3;
	}
	public void setMain_cell_phone3(String main_cell_phone3) {
		this.main_cell_phone3 = main_cell_phone3;
	}
	public String getSub_cell_phone1() {
		return sub_cell_phone1;
	}
	public void setSub_cell_phone1(String sub_cell_phone1) {
		this.sub_cell_phone1 = sub_cell_phone1;
	}
	public String getSub_cell_phone2() {
		return sub_cell_phone2;
	}
	public void setSub_cell_phone2(String sub_cell_phone2) {
		this.sub_cell_phone2 = sub_cell_phone2;
	}
	public String getSub_cell_phone3() {
		return sub_cell_phone3;
	}
	public void setSub_cell_phone3(String sub_cell_phone3) {
		this.sub_cell_phone3 = sub_cell_phone3;
	}
	public String getMain_fax1() {
		return main_fax1;
	}
	public void setMain_fax1(String main_fax1) {
		this.main_fax1 = main_fax1;
	}
	public String getMain_fax2() {
		return main_fax2;
	}
	public void setMain_fax2(String main_fax2) {
		this.main_fax2 = main_fax2;
	}
	public String getMain_fax3() {
		return main_fax3;
	}
	public void setMain_fax3(String main_fax3) {
		this.main_fax3 = main_fax3;
	}
	public String getSub_fax1() {
		return sub_fax1;
	}
	public void setSub_fax1(String sub_fax1) {
		this.sub_fax1 = sub_fax1;
	}
	public String getSub_fax2() {
		return sub_fax2;
	}
	public void setSub_fax2(String sub_fax2) {
		this.sub_fax2 = sub_fax2;
	}
	public String getSub_fax3() {
		return sub_fax3;
	}
	public void setSub_fax3(String sub_fax3) {
		this.sub_fax3 = sub_fax3;
	}
	public String getMain_email1() {
		return main_email1;
	}
	public void setMain_email1(String main_email1) {
		this.main_email1 = main_email1;
	}
	public String getMain_email2() {
		return main_email2;
	}
	public void setMain_email2(String main_email2) {
		this.main_email2 = main_email2;
	}
	public String getSub_email1() {
		return sub_email1;
	}
	public void setSub_email1(String sub_email1) {
		this.sub_email1 = sub_email1;
	}
	public String getSub_email2() {
		return sub_email2;
	}
	public void setSub_email2(String sub_email2) {
		this.sub_email2 = sub_email2;
	}
}
