package io.github.studyplace.controller;

import io.github.studyplace.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * <pre>
 *
 * </pre>
 *
 * @Author Hansoo, Choi
 * @Since 2015-08-25
 */
@RestController
public class PlaceController {

    @Autowired
    PlaceService placeService;


    @RequestMapping(value="/places")
    @ResponseBody
    public String getPlaceList(HttpServletRequest request) {
        return "";
    }

    // 위도와 경도는 parameter로?
    @RequestMapping(value="/place", method = RequestMethod.GET)
    @ResponseBody
    public String getPlaceListNearMe(HttpServletRequest request) {
        return "";
    }

    public String savePlace(HttpServletRequest request) {
        return "";
    }

}
