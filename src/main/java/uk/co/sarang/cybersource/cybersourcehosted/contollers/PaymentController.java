package uk.co.sarang.cybersource.cybersourcehosted.contollers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class PaymentController {
    @GetMapping("/")
    public String welcome(Map<String, Object> model) {
        return "payment_form";
    }
    @PostMapping("/payment_confirmation" )
    public String paymentConfirmation(Map<String, Object> model) {
        return "payment_confirmation";
    }

}
