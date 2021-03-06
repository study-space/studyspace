package io.github.studyspace.service;

import io.github.studyspace.StudySpaceApplication;
import io.github.studyspace.model.Place;
import io.github.studyspace.model.Position;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.SpringApplicationConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import static org.junit.Assert.assertEquals;

/**
 * <pre>
 *
 * </pre>
 *
 * @Author Hansoo, Choi
 * @Since 2015-08-27
 */
@RunWith(SpringJUnit4ClassRunner.class)
@SpringApplicationConfiguration(classes = StudySpaceApplication.class)
@WebAppConfiguration
public class PlaceServiceImplTest {

    @Autowired
    private PlaceService placeService;

    @Test
    public void testSavePlace() throws Exception {

        Place place = new Place();
        place.setName("테스트");
        place.setAddress("서울특별시 송파구 방이2동 44");
        place.setPosition(new Position(37.516962, 127.112372));
        place.setTelephoneNumber("070-4987-7998");

        place = placeService.savePlace(place);


        Place result = placeService.getPlace(place.getId());

        assertEquals(place.getId(), result.getId());
    }
}
