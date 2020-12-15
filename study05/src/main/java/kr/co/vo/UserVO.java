package kr.co.vo;

public class UserVO {
	
	private String uid;
	private String name;
	private String pwd;
	private String re_pwd;
	private String email;
	private String grade;
	private String reg_dt;
	
	public UserVO() {}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getRe_pwd() {
		return re_pwd;
	}

	public void setRe_pwd(String re_pwd) {
		this.re_pwd = re_pwd;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public String getReg_dt() {
		return reg_dt;
	}

	public void setReg_dt(String reg_dt) {
		this.reg_dt = reg_dt;
	}

	public UserVO(String uid, String name, String pwd, String re_pwd, String email, String grade, String reg_dt) {
		super();
		this.uid = uid;
		this.name = name;
		this.pwd = pwd;
		this.re_pwd = re_pwd;
		this.email = email;
		this.grade = grade;
		this.reg_dt = reg_dt;
	}

	@Override
	public String toString() {
		return "UserVO [uid=" + uid + ", name=" + name + ", pwd=" + pwd + ", re_pwd=" + re_pwd + ", email=" + email
				+ ", grade=" + grade + ", reg_dt=" + reg_dt + ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result + ((grade == null) ? 0 : grade.hashCode());
		result = prime * result + ((name == null) ? 0 : name.hashCode());
		result = prime * result + ((pwd == null) ? 0 : pwd.hashCode());
		result = prime * result + ((re_pwd == null) ? 0 : re_pwd.hashCode());
		result = prime * result + ((reg_dt == null) ? 0 : reg_dt.hashCode());
		result = prime * result + ((uid == null) ? 0 : uid.hashCode());
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
		UserVO other = (UserVO) obj;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (grade == null) {
			if (other.grade != null)
				return false;
		} else if (!grade.equals(other.grade))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		if (pwd == null) {
			if (other.pwd != null)
				return false;
		} else if (!pwd.equals(other.pwd))
			return false;
		if (re_pwd == null) {
			if (other.re_pwd != null)
				return false;
		} else if (!re_pwd.equals(other.re_pwd))
			return false;
		if (reg_dt == null) {
			if (other.reg_dt != null)
				return false;
		} else if (!reg_dt.equals(other.reg_dt))
			return false;
		if (uid == null) {
			if (other.uid != null)
				return false;
		} else if (!uid.equals(other.uid))
			return false;
		return true;
	}

}
