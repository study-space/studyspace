package io.github.studyplace.controller.converter;

import io.github.studyplace.model.Location;
import org.springframework.core.convert.converter.Converter;

public class LocationParamterConverter implements Converter<String, Location> {

    @Override
    public Location convert(String locationStr) {
        String[] splittedLocationStr = locationStr.split(",");
        double longitude = new Double(splittedLocationStr[0]);
        double latitude = new Double(splittedLocationStr[1]);

        return new Location(longitude, latitude);
    }
}