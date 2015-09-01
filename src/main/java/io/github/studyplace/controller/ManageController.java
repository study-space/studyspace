package io.github.studyplace.controller;

import io.github.studyplace.model.Place;
import io.github.studyplace.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <pre>
 *
 * </pre>
 *
 * @Author Hansoo, Choi
 * @Since 2015-08-31
 */
@Controller
public class ManageController {

    @Autowired
    PlaceService placeService;


    @RequestMapping("/management/places")
    public String getPlaceList(Model model, HttpServletRequest request) {
        List<Place> placeList = placeService.getPlaceAllList();
        model.addAttribute("placeList", placeList);

        return "management/list";
    }

    @RequestMapping(value="/management/place/form", method=RequestMethod.GET)
    public String placeForm(Model model, @RequestParam(name="p", required = false, defaultValue = "0") long p, HttpServletRequest request) {
        Place place = new Place();
        if(p > 0) {
            place = placeService.getPlace(p);
        }
        model.addAttribute("place", place);

        return "management/form";
    }

    @RequestMapping(value="/management/place/save", method=RequestMethod.POST)
    public String savePlace(Place place, HttpServletRequest request) {
        placeService.savePlace(place);
        return "redirect:/management/places";
    }
}