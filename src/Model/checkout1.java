package Model;

public class checkout1 {
		private int quantity;
		private String model;
		private int productid;
		public checkout1() {
			super();
		}
		public checkout1(int productid, String model, int quantity) {
			super();
			this.quantity = quantity;
			this.model = model;
			this.productid = productid;
		}
		public int getQuantity() {
			return quantity;
		}
		public void setQuantity(int quantity) {
			this.quantity = quantity;
		}
		public String getModel() {
			return model;
		}
		public void setModel(String model) {
			this.model = model;
		}
		public int getProductid() {
			return productid;
		}
		public void setProductid(int productid) {
			this.productid = productid;
		}
		
}
