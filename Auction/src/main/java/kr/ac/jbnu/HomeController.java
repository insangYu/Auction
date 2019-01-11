package kr.ac.jbnu;

import java.sql.Connection;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.jbnu.dao.ProductDao;
import kr.ac.jbnu.model.Product;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private ProductDao productDao;


	@RequestMapping(value = { "/", "/home" }, method = RequestMethod.GET)
	public String home(@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "minprice", required = false) String minprice,
			@RequestParam(value = "maxprice", required = false) String maxprice,
			@RequestParam(value = "category", required = false) String category, Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		List<Product> list = productDao.queryProduct();
		model.addAttribute("productList", list);

		if (keyword != null) {
			list = productDao.querySearchedProduct(keyword);
		} else if (minprice != null && maxprice != null) {
			list = productDao.queryPriceSearchedProduct(minprice, maxprice);
		} else if (category != null) {
			System.out.println(category);
			list = productDao.queryCategorySearchedProduct(category);
		} else {
			list = productDao.queryProduct();
		}

		model.addAttribute("productList", list);

		return "homeView";
	}

}
