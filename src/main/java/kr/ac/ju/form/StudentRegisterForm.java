package kr.ac.ju.form;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import kr.ac.ju.vo.Major;
import kr.ac.ju.vo.Professor;
import kr.ac.ju.vo.StudentStatus;

public class StudentRegisterForm {

	@NotBlank(message = "이름은 필수 입력값 입니다.")
	@Pattern(regexp = "^[가-힣]{2,}$", message = "이름은 두 글자 이상의 한글로 입력하시오")
	private String name;
	
	private String gender; 

	@NotNull(message = "생일은 필수 입력값입니다.")
	@Past(message = "생일은 현재 날짜 이전 값으로 입력하세요.")
	private Date birth; 
	
	@NotBlank(message = "이메일은 필수 입력값입니다.")
	@Email(message = "유효한 이메일 형식이 아닙니다.")
	private String email; 
	
	@NotBlank(message = "전화번호는 필수 입력값입니다.")
	@Pattern(regexp = "^0\\d{1,2}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이 아닙니다.")
	private String phoneNumber;

	@NotBlank(message = "주소는 필수 입력값입니다.")
	private String address;

	@NotBlank(message = "주소는 필수 입력값입니다.")
	private String detailaddress;
	
	@NotNull(message = "전공은 필수 입력값입니다.")
	private Integer majorNo;
	
	@NotBlank(message = "편입여부는 필수 입력값입니다.")
	private String transferYn;
	
	@NotNull(message = "학년은 필수 입력값입니다.")
	private Integer grade;
	
	private MultipartFile photoFile;

	public StudentRegisterForm() {} 
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
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

	public Integer getMajorNo() {
		return majorNo;
	}

	public void setMajorNo(Integer majorNo) {
		this.majorNo = majorNo;
	}

	public String getTransferYn() {
		return transferYn;
	}

	public void setTransferYn(String transferYn) {
		this.transferYn = transferYn;
	}

	public Integer getGrade() {
		return grade;
	}

	public void setGrade(Integer grade) {
		this.grade = grade;
	}

	public MultipartFile getPhotoFile() {
		return photoFile;
	}

	public void setPhotoFile(MultipartFile photoFile) {
		this.photoFile = photoFile;
	}
	
	
	
}
