package sub1;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class Account {
	
	private String bank;
	private String accId;
	private String name;
	private int money;
	
	public Account(String bank, String accId, String name, int money) {
		this.bank=bank;
		this.accId=accId;
		this.name=name;
		this.money=money;
	}
	
	public void deposit(int money) {
		this.money += money;
	}
	
	public void withdraw(int money) {
		this.money -= money;
	}
	
	public void show(JspWriter out) throws Exception {
		out.println("<p>");
		out.println("Bank: "+bank+"</br>");
		out.println("Account ID: "+accId+"</br>");
		out.println("Account Holder: "+name+"</br>");
		out.println("Balance: "+money+"</br>");
		out.println("</p>");
	}
}
