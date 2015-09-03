package io.github.studyplace.vo;

//Value Object
public class Location {
    //위도
    private double longitude;
    //경도
    private double latitude;

    public Location(double longitude, double latitude) {
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public double getLongitude() {
        return longitude;
    }

    public double getLatitude() {
        return latitude;
    }
}
