package models;

public class admin {
	
	private int id;
	private String name;
	private String email;
	private String role;
	private String phone_no;
	private String password;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public admin(int id, String name, String email, String role, String phone_no, String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.role = role;
		this.phone_no = phone_no;
		this.password = password;
	}
	public admin() {
		super();
	}
	@Override
	public String toString() {
		return "admin [id=" + id + ", name=" + name + ", email=" + email + ", role=" + role + ", phone_no=" + phone_no
				+ ", password=" + password + ", getId()=" + getId() + ", getName()=" + getName() + ", getEmail()="
				+ getEmail() + ", getRole()=" + getRole() + ", getPhone_no()=" + getPhone_no() + ", getPassword()="
				+ getPassword() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()="
				+ super.toString() + "]";
	}
	
	
}
