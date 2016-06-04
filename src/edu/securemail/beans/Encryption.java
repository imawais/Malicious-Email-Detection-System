package edu.securemail.beans;

public class Encryption {

	private String actualWord;
	private String encryptedWord;

	private String message = "";

	public Encryption() {

	}

	public Encryption(String actualWord) {
		this.actualWord = actualWord;
	}

	public String getMessage() {
		return message;
	}

	public String getActualWord() {
		return actualWord;
	}

	public void setActualWord(String actualWord) {
		this.actualWord = actualWord;
	}

	public String getEncryptedWord() {
		return encryptedWord;
	}

	public String doEncryption(String actualWord) {
		short shiftKey = 7;
		for (int i = 0; i <= (actualWord.length() - 1); i++) {
			char c = actualWord.charAt(i);
			short k = (short) c;
			short k2 = (short) (k + shiftKey);

			if (k2 > 90) {
				k2 = (short) (k2 - 26);
			}

			char c2 = (char) k2;
			encryptedWord = encryptedWord + c2;
		}

		return encryptedWord;
	}
}
