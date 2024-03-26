import React, { useEffect, useState } from 'react';
import './MapContainer.css'
import { markerdata } from "./markerData";

const { kakao } = window
/*global kakao*/

const Map= () => {
  // 검색결과 배열에 담아줌
  const [places, setPlaces] = useState([])

  useEffect(() => {
    mapscript();
  }, []);

  const mapscript = () => {
    let container = document.getElementById("map");
    let options = {
      center: new kakao.maps.LatLng(33.37245636567239, 126.52833144852052),
      level: 9,
    };

    //map
    const map = new kakao.maps.Map(container, options);
    
    //marker data 파일에서 가져옴
    markerdata.forEach((el) => {
      //마커를 생성
      const marker = new kakao.maps.Marker({
        //마커가 표시 될 지도
        map: map,
        //마커가 표시 될 위치
        position: new kakao.maps.LatLng(el.lat, el.lng),
      });
      // 마커에 표시할 인포윈도우를 생성합니다
      var infowindow = new kakao.maps.InfoWindow({
        content: el.price, // 인포윈도우에 표시할 내용
      });

      // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
      // 이벤트 리스너로는 클로저를 만들어 등록합니다
      // 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
      kakao.maps.event.addListener(
        marker,
        "mouseover",
        makeOverListener(map, marker, infowindow)
      );
      kakao.maps.event.addListener(
        marker,
        "mouseout",
        makeOutListener(infowindow)
      );
    });
    
    // 인포윈도우를 표시하는 클로저를 만드는 함수입니다
    function makeOverListener(map, marker, infowindow) {
      return function () {
        infowindow.open(map, marker);
      };
    }

    // 인포윈도우를 닫는 클로저를 만드는 함수입니다
    function makeOutListener(infowindow) {
      return function () {
        infowindow.close();
      };
    }
  };

  return (
    <div className='map__container'>
      <div id="map" style={{ width: "600px", height: "500px" }}></div>
      <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="제주 호텔" id="keyword" size="15"/> 
                    <button type="submit">검색하기</button> 
                </form>
            </div>
        </div>
        <ul id="places__list"></ul>
        <div id="pagination"></div>
      </div>
    </div>
  );
}

export default Map