package edu.securemail.beans;

public class Admin {
	
	private String email;
	private String password;
	private String message;
	
	public Admin(){
		
	}

	public Admin(String eamil, String password) {
		this.email = eamil;
		this.password = password;
	}

	public String getEamil() {
		return email;
	}

	public void setEamil(String eamil) {
		this.email = eamil;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMessage() {
		return message;
	}
	
	public boolean validate() {

		if (email == null) {
			message = "Invalid email address";
			return false;
		}

		if (password == null) {
			message = "Invalid password";
			return false;
		}

		if (!email.matches("\\w+@\\w+\\.\\w+")) {
			message = "Invalid email address";
			return false;
		}

		if (password.length() < 8) {
			message = "Password must be at least 8 characters.";
			return false;
		} else if (password.matches("\\w*\\s+\\w*")) {
			message = "Password cannot contain space.";
			return false;
		}

		return true;
	}
	
}
