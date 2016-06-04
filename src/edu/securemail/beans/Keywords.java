package edu.securemail.beans;

public class Keywords {
	private String keywords;
	private String message="";

	public Keywords() {

	}

	public Keywords(String keywords) {
		super();
		this.keywords = keywords;
	}

	public String getKeywords() {
		return keywords;
	}

	public void setKeywords(String keywords) {
		this.keywords = keywords;
	}

	public String getMessage() {
		return message;
	}
	

}
