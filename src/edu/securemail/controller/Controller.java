package edu.securemail.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import edu.securemail.beans.Admin;
import edu.securemail.beans.Encryption;
import edu.securemail.beans.Keywords;
import edu.securemail.beans.User;
import edu.securemail.database.Account;
import edu.securemail.database.AddEncryption;
import edu.securemail.database.AddKeywords;
import edu.securemail.database.AdminAccount;

/**
 * Servlet implementation class Controller
 */
@WebServlet("/Controller")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private DataSource ds;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		try {
			InitialContext initContext = new InitialContext();

			Context env = (Context) initContext.lookup("java:comp/env");

			ds = (DataSource) env.lookup("jdbc/secure_mail");

		} catch (NamingException e) {
			throw new ServletException();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");

		if (action == null) {
			request.getRequestDispatcher("/index.jsp").forward(request,
					response);
		} else if (action.equals("login")) {
			request.setAttribute("email", "");
			request.setAttribute("password", "");
			request.setAttribute("message", "");
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
		} else if (action.equals("registration")) {
			request.setAttribute("email", "");
			request.setAttribute("password", "");
			request.setAttribute("repeatpassword", "");
			request.setAttribute("fname", "");
			request.setAttribute("lname", "");
			request.setAttribute("gender", "");
			request.setAttribute("phone", "");
			request.setAttribute("street", "");
			request.setAttribute("city", "");
			request.setAttribute("country", "");
			request.setAttribute("dob", "");
			request.setAttribute("nationality", "");

			request.setAttribute("message", "");
			request.getRequestDispatcher("/registration.jsp").forward(request,
					response);
		} else if (action.equals("adminlogin")) {
			request.setAttribute("email", "");
			request.setAttribute("password", "");
			request.setAttribute("message", "");

			request.getRequestDispatcher("/adminlogin.jsp").forward(request,
					response);

		}  
		else if (action.equals("adminregistration")) {
			request.setAttribute("email", "");
			request.setAttribute("password", "");
			request.setAttribute("repeatpassword", "");

			request.setAttribute("message", "");
			request.getRequestDispatcher("/adminregister.jsp").forward(request,
					response);
		}

		else if (action.equals("managekeywords")) {
			request.setAttribute("keywords", "");
			request.setAttribute("message", "");

			request.getRequestDispatcher("/keywords.jsp").forward(request,
					response);
		}
		
		else if(action.equals("encryptword")){
			request.setAttribute("actualWord", "");
			request.setAttribute("message", "");
			
			request.getRequestDispatcher("/encrypt.jsp").forward(request, response);
			
		}

		else {
			out.println("unrecognised action");
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// use connection
		PrintWriter out = response.getWriter();

		String action = request.getParameter("action");

		if (action == null) {
			out.println("unrecognised action");
			return;
		}

		Connection conn = null;

		try {
			conn = ds.getConnection();
		} catch (SQLException e) {
			throw new ServletException();
		}

		Account account = new Account(conn);
		AdminAccount adminAccount = new AdminAccount(conn);
		AddKeywords addkeywords = new AddKeywords(conn);
		AddEncryption addEncryption = new AddEncryption(conn);

		if (action.equals("adminlogin")) {

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			request.setAttribute("email", email);
			request.setAttribute("password", "");


			try {
				if (adminAccount.login(email, password)) {
					request.getRequestDispatcher("/admin.jsp").forward(request,
							response);
				} else {
					request.setAttribute("message",
							"email address or password not recognised");
					request.getRequestDispatcher("/adminlogin.jsp").forward(request,
							response);
				}
			} catch (SQLException e) {
				request.setAttribute("email",
						"Database error: please try again later.");
				request.getRequestDispatcher("/newaccount.jsp").forward(
						request, response);
			}

		}
		else if (action.equals("adminregistration")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String repeatPassword = request.getParameter("repeatpassword");

			request.setAttribute("email", "");
			request.setAttribute("password", "");
			request.setAttribute("repeatpassword", "");
			request.setAttribute("message", "");

			if (!password.equals(repeatPassword)) {
				// Passwords don't match.
				request.setAttribute("message", "Passwords do not match.");
				request.getRequestDispatcher("/adminregister.jsp").forward(
						request, response);
			} else {
				Admin admin = new Admin(email, password);

				if (!admin.validate()) {
					// Password or email address has wrong format.
					request.setAttribute("message", admin.getMessage());
					request.getRequestDispatcher("/adminregister.jsp").forward(
							request, response);
				} else {
					try {
						if (adminAccount.exists(email)) {
							// This email address already exists in the admin
							// database.
							request.setAttribute("message",
									"An account with this email address already exists");
							request.getRequestDispatcher("/adminregister.jsp")
									.forward(request, response);
						} else {
							// We create create the account.
							adminAccount.create(email,password);
							request.getRequestDispatcher("/createsuccess.jsp")
									.forward(request, response);
						}
					} catch (SQLException e) {

						request.getRequestDispatcher("/error.jsp").forward(
								request, response);
					}
				}

			}
		}

		else if (action.equals("dologin")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");

			User user = new User(email, password);

			request.setAttribute("email", email);
			request.setAttribute("password", "");

			try {
				if (account.login(email, password)) {
					request.getRequestDispatcher("/loginsuccess.jsp").forward(
							request, response);
				} else {
					request.setAttribute("message",
							"email address or password not recognised");
					request.getRequestDispatcher("/login.jsp").forward(request,
							response);
				}
			} catch (SQLException e) {
				request.setAttribute("email",
						"Database error: please try again later.");
				request.getRequestDispatcher("/newaccount.jsp").forward(
						request, response);
			}

		} else if (action.equals("registration")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			String repeatPassword = request.getParameter("repeatpassword");
			String fname = request.getParameter("fname");
			String lname = request.getParameter("lname");
			String gender = request.getParameter("gender");
			String phone = request.getParameter("phone");
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			String country = request.getParameter("country");
			String dob = request.getParameter("dob");
			String nationality = request.getParameter("nationality");

			request.setAttribute("email", email);
			request.setAttribute("password", "");
			request.setAttribute("repeatpassword", "");
			request.setAttribute("fname", "");
			request.setAttribute("lname", "");
			request.setAttribute("gender", "");
			request.setAttribute("phone", "");
			request.setAttribute("street", "");
			request.setAttribute("city", "");
			request.setAttribute("country", "");
			request.setAttribute("dob", "");
			request.setAttribute("nationality", "");
			request.setAttribute("message", "");

			if (!password.equals(repeatPassword)) {
				// Passwords don't match.
				request.setAttribute("message", "Passwords do not match.");
				request.getRequestDispatcher("/registration.jsp").forward(
						request, response);
			} else {
				User user = new User(email, password, fname, lname, dob,
						gender, phone, street, city, country, nationality);

				if (!user.validate()) {
					// Password or email address has wrong format.
					request.setAttribute("message", user.getMessage());
					request.getRequestDispatcher("/registration.jsp").forward(
							request, response);
				} else {
					try {
						if (account.exists(email)) {
							// This email address already exists in the user
							// database.
							request.setAttribute("message",
									"An account with this email address already exists");
							request.getRequestDispatcher("/registration.jsp")
									.forward(request, response);
						} else {
							// We create create the account.
							account.create(email, password, fname, lname, dob,
									gender, phone, street, city, country,
									nationality);
							request.getRequestDispatcher("/createsuccess.jsp")
									.forward(request, response);
						}
					} catch (SQLException e) {

						request.getRequestDispatcher("/error.jsp").forward(
								request, response);
					}
				}

			}
		}

		else if (action.equals("managekeywords")) {

			String keywords = request.getParameter("keywords");

			request.setAttribute("keywords", "");
			request.setAttribute("message", "");


			Keywords kwords = new Keywords(keywords);

			try {
				if (addkeywords.exists(keywords)) {
					// This keyword already exists in the swords database.
					request.setAttribute("message",
							"A keyword with this name already exists");
					request.getRequestDispatcher("/keywords.jsp").forward(
							request, response);
				} else {
					// We create add new keywords.
					addkeywords.add(keywords);
					request.setAttribute("message", "You have entered the keyword successfully");
					request.getRequestDispatcher("/keywords.jsp").forward(
							request, response);
				}
			} catch (SQLException e) {

				request.getRequestDispatcher("/error.jsp").forward(request,
						response);
			}

		}
		else if (action.equals("encryptword")){
			
			String actualWord = request.getParameter("actualWord");
			String encryptedWord;

			request.setAttribute("actualWord", "");
			request.setAttribute("encryptedWord", "");
			request.setAttribute("message", "");


			Encryption words = new Encryption(actualWord);

			try {
				if (addEncryption.exists(actualWord)) {
					// This keyword already exists in the swords database.
					request.setAttribute("message",
							"A word with this name already exists");
					request.getRequestDispatcher("/encrypt.jsp").forward(
							request, response);
				} else {
					// We create add new keywords.
					encryptedWord = words.doEncryption(actualWord);
					addEncryption.add(actualWord,encryptedWord);
					request.setAttribute("message", "You perform the encryption successfully!");
					request.getRequestDispatcher("/encrypt.jsp").forward(
							request, response);
				}
			} catch (SQLException e) {

				request.getRequestDispatcher("/error.jsp").forward(request,
						response);
			}
			
		}

		else {
			out.println("unrecognised action");
		}

		try {
			conn.close();
		} catch (SQLException e) {
			throw new ServletException();
		}
	}
}
