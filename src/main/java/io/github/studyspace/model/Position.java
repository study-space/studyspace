package io.github.studyspace.model;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Embeddable;

//Value Object
@Embeddable
@Data
@NoArgsConstructor
public class Position {
    //위도
    private double longitude;
    //경도
    private double latitude;


    public Position(double latitude, double longitude) {
        this.longitude = longitude;
        this.latitude = latitude;
    }
}
