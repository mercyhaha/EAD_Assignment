package Model;

import java.sql.Date;

public class checkout {
	private int transactionid;
	private Date dateofpurchase;
	private String email;
	private String cardtype;
	private int creditcardno;
	private int	totalamount;
	public checkout() {
		super();
	}
	public checkout(int transactionid, Date dateofpurchase, String email,
			String cardtype, int creditcardno, int totalamount) {
		super();
		this.transactionid = transactionid;
		this.dateofpurchase = dateofpurchase;
		this.email = email;
		this.cardtype = cardtype;
		this.creditcardno = creditcardno;
		this.totalamount = totalamount;
	}
	public int getTransactionid() {
		return transactionid;
	}
	public void setTransactionid(int transactionid) {
		this.transactionid = transactionid;
	}
	public Date getDateofpurchase() {
		return dateofpurchase;
	}
	public void setDateofpurchase(Date dateofpurchase) {
		this.dateofpurchase = dateofpurchase;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCardtype() {
		return cardtype;
	}
	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}
	public int getCreditcardno() {
		return creditcardno;
	}
	public void setCreditcardno(int creditcardno) {
		this.creditcardno = creditcardno;
	}
	public int getTotalamount() {
		return totalamount;
	}
	public void setTotalamount(int totalamount) {
		this.totalamount = totalamount;
	}
	
	
}
