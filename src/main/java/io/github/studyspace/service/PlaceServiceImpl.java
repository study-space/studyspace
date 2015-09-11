package io.github.studyspace.service;

import io.github.studyspace.model.Place;
import io.github.studyspace.repository.PlaceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <pre>
 *
 * </pre>
 *
 * @Author Hansoo, Choi
 * @Since 2015-08-25
 */
@Service
public class PlaceServiceImpl implements PlaceService {

    @Autowired
    private PlaceRepository placeRepository;

    public Place savePlace(Place place) {
        return placeRepository.save(place);
    }

    @Override
    public List<Place> getPlaceAllList() {
        return (List<Place>) placeRepository.findAll();
    }

    @Override
    public List<Place> getPlaceList(Place place) {
        return null;
    }

    @Override
    public Place getPlace(Long id) {
        return placeRepository.findOne(id);
    }

}
