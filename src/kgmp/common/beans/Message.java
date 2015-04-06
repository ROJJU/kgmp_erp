package kgmp.common.beans;

public class Message {
	private String writer;
	private String send0;
	private String content;
	private int state;
	private String writer_id;
	private String add_date;
	private String add_time;
	private int msg_seq;
	private String chk_date;
	private String chk_time;
	private int msg_state;
	private String month;
	private int save;
	
	
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getSave() {
		return save;
	}
	public void setSave(int save) {
		this.save = save;
	}
	public int getMsg_state() {
		return msg_state;
	}
	public void setMsg_state(int msg_state) {
		this.msg_state = msg_state;
	}
	public String getChk_date() {
		return chk_date;
	}
	public void setChk_date(String chk_date) {
		this.chk_date = chk_date;
	}
	public String getChk_time() {
		return chk_time;
	}
	public void setChk_time(String chk_time) {
		this.chk_time = chk_time;
	}
	public int getMsg_seq() {
		return msg_seq;
	}
	public void setMsg_seq(int msg_seq) {
		this.msg_seq = msg_seq;
	}
	public String getAdd_time() {
		return add_time;
	}
	public void setAdd_time(String add_time) {
		this.add_time = add_time;
	}
	public String getAdd_date() {
		return add_date;
	}
	public void setAdd_date(String add_date) {
		this.add_date = add_date;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
}
