package kr.ac.jbnu;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Locale;

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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.jbnu.dao.CommentDao;
import kr.ac.jbnu.dao.ProductDao;
import kr.ac.jbnu.dao.UserAccountDao;
import kr.ac.jbnu.model.Comment;
import kr.ac.jbnu.model.Product;
import kr.ac.jbnu.model.UserAccount;
import kr.ac.jbnu.util.MyUtils;

/**
 * Handles requests for the application home page.
 */
@Controller
@SessionAttributes("userAccount")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);

	@Autowired
	private ProductDao productDao;

	@Autowired
	private CommentDao commentDao;

	@Autowired
	private UserAccountDao useraccountDao;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/detail", method = { RequestMethod.GET, RequestMethod.POST })
	public String detail(@RequestParam("product") String productCode, Locale locale, Model model,
			HttpServletRequest request, HttpServletResponse response) {
		logger.info("detailView!! productCode : " + productCode, locale);

		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		if (loginedUser == null) {
			model.addAttribute("sessionflag", false);
		} else {
			model.addAttribute("sessionflag", true);
		}
		Product product = null;
		String errorString = null;
		List<Comment> commentList = null;
		 product = productDao.findProduct(productCode);
	
////////////////////////////////////////////////////////
		model.addAttribute("errorString", errorString);
		model.addAttribute("product", product);
//////////////////////////////////////////////////
		return "detailView";
	}


	@RequestMapping(value = "/createProduct", method = RequestMethod.GET)
	public String createProductGet(Model model, HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		UserAccount loginedUser = MyUtils.getLoginedUser(session);

		if (loginedUser == null) {
			return "redirect:/user_register";
		}
		return "createProductView";
	}
//	//입찰성공페이지
//	@RequestMapping(value = "/finishBid", method = RequestMethod.GET)
//	public String FinishBid(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) {
//		HttpSession session = request.getSession();
//		System.out.println("finishBid");
//	
//		return "finishBidView";
//	}
	
	//입찰
	@RequestMapping(value = "/insertBid", method = RequestMethod.POST)
	public String InsertBidPost(Model model, @RequestParam("contents") String bid_price, @RequestParam("product") String productcode, 
		HttpServletRequest request, HttpServletResponse response) {

		System.out.println("insertBid실행");
		
		HttpSession session = request.getSession();
		UserAccount session_User = MyUtils.getLoginedUser(session);
		UserAccount bid_User = useraccountDao.findUser(session_User.getEmail(), session_User.getPassword());
		Product bid_product = productDao.findProduct(productcode);
		System.out.print(bid_User.getUserName() + "  ");
		System.out.println(bid_User.getBalance());
		System.out.print(bid_product.getName() + "  ");
		System.out.println(bid_product.getBid_price());
		if(bid_User.getBalance() < Integer.parseInt(bid_price)) {
			return "paymenterrorView";
		}
		if(bid_product.getBid_stack()==0) {
			int next_stack = bid_product.getBid_stack() + 1;
			int next_balance = bid_User.getBalance() - Integer.parseInt(bid_price);
			bid_User.setBalance(next_balance);
			System.out.println("셋밸런스");
			
			bid_product.setBid_price(bid_price);
			bid_product.setBidder(bid_User.getUserName());
			bid_product.setBid_stack(next_stack);
			System.out.println("셋프로덕트");
			
			productDao.updateProduct(bid_product);
			System.out.println("프로덕트 업데이트");
			useraccountDao.updateUserBalance(bid_User);
			System.out.println("입찰자 예치금 감소");
			
			return "finishBidView";
		}
		
		else {
			if(Integer.parseInt(bid_price) > Integer.parseInt(bid_product.getBid_price())) {
				System.out.println("if문 안 실행");
				UserAccount refund_bidUser = useraccountDao.findUserByName(bid_product.getBidder());
				System.out.println("전 입찰자 찾기 완료");
				int refund_balance = refund_bidUser.getBalance() + Integer.parseInt(bid_product.getBid_price());
				refund_bidUser.setBalance(refund_balance);
				useraccountDao.updateUserBalance(refund_bidUser);
				System.out.println("예치금 환불 완료");
				
				int next_stack = bid_product.getBid_stack() + 1;
				int next_balance = bid_User.getBalance() - Integer.parseInt(bid_price);
				bid_User.setBalance(next_balance);
				System.out.println("셋밸런스");
				
				bid_product.setBid_price(bid_price);
				bid_product.setBidder(bid_User.getUserName());
				bid_product.setBid_stack(next_stack);
				System.out.println("셋프로덕트");
				
				productDao.updateProduct(bid_product);
				System.out.println("프로덕트 업데이트");
				useraccountDao.updateUserBalance(bid_User);
				System.out.println("입찰자 예치금 감소");
				
				return "finishBidView";
			}
			else {
				return "paymenterrorView";
			}
		}
	}
	
	@RequestMapping(value = "/createProduct", method = RequestMethod.POST)
	public String createProductPost(Model model, @RequestParam("name") String name,
			@RequestParam("price") String price, @RequestParam("category") String category, @RequestParam("file") MultipartFile file,
			@RequestParam("description") String description,  @RequestParam("bid_price") String bid_price,
			HttpServletRequest request, HttpServletResponse response) {

		String UPLOAD_DIRECTORY = request.getSession().getServletContext().getRealPath("/resources/img");

		String image = null;

		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Create the file on server
				File serverFile = new File(UPLOAD_DIRECTORY + File.separator + file.getOriginalFilename());
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));

				String fname = file.getOriginalFilename();
				image = "resources/img/" + fname;

				stream.write(bytes);
				stream.close();

				logger.info("Server File Location=" + serverFile.getAbsolutePath());
			} catch (Exception e) {
			}
		} else {
			System.out.println("Image Error");
		}

		Product product = new Product();
		product.setBid_price(bid_price);
		product.setBid_stack(0);
		product.setCategory(category);
		product.setDescription(description);
		product.setImage(image);
		product.setPrice(price);
		product.setName(name);

		productDao.insertProduct(product);

		return "redirect:/home";
	}
}
