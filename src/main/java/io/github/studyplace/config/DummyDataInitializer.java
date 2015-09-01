package io.github.studyplace.config;

import io.github.studyplace.model.Place;
import io.github.studyplace.service.PlaceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;


//TODO 패키지 분리하기

/**
 * 테스트 단계에서 활용되는 더미 데이터를 입력한다.
 */
@Component
public class DummyDataInitializer {

    @Autowired
    private PlaceService placeService;

    @PostConstruct
    public void init(){
        addDummyData();
    }

    public void addDummyData() {
        //TODO place를 빌더패턴으로 생성하도록 정의할 것.
        placeService.savePlace(
                new Place("토즈 방이", "서울특별시 송파구 방이2동 44", 37.516962, 127.112372, "070-4987-7998")
        );

        placeService.savePlace(
                new Place("노량진스터디룸", "서울특별시 동작구 노량진동", 37.5128395, 126.9451906, "070-4670-7949")
        );
    }
}
