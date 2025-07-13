package models;

public class student {
	
	private int id;
	private String  name;
	private String email;	
	private String department;
	private String pin_no;
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
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getPin_no() {
		return pin_no;
	}
	public void setPin_no(String pin_no) {
		this.pin_no = pin_no;
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
	public student(int id, String name, String email, String department, String pin_no, String phone_no,
			String password) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.department = department;
		this.pin_no = pin_no;
		this.phone_no = phone_no;
		this.password = password;
	}
	public student() {
		super();
	}
	@Override
	public String toString() {
		return "student [id=" + id + ", name=" + name + ", email=" + email + ", department=" + department + ", pin_no="
				+ pin_no + ", phone_no=" + phone_no + ", password=" + password + ", getId()=" + getId() + ", getName()="
				+ getName() + ", getEmail()=" + getEmail() + ", getDepartment()=" + getDepartment() + ", getPin_no()="
				+ getPin_no() + ", getPhone_no()=" + getPhone_no() + ", getPassword()=" + getPassword()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
}
