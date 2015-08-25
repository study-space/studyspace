package io.github.studyplace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
public class SampleController {

    @RequestMapping("/")
    String goToSamplePage(Model model){

        List<String> languages = new ArrayList<String>(){{
            add("Java");
            add("C++");
            add("Ceylon");
            add("Cobol");
        }};

        model.addAttribute("message", "Hello, World!");
        model.addAttribute("languages", languages);

        return "sample";
    }
}
