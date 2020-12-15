package kr.co.vo;

import java.util.Date;

public class ReplyVO {
	
	private int rid;
	private int bid;
	private String content;
	private String reg_id;
	private Date reg_dt;
	private Date edit_dt;
	
	public ReplyVO() {}

	public int getRid() {
		return rid;
	}

	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public Date getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(Date reg_dt) {
		this.reg_dt = reg_dt;
	}

	public Date getEdit_dt() {
		return edit_dt;
	}

	public void setEdit_dt(Date edit_dt) {
		this.edit_dt = edit_dt;
	}

	public ReplyVO(int rid, int bid, String content, String reg_id, Date reg_dt, Date edit_dt) {
		super();
		this.rid = rid;
		this.bid = bid;
		this.content = content;
		this.reg_id = reg_id;
		this.reg_dt = reg_dt;
		this.edit_dt = edit_dt;
	}

	@Override
	public String toString() {
		return "ReplyVO [rid=" + rid + ", bid=" + bid + ", content=" + content + ", reg_id=" + reg_id + ", reg_dt="
				+ reg_dt + ", edit_dt=" + edit_dt + ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + bid;
		result = prime * result + ((content == null) ? 0 : content.hashCode());
		result = prime * result + ((edit_dt == null) ? 0 : edit_dt.hashCode());
		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
		result = prime * result + ((reg_id == null) ? 0 : reg_id.hashCode());
		result = prime * result + rid;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReplyVO other = (ReplyVO) obj;
		if (bid != other.bid)
			return false;
		if (content == null) {
			if (other.content != null)
				return false;
		} else if (!content.equals(other.content))
			return false;
		if (edit_dt == null) {
			if (other.edit_dt != null)
				return false;
		} else if (!edit_dt.equals(other.edit_dt))
			return false;
		if (reg_dt == null) {
			if (other.reg_dt != null)
				return false;
		} else if (!reg_dt.equals(other.reg_dt))
			return false;
		if (reg_id == null) {
			if (other.reg_id != null)
				return false;
		} else if (!reg_id.equals(other.reg_id))
			return false;
		if (rid != other.rid)
			return false;
		return true;
	}

}
