package io.github.studyspace.model;

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
    private String name;

    @Embedded
    private Position position;

    private String address;

    // 전화번호
    private String telephoneNumber;

    private String url;

    // 거리
    // TODO DTO로 분리. 두객체의 연관관계에서만 나오는 값이다 이 값은 객체의 상태가 되어서는 안된다.
    @Transient
    private double distance;

    public Place() {

    }

    public Place(String name, Position position, String telephoneNumber, String address, String url) {
        this.name = name;
        this.address = address;
        this.position = position;
        this.telephoneNumber = telephoneNumber;
        this.url = url;
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


    public Position getPosition() {
       return position;
    }

    public void setPosition(Position position) {
        this.position = position;
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

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("Place{");
        sb.append("id=").append(id);
        sb.append(", name='").append(name).append('\'');
        sb.append(", address='").append(address).append('\'');
        sb.append(", position=").append(this.getPosition());
        sb.append(", telephoneNumber='").append(telephoneNumber).append('\'');
        sb.append(", distance=").append(distance);
        sb.append('}');
        return sb.toString();
    }
}
