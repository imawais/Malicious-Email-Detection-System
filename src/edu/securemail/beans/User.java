package edu.securemail.beans;

public class User {
	private String email = "";
	private String password = "";	

	private String firstName = "";
	private String lastName = "";
	private String dob = "";
	private String gender = "";
	private String phone = "";
	private String city = "";
	private String street = "";
	private String country = "";
	private String nationality = "";

	public User() {

	}

	public User(String email, String password, String firstName,
			String lastName, String dob, String gender, String phone,
			String city, String street, String country, String nationality) {
		super();
		this.email = email;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dob = dob;
		this.gender = gender;
		this.phone = phone;
		this.city = city;
		this.street = street;
		this.country = country;
		this.nationality = nationality;
	}

	public User(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	private String message = "";

	public String getMessage() {
		return message;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
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
