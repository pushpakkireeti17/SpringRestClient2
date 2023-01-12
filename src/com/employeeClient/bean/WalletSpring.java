package com.employeeClient.bean;

public class WalletSpring {
	private String name;
	private long mobile_number;
	private String email;
	private double amount;
	private String user_name;
	//private String password;
	private long account_number;
	
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getMobile_number() {
		return mobile_number;
	}
	public void setMobile_number(long mobile_number) {
		this.mobile_number = mobile_number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public double getAmount() {
		return amount;
	}
	public void setAmount(double amount) {
		this.amount = amount;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	/*public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}*/
	public long getAccount_number() {
		return account_number;
	}
	public void setAccount_number(long account_number) {
		this.account_number = account_number;
	}
	
	
	
	
	public WalletSpring() {
		super();
	}
	public WalletSpring(String name, long mobile_number, String email, double amount,long account_number, String user_name
			) {
		super();
		this.name = name;
		this.mobile_number = mobile_number;
		this.email = email;
		this.amount = amount;
		this.user_name = user_name;
		//this.password = password;
		this.account_number = account_number;
	}
	public WalletSpring(double amount, String user_name) {
		super();
		this.amount = amount;
		this.user_name = user_name;
	}
	public WalletSpring(String user_name) {
		super();
		this.user_name = user_name;
	}
	public WalletSpring(double amount, String user_name, long account_number) {
		super();
		this.amount = amount;
		this.user_name = user_name;
		this.account_number = account_number;
	}

	
	
	
	
}


