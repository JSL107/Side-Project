import React, { useEffect } from 'react';
import './Map.css'

const Map= ({searchPlace}) => {
  const { kakao } = window
  /*global kakao*/
    
  var markers = [];
  var ps;
  var infowindow;
  var map;

  useEffect(() => {
    drawKeywordMap();
  }, []);
    
  const drawKeywordMap = () => {
    var mapContainer = document.getElementById('map'),
    mapOption = {
      center: new kakao.maps.LatLng(33.37245636567239, 126.52833144852052),
      level: 9 // 지도의 확대 레벨
    };  
    
    map = new kakao.maps.Map(mapContainer, mapOption); 
    ps = new kakao.maps.services.Places();  

    infowindow = new kakao.maps.InfoWindow({zIndex:1});
    searchPlaces();
  }
  
  
  const searchPlaces = () => {
    var keyword = document.getElementById('keyword').value;
    
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
      alert('키워드를 입력해주세요!');
        return false;
    }
        
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
  }
         
  const placesSearchCB = (data, status, pagination) => {
    if (status === kakao.maps.services.Status.OK) {
    displayPlaces(data);
    displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
      alert('검색 결과가 존재하지 않습니다.');
      return;

    } else if (status === kakao.maps.services.Status.ERROR) {
      alert('검색 결과 중 오류가 발생했습니다.');
      return;
    }
  }
  
  const displayPlaces = (places) => {
    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
            
    removeAllChildNods(listEl);
    removeMarker();
            
    for ( var i=0; i<places.length; i++ ) {

      var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x);
      var marker = addMarker(placePosition, i);
      var itemEl = getListItem(i, places[i]);

      bounds.extend(placePosition);
    
      (function(marker, title) {
        kakao.maps.event.addListener(marker, 'mouseover', function() {
          displayInfowindow(marker, title);
        });
    
          kakao.maps.event.addListener(marker, 'mouseout', function() {
            infowindow.close();
          });
  
          itemEl.onmouseover =  function () {
            displayInfowindow(marker, title);
          };
    
          itemEl.onmouseout =  function () {
            infowindow.close();
          };
         
        })(marker, places[i].place_name);
        fragment.appendChild(itemEl);
                
      }
      
      listEl.appendChild(fragment);
      menuEl.scrollTop = 0;
      map.setBounds(bounds);
    }
  
    const getListItem = (index, places) => {
      var el = document.createElement('li'),
      itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' 
                + '   <h5>' + places.place_name + '</h5>';
  
      if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' 
      } 
        
      itemStr += '  <span class="tel">' + places.phone  + '</span>' + '</div>';           
  
      el.innerHTML = itemStr;
      el.className = 'item';
  
      return el;
    }
  
    // 마커를 생성하고 지도 위에 마커를 표시
    const addMarker = (position, idx, title) => {
      var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png',
      imageSize = new kakao.maps.Size(36, 37),
      imgOptions =  {
        spriteSize : new kakao.maps.Size(36, 691), 
        spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), 
        offset: new kakao.maps.Point(13, 37) 
      },
      markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
      marker = new kakao.maps.Marker({
        position: position,
        image: markerImage 
      });
  
      marker.setMap(map);
      markers.push(marker); 
  
      return marker;
    }
  

    const removeMarker = () => {
      for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
      }   
      markers = [];
    }
  
    //pagination
    const displayPagination = (pagination) => {
      var paginationEl = document.getElementById('pagination'),
      fragment = document.createDocumentFragment(),
      i; 
  
      while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
      }
  
      for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        //el.href = "#";
        el.innerHTML = i;
  
        if (i===pagination.current) {
        el.className = 'on';
        } else {
        el.onclick = (function(i) {
          return function() {
            pagination.gotoPage(i);
          }
        })(i);
      }
  
      fragment.appendChild(el);
      }
    paginationEl.appendChild(fragment);
    }
  
    const displayInfowindow = (marker, title) => {
      var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
  

    const removeAllChildNods = (el) => {   
      while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
      }
    }
  
    return (
      <div className='mapContainer'>
        <div id="map" style={{ width: "100%", height: "500px" }}></div>
      
        <div id="menu_wrap" className="bg_white">
          <div className="option">
            <div>
              키워드 : <input type="text" defaultValue="서귀포 호텔" id="keyword" size="15" /> 
              <button onClick={searchPlaces}>검색하기</button> 
            </div>
          </div>
          <ul id="placesList"></ul>
          <div id="pagination"></div>
        </div>
      </div>
    );
  
  }
  
  export default Map;