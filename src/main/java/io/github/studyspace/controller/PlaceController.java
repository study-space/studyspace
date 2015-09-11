package io.github.studyspace.controller;

import io.github.studyspace.model.Place;
import io.github.studyspace.model.Position;
import io.github.studyspace.service.CoordinateService;
import io.github.studyspace.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
            @RequestParam(value = "p", required = false) Position position,
            @RequestParam(value = "q", required = false) String query,
            @RequestParam(value = "d", defaultValue = "500") int distance
            //@RequestParam(value = "p", defaultValue = "1") int page
    ) {
        // 위치 정보가 없는 경우...?
        if((position.getLatitude() == 0 || position.getLongitude() == 0) && StringUtils.hasText(query)) {
            // API에서 쿼리를 기준으로 location 정보 추출
            throw new RuntimeException("작업필요.");
        }

        List<Place> placeList = coordinateService.getPlaceListForSpot(position, distance);
        model.addAttribute("query", query);
        model.addAttribute("distance", distance);
        model.addAttribute("placeList", placeList);
        model.addAttribute("requestLocation", position);

        return "place/place";
    }
}
