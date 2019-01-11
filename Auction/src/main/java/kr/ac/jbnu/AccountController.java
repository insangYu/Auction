package kr.ac.jbnu;

import java.io.IOException;
import java.util.Locale;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.jbnu.dao.UserAccountDao;
import kr.ac.jbnu.model.UserAccount;
import kr.ac.jbnu.util.MyUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AccountController {
	private static final Logger logger = LoggerFactory.getLogger(AccountController.class);

	@Autowired
	private UserAccountDao userAccountDao;

	@RequestMapping(value = "/user_register", method = RequestMethod.GET)
	public String registerGet(Locale locale, Model model) {
		logger.info("userRegisterView", locale);

		return "userRegisterView";
	}

	@RequestMapping(value = "/user_register", method = RequestMethod.POST)
	public void registerPost(@RequestParam("id") String id, @RequestParam("name") String name,
			@RequestParam("email") String email, @RequestParam("password") String password,
			@RequestParam("phone") String phone, Locale locale, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		logger.info("userRegisterPost", locale);

		String errorString = null;

		if (id.equals("") || name.equals("") || email.equals("") || password.equals("") || phone.equals("")) {
			errorString = "error";
		}

		UserAccount user = new UserAccount();
		
		user.setId(id);
		user.setUserName(name);
		user.setEmail(email);
		user.setPassword(password);
		user.setPhone(phone);
		user.setBalance(0);
		
		userAccountDao.addUserAccount(user);
	}

	@RequestMapping(value = "/user_edit", method = RequestMethod.GET)
	public String editUserGet(Locale locale, Model model) {
		logger.info("editUserAccountView!!", locale);

		return "editUserAccountView";
	}

	@RequestMapping(value = "/user_edit", method = RequestMethod.POST)
	public String editUserPost(Locale locale, Model model, @RequestParam("name") String name,
			@RequestParam("password") String password, @RequestParam("phone") String phone,
			HttpServletRequest request) {
		logger.info("editUserPost!! name : " + name, locale);

		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		UserAccount user = new UserAccount();
		user.setId(loginedUser.getId());
		user.setUserName(name);
		user.setPassword(password);
		user.setPhone(phone);
		user.setEmail(loginedUser.getEmail());

		userAccountDao.updateUserAccount(user);

		return "redirect:/home";
	}

	@RequestMapping(value = "/balance_edit", method = RequestMethod.POST)
	public String editBalancePost(Locale locale, Model model, @RequestParam("balance") String balance,
			HttpServletRequest request) {
		logger.info("editBalanceView", locale);
		HttpSession session = request.getSession();
		UserAccount sessionUser = MyUtils.getLoginedUser(session);
		UserAccount loginedUser = userAccountDao.findUser(sessionUser.getEmail(), sessionUser.getPassword());

		int temp = Integer.parseInt(balance);
		int updateBalance = temp + loginedUser.getBalance();

		UserAccount user = new UserAccount();
		user.setId(loginedUser.getId());
		user.setUserName(loginedUser.getUserName());
		user.setPassword(loginedUser.getPassword());
		user.setPhone(loginedUser.getPhone());
		user.setBalance(updateBalance);

		userAccountDao.updateUserBalance(user);

		return "redirect:/home";
	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void isLoggedin(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("LoginView", locale);

		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		response.setContentType("text/plain");

		try {
			// Not logged in
			if (loginedUser == null) {
				response.getWriter().write("not logged in");
				return;
			} else {
				response.getWriter().write("logged in");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public void loginPost(Locale locale, Model model, @RequestParam("email") String email,
			@RequestParam("password") String password, @RequestParam("rememberMe") String rememberMe,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		logger.info("loginPost!! email : " + email, locale);

		boolean remember = "Y".equals(rememberMe);

		UserAccount user = null;
		boolean hasError = false;
		String errorString = null;

		if (email == null || password == null || email.length() == 0 || password.length() == 0) {
			hasError = true;
			errorString = "Required username and password!";
		} else {


			// Find the user in the DB.
			user = userAccountDao.findUser(email, password);
			if (user == null) {
				hasError = true;
				errorString = "User Name or password invalid";
			}
		}
		// If error, forward to /WEB-INF/views/login.jsp
		if (hasError) {
			System.out.println(errorString);
			try {
				notFoundHandler(response);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		// If no error
		// Store user information in Session
		// And redirect to userInfo page.
		else {
			System.out.println("로그인성공");
			HttpSession session = request.getSession();
			MyUtils.storeLoginedUser(session, user);

			// If user checked "Remember me".
			if (remember) {
				MyUtils.storeUserCookie(response, user);
			}
			// Else delete cookie.
			else {
				MyUtils.deleteUserCookie(response);
			}

			response.setContentType("text/plain");

		}
	}

	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public void logout(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("LogoutView", locale);

		HttpSession session = request.getSession();
		session.invalidate();
		MyUtils.deleteUserCookie(response);
	}

	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public String myPageGet(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("myPage", locale);
			
		HttpSession session = request.getSession();

		UserAccount currentUser = MyUtils.getLoginedUser(session);
		UserAccount realUser = userAccountDao.findUser(currentUser.getEmail(), currentUser.getPassword());
		
		model.addAttribute("user_name", realUser.getUserName());
		model.addAttribute("user_balance", realUser.getBalance());
		model.addAttribute("user_id", realUser.getId());
		return "myPageView";
	}

	@RequestMapping(value = "/balance_edit", method = RequestMethod.GET)
	public String editBalanceGet(Locale locale, Model model) {
		logger.info("editBalanceView", locale);

		return "editBalanceView";
	}
	   

	private void notFoundHandler(HttpServletResponse response) throws IOException {
		response.setStatus(response.SC_NOT_FOUND);
		response.setContentType("text/plain;charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("紐살갼寃좊떦");
	}
}
