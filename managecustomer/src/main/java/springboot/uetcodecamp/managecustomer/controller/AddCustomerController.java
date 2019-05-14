package springboot.uetcodecamp.managecustomer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import springboot.uetcodecamp.managecustomer.model.Customer;
import springboot.uetcodecamp.managecustomer.service.CustomerService;

@Controller
public class AddCustomerController {
    @Autowired
    private CustomerService customerService;

    @PostMapping("/handleAddCustomer")
    public String handleAdd(@ModelAttribute("addCustomer") Customer customer) {
        customerService.insertCustomer(customer);
        return "redirect:/";
    }
}
