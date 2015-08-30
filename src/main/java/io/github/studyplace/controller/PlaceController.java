package io.github.studyplace.controller;

import io.github.studyplace.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlaceController {

    @Autowired
    PlaceService placeService;

    @RequestMapping(value="/")
    public String viewIndex() {
        return "page/index";
    }


    @RequestMapping(value="/place")
    public String viewSearch() {
        return "page/place";
    }
}
