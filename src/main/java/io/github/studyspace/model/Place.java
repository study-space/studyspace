package io.github.studyspace.model;

import lombok.Data;
import lombok.NoArgsConstructor;

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
@Data @NoArgsConstructor
public class Place implements Serializable {
    private @Id @GeneratedValue long id;
    private String name;
    private String address;
    private String telephoneNumber;
    private String url;
    @Embedded
    private Position position;

    // TODO DTO로 분리. 두객체의 연관관계에서만 나오는 값이다 이 값은 객체의 상태가 되어서는 안된다.
    @Transient
    private double distance;

    public Place(String name, Position position, String telephoneNumber, String address, String url) {
        this.name = name;
        this.address = address;
        this.position = position;
        this.telephoneNumber = telephoneNumber;
        this.url = url;
    }
}
