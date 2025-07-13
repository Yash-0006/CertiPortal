package models;

import java.time.LocalDateTime;

public class requested_files {
	
	private int id;
	private int request_id;
	private String file_name;
	private String file_path;
	private LocalDateTime uploaded_at;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRequest_id() {
		return request_id;
	}
	public void setRequest_id(int request_id) {
		this.request_id = request_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	public LocalDateTime getUploaded_at() {
		return uploaded_at;
	}
	public void setUploaded_at(LocalDateTime uploaded_at) {
		this.uploaded_at = uploaded_at;
	}
	public requested_files(int id, int request_id, String file_name, String file_path, LocalDateTime uploaded_at) {
		super();
		this.id = id;
		this.request_id = request_id;
		this.file_name = file_name;
		this.file_path = file_path;
		this.uploaded_at = uploaded_at;
	}
	public requested_files() {
		super();
	}
	@Override
	public String toString() {
		return "requested_files [id=" + id + ", request_id=" + request_id + ", file_name=" + file_name + ", file_path="
				+ file_path + ", uploaded_at=" + uploaded_at + ", getId()=" + getId() + ", getRequest_id()="
				+ getRequest_id() + ", getFile_name()=" + getFile_name() + ", getFile_path()=" + getFile_path()
				+ ", getUploaded_at()=" + getUploaded_at() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	
	
}
