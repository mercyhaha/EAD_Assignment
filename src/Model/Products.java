package Model;

import java.text.DecimalFormat;

public class Products {

	private int Productid;
	private String Img_Path;
	private String Brand;
	private String model;
	private int quantity;	
	private double Price;
	private double totalPrice;
	private double orderTotal;
	
	public Products() {
		super();
	}

	public Products(int productid, String img_Path, String brand, String model,
			int quantity, double price, double totalPrice, double orderTotal) {
		super();
		Productid = productid;
		Img_Path = img_Path;
		Brand = brand;
		this.model = model;
		this.quantity = quantity;
		Price = price;
		this.totalPrice = totalPrice;
		this.orderTotal = orderTotal;
	}

	public int getProductid() {
		return Productid;
	}

	public void setProductid(int productid) {
		Productid = productid;
	}

	public String getImg_Path() {
		return Img_Path;
	}

	public void setImg_Path(String img_Path) {
		Img_Path = img_Path;
	}

	public String getBrand() {
		return Brand;
	}

	public void setBrand(String brand) {
		Brand = brand;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		  this.quantity = quantity;
	}

	public double getPrice() {
		return Price;
	}

	public double setPrice(double price) {
		return Price = price;
	}
	
	public double getTotalPrice(){
		return totalPrice;
	}
	
	public void setTotalPrice(double totalPrice){
		this.totalPrice = totalPrice;
	}
	
	public double getOrderTotal(){
		return orderTotal;
	}
	
	public void setOrderTotal(double orderTotal){
		this.orderTotal = orderTotal;
	}
	
}
