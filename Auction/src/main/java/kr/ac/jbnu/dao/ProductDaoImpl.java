package kr.ac.jbnu.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import kr.ac.jbnu.model.Product;

public class ProductDaoImpl implements ProductDao {
	private SessionFactory sessionFactory;

	public ProductDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public List<Product> queryProduct() {
		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>) sessionFactory.getCurrentSession().createCriteria(Product.class)
				.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return list;
	}

	@Override
	@Transactional
	public Product findProduct(String productCode) {
		Query query = sessionFactory.getCurrentSession()
				.createQuery("from Product as product where code=:code");
		query.setParameter("code", Integer.parseInt(productCode));

		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>) query.list();
		return list.get(0);
	}

	@Override
	@Transactional
	public List<Product> querySearchedProduct(String keyword) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession()
				.createQuery("from Product as product where product.name like :name");
		query.setParameter("name", "%" + keyword + "%");

		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>) query.list();
		return list;
	}

	@Override
	@Transactional
	public List<Product> queryPriceSearchedProduct(String minprice, String maxprice) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery(
				"from Product as product where product.price>=:minprice and " + "product.price<=:maxprice");
		query.setInteger("minprice", Integer.parseInt(minprice));
		query.setInteger("maxprice", Integer.parseInt(maxprice));

		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>) query.list();
		return list;
	}

	@Override
	@Transactional
	public List<Product> queryCategorySearchedProduct(String _category) {
		// TODO Auto-generated method stub
		String hql = null;
		if (_category.equals("others")) {
			hql = "from Product a where a.category<>'fashion' and a.category<>'electronics' and a.category<>'health' and a.category<>'motors' and a.category<>'collections' "
					+ "and a.category<>'sports'and a.category<>'interior'and a.category<>'beauty'";
		} else {
			hql = "from Product a where a.category='" + _category + "'";
		}

		Query query = sessionFactory.getCurrentSession().createQuery(hql);

		@SuppressWarnings("unchecked")
		List<Product> list = (List<Product>) query.list();
		return list;
	}

	@Override
	@Transactional
	public void insertProduct(Product product) {
		// TODO Auto-generated method stub
		Session session;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}

		session.save(product);

	}

	@Override
	@Transactional
	public void updateProduct(Product product) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession()
				.createQuery("update Product set bid_price=:bid_price, "
						+ "bidder=:bidder, "
						+ "bid_stack=:bid_stack "
						+ "where name=:name");
		query.setParameter("bid_price", product.getBid_price());
		query.setParameter("bidder", product.getBidder());
		query.setParameter("bid_stack", product.getBid_stack());
		System.out.println(product.getName());
		query.setParameter("name", product.getName());
		
		@SuppressWarnings("unchecked")
		
		int result = query.executeUpdate();
		System.out.println("쿼리업데이트들어감 프로덕트");
	}
}
