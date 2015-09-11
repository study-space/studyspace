package io.github.studyspace.controller.converter;

import io.github.studyspace.model.Position;
import org.springframework.core.convert.converter.Converter;

public class PositionParamterConverter implements Converter<String, Position> {

    @Override
    public Position convert(String locationStr) {
        String[] splittedLocationStr = locationStr.split(",");
        double latitude = new Double(splittedLocationStr[0]);
        double longitude = new Double(splittedLocationStr[1]);

        return new Position(latitude, longitude);
    }
}