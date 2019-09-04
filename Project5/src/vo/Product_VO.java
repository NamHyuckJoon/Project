package vo;

public class Product_VO {
	String product_code = null;
	String product_name = null;
	String product_amount = null;
	String product_price = null;
	String product_date = null;
	String category_name = null;
	String category_code = null;
	String product_img = null;
	
	public Product_VO() {}
	
	public Product_VO(String product_code, String product_name, String product_price,
			String product_date, String category_name, String category_code, String product_img) {
		super();
		this.product_code = product_code;
		this.product_name = product_name;
		this.product_price = product_price;
		this.product_date = product_date;
		this.category_name = category_name;
		this.category_code = category_code;
		this.product_img = product_img;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_amount() {
		return product_amount;
	}
	public void setProduct_amount(String product_amount) {
		this.product_amount = product_amount;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getProduct_date() {
		return product_date;
	}
	public void setProduct_date(String product_date) {
		this.product_date = product_date;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getCategory_code() {
		return category_code;
	}
	public void setCategory_code(String category_code) {
		this.category_code = category_code;
	}
	public String getProduct_img() {
		return product_img;
	}
	public void setProduct_img(String product_img) {
		this.product_img = product_img;
	}
	
	
	
}
