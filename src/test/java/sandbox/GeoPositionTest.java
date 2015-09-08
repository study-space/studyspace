package sandbox;

import org.junit.Test;

/**
 * <pre>
 *
 * </pre>
 *
 * @Author Hansoo, Choi
 * @Since 2015-08-31
 */
public class GeoPositionTest {

    /*
    select * from(
select
    lat,
    lon,
                (6371 * acos(cos(CAST(위도값 AS DOUBLE) * 3.141592653589793 / 180.0) * cos(GPS_LAT * 3.141592653589793 / 180.0)
               * cos((GPS_LON * 3.141592653589793 / 180.0) - (CAST(경도값 AS DOUBLE) * 3.141592653589793 / 180.0)) + sin(CAST(위도값 AS DOUBLE) * 3.141592653589793 / 180.0)
               * sin(GPS_LAT * 3.141592653589793 / 180.0))) AS DISTANCE
)
order by DISTANCE  asc
limit 1, 9;

SELECT *
  FROM (SELECT lat, lon
             , (distance계산식) distance
          FROM 테이블
         WHERE lat BETWEEN :위도값 - 10 AND :위도값 + 10
           AND lon BETWEEN :경도값 - 10 AND :경도값 + 10
           AND (distance계산식) <= 10
        ) a
 ORDER BY distance
 LIMIT 1, 9;


SELECT 가져올컬럼,
	(6371*acos(cos(radians(lat좌표값))*cos(radians(slLat))*cos(radians(slLng)
	-radians(lng좌표값))+sin(radians(lat좌표값))*sin(radians(slLat))))
	AS distance
FROM 대상테이블
HAVING distance <= 거리
ORDER BY distance
LIMIT 0,1000
     */


    // 인터넷에서 훔친 위/경도 거리 계산 메소드

    @Test
    public void TestGeoLocation() throws Exception {
        double sourceLongitude = 37.516258;
        double sourceLatitude = 127.114937;
        double targetLongitude = 37.516962;
        double targetLatitude = 127.112372;

        double result = calDistance(sourceLatitude, sourceLongitude, targetLatitude, targetLongitude);
        System.out.println("distance = " + result);
    }


    public double calDistance(double lat1, double lon1, double lat2, double lon2){

        double theta, dist;
        theta = lon1 - lon2;
        dist = Math.sin(deg2rad(lat1)) * Math.sin(deg2rad(lat2)) + Math.cos(deg2rad(lat1))
                * Math.cos(deg2rad(lat2)) * Math.cos(deg2rad(theta));
        dist = Math.acos(dist);
        dist = rad2deg(dist);

        dist = dist * 60 * 1.1515;
        dist = dist * 1.609344;    // 단위 mile 에서 km 변환.
        dist = dist * 1000.0;      // 단위  km 에서 m 로 변환

        return dist;
    }

    // 주어진 도(degree) 값을 라디언으로 변환
    private double deg2rad(double deg){
        return (double)(deg * Math.PI / (double)180d);
    }

    // 주어진 라디언(radian) 값을 도(degree) 값으로 변환
    private double rad2deg(double rad){
        return (double)(rad * (double)180d / Math.PI);
    }

}
