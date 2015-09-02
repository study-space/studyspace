package io.github.studyplace.controller;

import io.github.studyplace.model.Place;
import io.github.studyplace.service.CoordinateService;
import io.github.studyplace.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class PlaceController {

    @Autowired
    PlaceService placeService;

    @Autowired
    CoordinateService coordinateService;

    @RequestMapping(value="/")
    public String viewIndex() {
        return "place/index";
    }


    @RequestMapping(value="/place")
    public String viewSearch(Model model, HttpServletRequest request) {
        String[] geoLocation = request.getParameter("l").split(",");
        List<Place> placeList = coordinateService.getPlaceListForSpot(Double.parseDouble(request.getParameter("d")), Double.parseDouble(geoLocation[0]), Double.parseDouble(geoLocation[1]));

        model.addAttribute("placeList", placeList);

        return "place/place";
    }
}
