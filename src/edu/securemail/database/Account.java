package edu.securemail.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Account {
	private Connection conn;

	public Account(Connection conn) {
		this.conn = conn;
	}

	public boolean login(String email, String password) throws SQLException {

		String sql = "select count(*) as count from userinfo where email=? and password=?";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, email);
		stmt.setString(2, password);

		ResultSet rs = stmt.executeQuery();

		int count = 0;

		if (rs.next()) {
			count = rs.getInt("count");
		}

		rs.close();

		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

	public void create(String email, String password, String fname,
			String lname, String dob, String gender, String phone,
			String street, String city, String country, String nationality)
			throws SQLException {
		String sql = "insert into userinfo (email, password, fname, lname,  dob, gender, phone, street, city, country, nationality  ) values (?, ?,?,?,?,?,?,?,?,?,?)";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, email);
		stmt.setString(2, password);
		stmt.setString(3, fname);
		stmt.setString(4, lname);
		stmt.setString(5, dob);
		stmt.setString(6, gender);
		stmt.setString(7, phone);
		stmt.setString(8, street);
		stmt.setString(9, city);
		stmt.setString(10, country);
		stmt.setString(11, nationality);

		stmt.executeUpdate();

		stmt.close();
	}

	public boolean exists(String email) throws SQLException {

		String sql = "select count(*) as count from userinfo where email=?";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, email);

		ResultSet rs = stmt.executeQuery();

		int count = 0;

		if (rs.next()) {
			count = rs.getInt("count");
		}

		rs.close();

		if (count == 0) {
			return false;
		} else {
			return true;
		}
	}

}
