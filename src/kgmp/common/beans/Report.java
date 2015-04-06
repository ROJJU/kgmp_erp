package kgmp.common.beans;

public class Report {
	private int daily_seq;
	private String type;
	private String d_file;
	private String title;
	private String writer;
	private String add_date;
	private String insert_year;
	private String insert_month;
	private String insert_day;
	private String search;
	private String find;
	private String send0;
	private String send1;
	private String send2;
	private String send3;
	private String send4;
	private String content;
	private int hit;
	private int state;
	//comment beens
	private int d_comment_seq;
	private String c_writer;
	private String c_add_date;
	private String c_content;
	//ref
	private int step;
	private int depth;
	private int ref_seq;
	private String id;
	
	
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getRef_seq() {
		return ref_seq;
	}
	public void setRef_seq(int ref_seq) {
		this.ref_seq = ref_seq;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public int getD_comment_seq() {
		return d_comment_seq;
	}
	public void setD_comment_seq(int d_comment_seq) {
		this.d_comment_seq = d_comment_seq;
	}
	public String getC_writer() {
		return c_writer;
	}
	public void setC_writer(String c_writer) {
		this.c_writer = c_writer;
	}
	public String getC_add_date() {
		return c_add_date;
	}
	public void setC_add_date(String c_add_date) {
		this.c_add_date = c_add_date;
	}
	public String getC_content() {
		return c_content;
	}
	public void setC_content(String c_content) {
		this.c_content = c_content;
	}
	public String getInsert_day() {
		return insert_day;
	}
	public void setInsert_day(String insert_day) {
		this.insert_day = insert_day;
	}
	public String getSend1() {
		return send1;
	}
	public void setSend1(String send1) {
		this.send1 = send1;
	}
	public String getSend2() {
		return send2;
	}
	public void setSend2(String send2) {
		this.send2 = send2;
	}
	public String getSend3() {
		return send3;
	}
	public void setSend3(String send3) {
		this.send3 = send3;
	}
	public String getSend4() {
		return send4;
	}
	public void setSend4(String send4) {
		this.send4 = send4;
	}
	public int getDaily_seq() {
		return daily_seq;
	}
	public void setDaily_seq(int daily_seq) {
		this.daily_seq = daily_seq;
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
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getInsert_year() {
		return insert_year;
	}
	public void setInsert_year(String insert_year) {
		this.insert_year = insert_year;
	}
	public String getInsert_month() {
		return insert_month;
	}
	public void setInsert_month(String insert_month) {
		this.insert_month = insert_month;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getFind() {
		return find;
	}
	public void setFind(String find) {
		this.find = find;
	}
	public String getSend0() {
		return send0;
	}
	public void setSend0(String send0) {
		this.send0 = send0;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getD_file() {
		return d_file;
	}
	public void setD_file(String d_file) {
		this.d_file = d_file;
	}
}
