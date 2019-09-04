package member;

public class Member_VO {
	
	private String id;
	private 	String pw;
	private String name;
	private String phone;
	private String address;
	private String member_admin;
	
	public String getMember_admin() {
		return member_admin;
	}
	public void setMember_admin(String member_admin) {
		this.member_admin = member_admin;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
