package edu.securemail.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import edu.securemail.beans.Encryption;

public class AddEncryption {
	private Connection conn;

	public AddEncryption(Connection conn) {
		this.conn = conn;
	}
	
	public boolean exists(String actualWords) throws SQLException {

		String sql = "select count(*) as count from encryptedWords where aword=?";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, actualWords);

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

	public void add(String actualWords,String encryptedWords) throws SQLException {
		String sql = "insert into encryptedwords (aword,eword) values (?,?)";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, actualWords);
		stmt.setString(2, encryptedWords);

		stmt.executeUpdate();

		stmt.close();

	}

}
