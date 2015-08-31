package io.github.studyplace.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 * <pre>
 *
 * </pre>
 *
 * @Author Hansoo, Choi
 * @Since 2015-08-25
 */
@Entity
@Table(name = "PLACE")
public class Place implements Serializable {

    private static final long serialVersionUID = -2850734990124055219L;

    @Id
    @GeneratedValue
    // ID
    private long id;

    // 장소명
    @Column
    private String name;

    // 주소
    @Column
    private String address;

    // 경도
    @Column
    private double longitude;

    // 위도
    @Column
    private double latitude;

    // 전화번호
    @Column
    private String telephoneNumber;

    // 거리
    private double distance;

    public Place() {

    }

    public Place(long id, String name, double longitude, double latitude) {
        this.id = id;
        this.name = name;
        this.longitude = longitude;
        this.latitude = latitude;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getLongitude() {
        return longitude;
    }

    public void setLongitude(double longitude) {
        this.longitude = longitude;
    }

    public double getLatitude() {
        return latitude;
    }

    public void setLatitude(double latitude) {
        this.latitude = latitude;
    }

    public String getTelephoneNumber() {
        return telephoneNumber;
    }

    public void setTelephoneNumber(String telephoneNumber) {
        this.telephoneNumber = telephoneNumber;
    }

    public double getDistance() {
        return distance;
    }

    public void setDistance(double distance) {
        this.distance = distance;
    }

    @Override
    public String toString() {
        return "Place{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", address='" + address + '\'' +
                ", longitude=" + longitude +
                ", latitude=" + latitude +
                ", telephoneNumber='" + telephoneNumber + '\'' +
                '}';
    }
}
