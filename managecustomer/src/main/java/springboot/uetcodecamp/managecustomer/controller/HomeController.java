package springboot.uetcodecamp.managecustomer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import springboot.uetcodecamp.managecustomer.model.Customer;
import springboot.uetcodecamp.managecustomer.service.CustomerService;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private CustomerService customerService;

    @GetMapping("/")
    public String home(ModelMap modelMap){
        List<Customer> lstAllCustomer = customerService.getAllCustomer();
        modelMap.addAttribute("lstCustomer",lstAllCustomer);
        return "home";
    }

    @PostMapping("/handle")
    public String handleForm(ModelMap model,
                             @RequestParam(name = "modeActive") String modeActive,
                             @RequestParam(name = "idCustomer") Integer idCustomer,
                             @RequestParam(name = "searchCustomer") String searchCustomerByText){
        if ("Add".equals(modeActive)) {
            model.addAttribute("addCustomer", new Customer());
            return "formadd";
        }
        else if("Search".equals(modeActive)){
            List<Customer> lstCustomerSearchByText = customerService.searchCustomerByText(searchCustomerByText);
            model.addAttribute("lstCustomer",lstCustomerSearchByText);
            return "home";
        }
        else if ("Edit".equals(modeActive)) {
            Customer editCustomer = customerService.getCustomerByID(idCustomer);
            model.addAttribute("editCustomer", editCustomer);
            return "formedit";
        }
        else
            {
            Customer deleteCustomer = customerService.getCustomerByID(idCustomer);
            customerService.deleteCustomer(deleteCustomer);
            return "redirect:/";
            }
    }
}
