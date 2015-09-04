package io.github.studyplace.service;

import io.github.studyplace.model.Location;
import io.github.studyplace.model.Place;

import java.util.List;

/**
 * <pre>
 *
 * </pre>
 *
 * @Author Hansoo, Choi
 * @Since 2015-08-25
 */
public interface CoordinateService {

    // 좌표정보를 파라미터로 일일이 받을 것인가?
    // long diffDistance(long fromLoc, long fromLat, long toLoc, long toLat);

    List<Place> getPlaceListForSpot(Location location, double distance);

}
