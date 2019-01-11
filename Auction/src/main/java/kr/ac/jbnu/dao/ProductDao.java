package kr.ac.jbnu.dao;

import java.util.List;

import kr.ac.jbnu.model.Product;

public interface ProductDao {
	public List<Product> queryProduct();
	public List<Product> querySearchedProduct(String keyword);
	public List<Product> queryPriceSearchedProduct(String minprice, String maxprice);
	public List<Product> queryCategorySearchedProduct(String _category);
	public Product findProduct(String productCode);
	public void insertProduct(Product product);
	public void updateProduct(Product product);
}
