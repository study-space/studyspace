package io.github.studyspace.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 중요하지 않은 정보들에 대한 페이지 매핑
 */
@Controller
public class MetaController {
    @RequestMapping("/about")
    public String about(){
        return "meta/about";
    }
}
