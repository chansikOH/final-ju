package kr.ac.ju.form;

import org.springframework.web.multipart.MultipartFile;

public class ClaForm {
	
	private String name;
	private MultipartFile videoFile;

	public ClaForm() {
		super();
	}
	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public MultipartFile getVideoFile() {
		return videoFile;
	}

	public void setVideoFile(MultipartFile videoFile) {
		this.videoFile = videoFile;
	}
	
	
}