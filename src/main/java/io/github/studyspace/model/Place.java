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

    public Place(String name, Position position, String telephoneNumber, String address, String url) {
        this.name = name;
        this.address = address;
        this.position = position;
        this.telephoneNumber = telephoneNumber;
        this.url = url;
    }
}
