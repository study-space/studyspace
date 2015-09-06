package io.github.studyplace.controller;

import io.github.studyplace.model.Location;
import io.github.studyplace.model.Place;
import io.github.studyplace.service.CoordinateService;
import io.github.studyplace.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class PlaceController {

    @Autowired
    PlaceService placeService;

    @Autowired
    CoordinateService coordinateService;

    @RequestMapping(value = "/")
    public String viewIndex() {
        return "place/index";
    }


    @RequestMapping(value = "/place")
    public String viewSearch(
            Model model,
            @RequestParam(value = "l") Location location,
            @RequestParam(value = "q", required = false) String query,
            @RequestParam(value = "d", defaultValue = "500") int distance,
            @RequestParam(value = "p", defaultValue = "1") int page
    ) {
        List<Place> placeList = coordinateService.getPlaceListForSpot(location, distance);
        model.addAttribute("placeList", placeList);
        model.addAttribute("currentLocation", location);

        return "place/place";
    }
}
