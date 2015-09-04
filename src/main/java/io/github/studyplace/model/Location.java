package io.github.studyplace.model;

import javax.persistence.Embeddable;

//Value Object
@Embeddable
public class Location {
    //위도
    private double longitude;
    //경도
    private double latitude;

    public Location(){

    }

    public Location(double longitude, double latitude) {
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public double getLatitude() {
        return latitude;
    }
}
