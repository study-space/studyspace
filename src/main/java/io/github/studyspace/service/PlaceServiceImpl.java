package io.github.studyspace.service;

import io.github.studyspace.dto.PlaceDto;
import io.github.studyspace.model.Place;
import io.github.studyspace.repository.PlaceRepository;
import org.modelmapper.ModelMapper;
import org.modelmapper.TypeToken;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.lang.reflect.Type;
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

    @Autowired
    ModelMapper modelMapper;

    public Place savePlace(Place place) {
        return placeRepository.save(place);
    }

    @Override
    public List<PlaceDto.SearchResult> getPlaceAllList() {
        List<Place> places = placeRepository.findAll();
        Type type = new TypeToken<List<PlaceDto.SearchResult>>() {}.getType();
        List<PlaceDto.SearchResult> placeList = modelMapper.map(places, type);

        System.out.println(placeList);
        return placeList;
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
