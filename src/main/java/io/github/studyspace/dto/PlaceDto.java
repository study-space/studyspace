package io.github.studyspace.dto;

import io.github.studyspace.model.Position;
import lombok.Data;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class PlaceDto {

    @Data
    public static class SearchResult{
        private @Id @GeneratedValue long id;
        private String name;
        private String address;
        private String telephoneNumber;
        private String url;
        private Position position;

        //검색결과가 여기 들어온다.
        private double distance;
    }

}
