package kr.ac.jbnu.dao;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.jbnu.model.Comment;

public class CommentDaoImpl implements CommentDao {
	private SessionFactory sessionFactory;

	public CommentDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public List<Comment> findCommentsById(int board_id) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Comment where board_id=:id");
		query.setInteger("id", board_id);

		@SuppressWarnings("unchecked")
		List<Comment> list = (List<Comment>) query.list();
		return list;
	}

	@Override
	@Transactional
	public void insertComment(Comment comment) {
		Session session;

		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}
		session.save(comment);

	}
	@Override
	@Transactional
	public List<Comment> findCommentsByproductId(String productCode) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Comment where product_id=:id");
		query.setInteger("id", Integer.parseInt(productCode));

		@SuppressWarnings("unchecked")
		List<Comment> list = (List<Comment>) query.list();
		return list;
	}

}
