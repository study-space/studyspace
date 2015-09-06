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
            @RequestParam(value = "l", required = false) Location location,
            @RequestParam(value = "q", required = false) String query,
            @RequestParam(value = "d", defaultValue = "500") int distance,
            @RequestParam(value = "p", defaultValue = "1") int page
    ) {
        // 위치 정보가 없는 경우...?
        if((location.getLatitude() == 0 || location.getLongitude() == 0) && StringUtils.hasText(query)) {
            // API에서 쿼리를 기준으로 location 정보 추출
        }

        List<Place> placeList = coordinateService.getPlaceListForSpot(location, distance);
        model.addAttribute("query", query);
        model.addAttribute("distance", distance);
        model.addAttribute("placeList", placeList);
        model.addAttribute("currentLocation", location);

        return "place/place";
    }
}
