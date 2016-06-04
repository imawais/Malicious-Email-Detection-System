package edu.securemail.database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AddKeywords {

	private Connection conn;

	public AddKeywords(Connection conn) {
		this.conn = conn;
	}

	public boolean exists(String keywords) throws SQLException {

		String sql = "select count(*) as count from swords where words=?";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, keywords);

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

	public void add(String keywords) throws SQLException {
		String sql = "insert into swords (words) values (?)";

		PreparedStatement stmt = conn.prepareStatement(sql);

		stmt.setString(1, keywords);

		stmt.executeUpdate();

		stmt.close();

	}

}
