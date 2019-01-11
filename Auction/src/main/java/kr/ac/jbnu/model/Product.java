package kr.ac.jbnu.model;

public class Product {
	private int code;
	private String name;
	private String price;
	private String category;
	private String description;
	private String image;
	private String bidder;
	private String bid_price;
	private int bid_stack;
	
	public Product() {
	}

	public Product(String name, String price, String category, String description, String image) {
		this.name = name;
		this.price = price;
		this.category = category;
		this.description = description;
		this.image = image;
	}
	
	public Product(int code, String name, String price, String category, String description, String image) {
		this.code = code;
		this.name = name;
		this.price = price;
		this.category = category;
		this.description = description;
		this.image = image;
	}
	
	public Product(int code, String name, String price, String category, String description, 
			String image, String bidder, String bid_price) {
		this.code = code;
		this.name = name;
		this.price = price;
		this.category = category;
		this.description = description;
		this.image = image;
		this.setBidder(bidder);
		this.setBid_price(bid_price);
	}

	public int getCode() {
		return code;
	}
	
	public void setCode(int code) {
		this.code = code;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getPrice() {
		return price;
	}
	
	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getImage() {
		return image;
	}
	
	public void setImage(String image) {
		this.image = image;
	}

	public String getBid_price() {
		return bid_price;
	}

	public void setBid_price(String bid_price) {
		this.bid_price = bid_price;
	}

	public String getBidder() {
		return bidder;
	}

	public void setBidder(String bidder) {
		this.bidder = bidder;
	}

	public int getBid_stack() {
		return bid_stack;
	}

	public void setBid_stack(int bid_stack) {
		this.bid_stack = bid_stack;
	}
}