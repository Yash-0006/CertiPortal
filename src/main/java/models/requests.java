package models;

import java.time.LocalDateTime;

public class requests {
	
	private int student_id;
	private int request_id;
	private String certificate_type;
	private String status;
	private String admin_comment;
	private String handled_by;
	private LocalDateTime requested_at;
	private LocalDateTime updated_at;
	private String student_pin_no;
	
	public String getStudent_pin_no() {
		return student_pin_no;
	}
	public void setStudent_pin_no(String student_pin_no) {
		this.student_pin_no = student_pin_no;
	}
	public int getStudent_id() {
		return student_id;
	}
	public void setStudent_id(int student_id) {
		this.student_id = student_id;
	}
	public int getRequest_id() {
		return request_id;
	}
	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}
	public String getCertificate_type() {
		return certificate_type;
	}
	public void setCertificate_type(String certificate_type) {
		this.certificate_type = certificate_type;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getAdmin_comment() {
		return admin_comment;
	}
	public void setAdmin_comment(String admin_comment) {
		this.admin_comment = admin_comment;
	}
	public LocalDateTime getRequested_at() {
		return requested_at;
	}
	public void setRequested_at(LocalDateTime requested_at) {
		this.requested_at = requested_at;
	}
	public LocalDateTime getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(LocalDateTime updated_at) {
		this.updated_at = updated_at;
	}
	
	public String getHandled_by() {
		return handled_by;
	}
	public void setHandled_by(String hadled_by) {
		this.handled_by = hadled_by;
	}
	public requests(int student_id, int request_id, String certificate_type, String status, String admin_comment,
			String handled_by, LocalDateTime requested_at, LocalDateTime updated_at, String student_pin_no) {
		super();
		this.student_id = student_id;
		this.request_id = request_id;
		this.certificate_type = certificate_type;
		this.status = status;
		this.admin_comment = admin_comment;
		this.handled_by = handled_by;
		this.requested_at = requested_at;
		this.updated_at = updated_at;
		this.student_pin_no = student_pin_no;
	}
	public requests() {
		super();
	}
	@Override
	public String toString() {
		return "requests [student_id=" + student_id + ", request_id=" + request_id + ", certificate_type="
				+ certificate_type + ", status=" + status + ", admin_comment=" + admin_comment + ", handled_by="
				+ handled_by + ", requested_at=" + requested_at + ", updated_at=" + updated_at + ", student_pin_no="
				+ student_pin_no + ", getStudent_pin_no()=" + getStudent_pin_no() + ", getStudent_id()="
				+ getStudent_id() + ", getRequest_id()=" + getRequest_id() + ", getCertificate_type()="
				+ getCertificate_type() + ", getStatus()=" + getStatus() + ", getAdmin_comment()=" + getAdmin_comment()
				+ ", getRequested_at()=" + getRequested_at() + ", getUpdated_at()=" + getUpdated_at()
				+ ", getHandled_by()=" + getHandled_by() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}


	
}
