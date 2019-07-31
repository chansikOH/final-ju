package kr.ac.ju.form;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

public class StudnetRegisterForm {

	private String name;

	@NotBlank(message = "비밀번호는 필수입력값입니다.")
	@Pattern(regexp = "^[a-zA-Z0-9]{6,}$", message = "비밀번호는 8글자 이상, 영어 대소문자/숫자만 입력하세요.")
	private String password;

	@NotBlank(message = "비밀번호 확인은 필수입력값입니다.")
	@Pattern(regexp = "^[a-zA-Z0-9]{6,}$", message = "비밀번호는 8글자 이상, 영어 대소문자/숫자만 입력하세요.")
	private String checkpassword;
	private String birthday;

	@NotBlank(message = "이메일은 필수입력값입니다.")
	@Email(message = "이메일 형식이 올바르지 않습니다.")
	private String email;

	@NotBlank(message = "전화번호는 필수입력값입니다.")
	@Pattern(regexp = "^0\\d{1,2}-\\d{3,4}-\\d{4}$", message = "전화번호 형식이 올바르지 않습니다.")
	private String phoneNumber;

	private String address;
	private String detailaddress;
	private MultipartFile photoFile;
	
}
