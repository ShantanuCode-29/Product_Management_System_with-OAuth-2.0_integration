package com.nt.controller;
import java.util.List;
import java.util.Map;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.entity.Product;
import com.nt.srvice.IProductMangementService;
import com.nt.srvice.UserRegistrationService;

import jakarta.validation.Valid;
@Controller
public class ProductController
{
	@Autowired
	private  UserRegistrationService userservice;
	
	
	@Autowired
	private IProductMangementService service;
	
@GetMapping("/")
	public String showHome()
	{
System.out.println("home controller is executing");
		return "home";
	}

/*@GetMapping("/login")
public String customLogin()
{
	System.out.println("login controller is executing");
    return "loginpage"; // This loads WEB-INF/pages/login.jsp correctly
}*/



/*@GetMapping("/report")
public String showreport(Map<String,Object>map)
{
	List<Product> showproduct = service.showproduct();
	showproduct.forEach(System.out::println);
	  map.put("productList", showproduct);
	
return "show_report";
}*/

@GetMapping("/add")
public String addProduct(@ModelAttribute("newprod") Product prod)
{
	
	return "register_prod";
}

/*@PostMapping("/add")
public String registerProduct(@ModelAttribute("newprod") Product prod,Map<String, Object>map)
{
	String registerProduct = service.registerProduct(prod);
	
	List<Product> showproduct = service.showproduct();
	map.put("register",registerProduct);
	map.put("productList", showproduct);
	return "show_report"; 
}*/


@PostMapping("/add")
public String registerProduct(
        @Valid @ModelAttribute("newprod") Product prod,  // validate data
        BindingResult errors,                            // capture errors
        RedirectAttributes attr) {

    if (errors.hasErrors()) {
        // Validation failed → Reload Add form page with error messages
        return "register_prod";
    }

    // Validation passed → Save and redirect
    String registerProduct = service.registerProduct(prod);
    attr.addFlashAttribute("register", registerProduct);
    return "redirect:/report";
}



@GetMapping("/edit")
public String showeditProduct(@RequestParam("pid")Integer id,@ModelAttribute("prod")Product product)
{
	Product product1 = service.getProductbyid(id);
	BeanUtils.copyProperties(product1, product);
	return "update_prod";
}


@PostMapping("/edit")
public String editProduct(
        @Valid @ModelAttribute("prod") Product product,
        BindingResult errors,
        RedirectAttributes attr) {

    if (errors.hasErrors()) {
        return "update_prod"; // ⬅️ Return same page if validation fails
    }

    String msg = service.updateProduct(product);
    attr.addFlashAttribute("register", msg);

    return "redirect:/report";
}




@GetMapping("/delete")
public String deleteProduct(@RequestParam("pid")Integer id, Model model)
{
	String deletebyId = service.deletebyId(id);
	model.addAttribute("msg", deletebyId);
	return"forward:report";
}



	@GetMapping("/report")
	public String fetchdatabypage(@PageableDefault(page=0,size=5,sort="name",direction = Sort.Direction.ASC)Pageable pageable
			                      ,Map<String, Object>map)
	{	
		Page<Product> showdatabyPage = service.showdatabyPage(pageable);
	     map.put("productList",showdatabyPage );
		return"show_report";
	}
	
	
	
	@GetMapping("/search")
	public String showSearchPage(@ModelAttribute("prod") Product product, Model model) {

	    // Default search settings → ascending sorting by name
	    List<Product> list = service.showProductByExampleObj(product, true, "name");

	    model.addAttribute("prodList", list);
	    model.addAttribute("order", true);
	    model.addAttribute("sortProp", "name");

	    return "search_prod"; // Your JSP page name
	}
	
	
	
	@PostMapping("/search")
	public String searchProduct(
	        @ModelAttribute("prod") Product product,
	        @RequestParam(defaultValue = "true") boolean order,
	        @RequestParam(defaultValue = "name") String sortProp,
	        Model model) {

	    List<Product> list = service.showProductByExampleObj(product, order, sortProp);
	    model.addAttribute("prodList", list);
	    model.addAttribute("order", order);
	    model.addAttribute("sortProp", sortProp);

	    return "search_prod";
	}
	
	
	   @GetMapping("/register")
	    public String showRegisterPage() {
	        return "register";
	    }

	    @PostMapping("/register")
	    public String registerUser(@RequestParam String username,
	                               @RequestParam String password,
	                               Model model) {

	       userservice.registerUser(username, password, "ROLE_USER");

	        model.addAttribute("msg", "Registration successful! Please login.");
	        return "login";   // Spring Default Login Page
	    }


}
