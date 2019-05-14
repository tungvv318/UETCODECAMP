package springboot.uetcodecamp.managecustomer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import springboot.uetcodecamp.managecustomer.model.Customer;
import springboot.uetcodecamp.managecustomer.service.CustomerService;

@Controller
public class LoginController {
    @Autowired
    private CustomerService customerService;

    @GetMapping("/login")
    public String login(ModelMap modelMap) {
        return "login";
    }

    private Customer findCustomer(String email, String password){
        Customer customerFind = customerService.getCustomerByEmail(email);
        if(customerFind==null){
            return null;
        }
        else {
            if (password.equals("123456")) {
                return customerFind;
            } else
                return null;
        }
    }


    @PostMapping("/handleLogin")
    public String handleLogin(ModelMap modelMap,
                              @RequestParam(name = "email-login") String email,
                              @RequestParam(name = "password-login") String password){
        // tìm customer theo email và password
        Customer customerFind = findCustomer(email, password);

        // nếu tìm được thì vào trang chuyển tiền
        if (customerFind != null){
            modelMap.addAttribute("customer", customerFind);
            return "formbank";
        }
        // không đăng nhập được thì thông báo lỗi
        return "error";
    }

}
