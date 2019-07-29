package kr.ac.ju.form;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class StudentForm {

	private String name;
	private Integer no;

	@NotBlank(message = "비밀번호는 필수입력값입니다.")
	private String password;

	@NotBlank(message = "비밀번호 확인은 필수입력값입니다.")
	private String checkpassword;
	private String birthday;

	@NotBlank(message = "이메일은 필수입력값입니다.")
	@Email(message = "이메일 형식이 올바르지 않습니다.")
	private String email;

	@NotBlank(message = "전화번호는 필수입력값입니다.")
	@Pattern(regexp = "^0\\d{1,2}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이 아닙니다.")
	private String phone;

	private String address;
	private String detailaddress;
	private MultipartFile photoFile;

	public StudentForm() {

	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getNo() {
		return no;
	}

	public void setNo(Integer no) {
		this.no = no;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCheckpassword() {
		return checkpassword;
	}

	public void setCheckpassword(String checkpassword) {
		this.checkpassword = checkpassword;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday= birthday;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getDetailaddress() {
		return detailaddress;
	}

	public void setDetailaddress(String detailaddress) {
		this.detailaddress = detailaddress;
	}

	public MultipartFile getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
}
