package kr.ac.jbnu.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.jbnu.model.Cart;
import kr.ac.jbnu.model.Product;

public class CartDaoImpl implements CartDao {
	private SessionFactory sessionFactory;

	@Autowired
	private ProductDao productDao;

	public CartDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public List<Product> queryCart(String userid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select cart.cart_item from Cart as cart " + "where cart_user=:cart_user");
		query.setParameter("cart_user", userid);

		@SuppressWarnings("unchecked")
		List<Integer> list = query.list();
		List<Product> productList = new ArrayList<Product>();

		for (Integer item : list) {
			Product product;
			product = productDao.findProduct(Integer.toString(item));
			productList.add(product);
		}

		return productList;
	}

	@Override
	@Transactional
	public List<Integer> queryCartId(String userid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select cart.cart_id from Cart as cart " + "where cart_user=:cart_user");
		query.setParameter("cart_user", userid);

		@SuppressWarnings("unchecked")
		List<Integer> list = query.list();

		return list;
	}

	@Override
	@Transactional
	public void insertCart(String userid, String code) {
		// TODO Auto-generated method stub
		Cart cart = new Cart(userid, Integer.parseInt(code));

		Session session = sessionFactory.getCurrentSession();

		session.save(cart);
	}

	@Override
	@Transactional
	public void deleteCart(String cartid) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();

		Query query = session.createQuery("delete from Cart as cart " + "where cart.cart_id=:cart_id");
		query.setParameter("cart_id", Integer.parseInt(cartid));

		int result = query.executeUpdate();
	}
}
