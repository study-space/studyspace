package io.github.studyspace.service;

import io.github.studyspace.model.Place;
import io.github.studyspace.model.Position;

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

    List<Place> getPlaceListForSpot(Position location, double distance);

}
