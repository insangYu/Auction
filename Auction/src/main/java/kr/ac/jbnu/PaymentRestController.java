package kr.ac.jbnu;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import kr.ac.jbnu.dao.ProductDao;
import kr.ac.jbnu.model.KakaoResultModel;
import kr.ac.jbnu.model.Product;

@RestController

public class PaymentRestController {
    private static String testTid;
    
    @Autowired
    private ProductDao productdao;
  
    @RequestMapping(value = "/getReadyPage", method = RequestMethod.POST)
    public KakaoResultModel getReadyPage(@RequestParam("product") String productCode, Locale locale, Model modle)
    {
        System.out.println("### [STEP2 ]寃곗젣以�鍮�  ###");

       
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        Product product = productdao.findProduct(productCode);

        headers.add("Authorization","KakaoAK 08de933d1cd91e5ec1a3fbe68f42b8a8");

       
        MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
        map.add("cid", "TC0ONETIME");
        map.add("partner_order_id", "partner_order_id");
        map.add("partner_user_id", "partner_user_id");
        map.add("item_name", product.getName());
        map.add("quantity", "1");
        map.add("total_amount", product.getPrice());
        map.add("vat_amount", "200");
        map.add("tax_free_amount", "0");
        map.add("approval_url", "http://localhost:8080/jbnu/payment");
        map.add("fail_url", "http://localhost:8080/jbnu/payment");
        map.add("cancel_url", "http://localhost:8080/jbnu/payment");

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

       
        ResponseEntity<KakaoResultModel> response = restTemplate.postForEntity( "https://kapi.kakao.com/v1/payment/ready", request , KakaoResultModel.class );

       
        testTid = response.getBody().getTid();

        return response.getBody();
    }

  
    public String getTestTid() {
        return testTid;
    }

}
