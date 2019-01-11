package kr.ac.jbnu.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.jbnu.model.Product;
import kr.ac.jbnu.model.UserAccount;

public class UserAccountDaoImpl implements UserAccountDao {
	private SessionFactory sessionFactory;

	public UserAccountDaoImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	@Transactional
	public UserAccount findUser(String userEmail, String password) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession()
				.createQuery("from UserAccount "
						+ "where user_email=:user_email "
						+ "and user_password=:user_password");
		query.setParameter("user_email", userEmail);
		query.setParameter("user_password", password);
		
		@SuppressWarnings("unchecked")
		List<UserAccount> list = (List<UserAccount>)query.list();
		
		return list.get(0);
	}
	
	@Override
	@Transactional
	public UserAccount QueryCurrentUser(UserAccount user) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession().createQuery("from user_account where id=:user_id");
		query.setString("id", user.getId());
		
		
		UserAccount result = (UserAccount)query.uniqueResult();
		
		return result;
	}

	
	@Override
	@Transactional
	public UserAccount findUserByName(String username) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession()
				.createQuery("from UserAccount "
						+ "where user_name=:user_name");
		query.setParameter("user_name", username);
		
		@SuppressWarnings("unchecked")
		List<UserAccount> list = (List<UserAccount>)query.list();
		
		return list.get(0);
	}

	@Override
	@Transactional
	public void addUserAccount(UserAccount user) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.getCurrentSession();
		session.save(user);
	}

	@Override
	@Transactional
	public List<UserAccount> queryUserAccount() {
		// TODO Auto-generated method stub
		@SuppressWarnings("unchecked")
		List<UserAccount> list = (List<UserAccount>)sessionFactory.getCurrentSession()
	                  	.createCriteria(UserAccount.class)
	                  	.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY).list();
		return list;
	}

	@Override
	@Transactional
	public boolean checkUserAccount(String userId) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession()
				.createQuery("from UserAccount "
						+ "where id=:user_id");
		query.setParameter("user_id", userId);
		
		@SuppressWarnings("unchecked")
		List<UserAccount> list = (List<UserAccount>)query.list();
		
		if(list.isEmpty())
			return false;
		else
			return true;
	}

	@Override
	@Transactional
	public void updateUserAccount(UserAccount userAccount) {
		// TODO Auto-generated method stub
		Query query = sessionFactory.getCurrentSession()
				.createQuery("update UserAccount set user_phone=:user_phone, "
						+ "user_name=:user_name, "
						+ "user_password=:user_password "
						+ "where user_id=:user_id");
		query.setParameter("user_phone", userAccount.getPhone());
		query.setParameter("user_name", userAccount.getUserName());
		query.setParameter("user_password", userAccount.getPassword());
		query.setParameter("user_id", userAccount.getId());
		
		@SuppressWarnings("unchecked")
		
		int result = query.executeUpdate();
	}
	
	@Override
	@Transactional
	public void updateUserBalance(UserAccount userAccount) {
		Query query = sessionFactory.getCurrentSession().createQuery("update UserAccount set balance=:user_balance "
				+ "where id=:user_id");
		
		query.setParameter("user_balance", userAccount.getBalance());
		query.setParameter("user_id", userAccount.getId());
		@SuppressWarnings("unchecked")

		int result = query.executeUpdate();
	}



}
