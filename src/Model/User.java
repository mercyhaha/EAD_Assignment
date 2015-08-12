package Model;

public class User {	
	
	
	
	private String nickname;
	private String email;
	private int contact;
	private String dob;
	private String maillingaddress;
	private String password;
	private String type;
	
	public User() {
		super();
	}

	public User( String nickname, String email, int contact,
			String dob, String maillingaddress, String password, String type) {
		super();
	
		this.nickname = nickname;
		this.email = email;
		this.contact = contact;
		this.dob = dob;
		this.maillingaddress = maillingaddress;
		this.password = password;
		this.type = type;
	}


	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public int getContact() {
		return contact;
	}

	public void setContact(int contact) {
		this.contact = contact;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getMaillingaddress() {
		return maillingaddress;
	}

	public void setMaillingaddress(String maillingaddress) {
		this.maillingaddress = maillingaddress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

		
		
}
