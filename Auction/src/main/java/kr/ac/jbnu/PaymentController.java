package kr.ac.jbnu;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.*;
import org.springframework.stereotype.Controller;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestTemplate;


@Controller
public class PaymentController {
    @Autowired
    PaymentRestController paymentRestController;

   
    @RequestMapping(value = "/testPage",method = RequestMethod.GET)
    public String testPage() {
        System.out.println("### [STEP1] ###");

        return "new";
    }

    
    @RequestMapping(value = "/payment")
    public String provePayment(String pg_token) {
        System.out.println("### [STEP3] ###");

        //寃곗젣 �듅�씤�쓣 �쐞�븳 kakao api�샇異�
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        headers.add("Authorization","KakaoAK 08de933d1cd91e5ec1a3fbe68f42b8a8");

        MultiValueMap<String, String> map= new LinkedMultiValueMap<String, String>();
        map.add("cid", "TC0ONETIME");
        map.add("tid", paymentRestController.getTestTid());
        map.add("partner_order_id", "partner_order_id");
        map.add("partner_user_id", "partner_user_id");
        map.add("pg_token", pg_token);

        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<MultiValueMap<String, String>>(map, headers);

        
        ResponseEntity<String> response = restTemplate.postForEntity( "https://kapi.kakao.com/v1/payment/approve", request , String.class );

       
        if(response.getStatusCode() == HttpStatus.OK) {
            return "paymentView";
        } else {
            return "paymenterrorView";
        }
    }
}
