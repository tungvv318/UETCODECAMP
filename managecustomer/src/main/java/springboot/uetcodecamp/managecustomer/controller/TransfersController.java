package springboot.uetcodecamp.managecustomer.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import springboot.uetcodecamp.managecustomer.model.Customer;
import springboot.uetcodecamp.managecustomer.service.CustomerService;

import javax.servlet.http.HttpSession;

@Controller
public class TransfersController {
    @Autowired
    private CustomerService customerService;

    @PostMapping("/chuyentien")
    public String handleFormBank(ModelMap modelMap,
                                 @RequestParam(name = "idCustomerTransfers") Integer idCustomerTransfers,
                                 HttpSession session) {
        session.setAttribute("idCustomerTransfers", idCustomerTransfers);
        // thêm số tiền mà customer đang chuyển hiện có là bao nhiêu để kiểm tra nếu chuyển hơn tiền
        modelMap.addAttribute("maxMoney", customerService.getCustomerByID(idCustomerTransfers).getBalance());
        return "chuyentien";
    }

    @PostMapping("/handleChuyenTien")
    public String handleChuyenChuyen(ModelMap modelMap,
                                     @RequestParam(name = "idCustmerReceive") Integer idCustmerReceive,
                                     @RequestParam(name = "moneyCustomerReceive") Integer moneyCustomerReceive,
                                     HttpSession session){
        // lấy id của customer đang  thực hiện chuyển tiền
        int idCustomerTransfers = (int)session.getAttribute("idCustomerTransfers");
        // thực hiện xóa session
        session.removeAttribute("idCustomerTransfers");
        // lấy customer có id = idCustomerTransfers ra
        Customer customerTransfers = customerService.getCustomerByID(idCustomerTransfers);
        // nếu số tiền mà customerTransfers hiện có chuyển >= số tiền định chuyển thì chuyển thành công
        if(customerTransfers.getBalance() >= moneyCustomerReceive){
            // lấy customer có id = idCustmerReceive
            Customer customerReceive = customerService.getCustomerByID(idCustmerReceive);
            // tăng tiền cho custmerReceive
            customerReceive.setBalance(customerReceive.getBalance() + moneyCustomerReceive);
            // giản tiền của customerTransfers
            customerTransfers.setBalance(customerTransfers.getBalance() - moneyCustomerReceive);
            // update lại
            customerService.updateCustomer(customerReceive);
            customerService.updateCustomer(customerTransfers);
            modelMap.addAttribute("customer", customerTransfers);
            return "formbank";
        }
        else{
            return "error";
        }
    }
}
