package io.github.studyspace.service;

import io.github.studyspace.model.Place;

import java.util.List;

/**
 * <pre>
 *
 * </pre>
 *
 * @Author Hansoo, Choi
 * @Since 2015-08-25
 */
public interface PlaceService {

    Place savePlace(Place place);

    List<Place> getPlaceAllList();

    List<Place> getPlaceList(Place place);

    Place getPlace(Long id);

}
