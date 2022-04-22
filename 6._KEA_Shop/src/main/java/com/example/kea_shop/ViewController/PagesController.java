package com.example.kea_shop.ViewController;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PagesController {

    @GetMapping("/")
    public String frontPage(Model model) {
        model.addAttribute("webshopName", "Kea Shop");
        return "index";
    }
}
