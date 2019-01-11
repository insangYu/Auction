package kr.ac.jbnu.dao;

import java.util.List;

import kr.ac.jbnu.model.UserAccount;

public interface UserAccountDao {
	public UserAccount findUser(String userEmail, String password);
	public UserAccount findUserByName(String username);
	public void addUserAccount(UserAccount user);
	public List<UserAccount> queryUserAccount();
	public boolean checkUserAccount(String userId);
	public void updateUserAccount(UserAccount userAccount);
	public void updateUserBalance(UserAccount userAccount);
	public UserAccount QueryCurrentUser(UserAccount user);
}
