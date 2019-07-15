/**
 * 2019-07-09 카카오 맵 관련 function
 */
var ps = null;
var infowindow = null;
var markers = [];
var map = null;
var geocoder = null;
var marker = null;
//마커 이미지
var imageSrc = GROUP_RESOURCES_IMG + "location-pin.png", // 마커이미지의 주소입니다    
imageSize = new kakao.maps.Size(40, 44), // 마커이미지의 크기입니다
imageOption = {offset: new kakao.maps.Point(20, 44)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

function viewKakaoMap(container){
	var lat = $("#calendarModal input[name=calendarXLoc]").val();
	var lng = $("#calendarModal input[name=calendarYLoc]").val();
	$("#kakaomapSearch").hide();
	$("#kakaomapSearchLabel").hide();
	
	if(lat == null || lat == '' || lat == '0'){
		$("#map").empty();
		$("#map").html($("<div>약속장소가 없습니다</div>"));
		return false;
	}else{
		lat = parseFloat(lat);
		lng = parseFloat(lng);
	}
	
	var latLng = new kakao.maps.LatLng(lat, lng);
	
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: latLng, //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};
	
	map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
 
	marker = new kakao.maps.Marker({
	    position: latLng, 
	    image: markerImage // 마커이미지 설정 
	});
	
	marker.setMap(map);
}

function modifyKakaoMap(container){
	
	var lat = $("#calendarModal input[name=calendarXLoc]").val();
	var lng = $("#calendarModal input[name=calendarYLoc]").val();
	
	if(lat == null || lat == '' || lat == '0'){
		lat = 37.4849681;
		lng = 126.8981268;
	}else{
		lat = parseFloat(lat);
		lng = parseFloat(lng);
	}
	
	var latLng = new kakao.maps.LatLng(lat, lng);
	
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: latLng, //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

	map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
 
	marker = new kakao.maps.Marker({
	    position: latLng, 
	    image: markerImage // 마커이미지 설정 
	});
	
	marker.setMap(map);  
	// 마커가 드래그 가능하도록 설정합니다 
	marker.setDraggable(true); 
	
	// 출발 마커에 dragend 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent) {
	     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
		var latLng = marker.getPosition();
		setMarker(marker, latLng);
	});
	
		
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latLng = mouseEvent.latLng;
		//marker.setPosition(latLng);
	    setMarker(marker, latLng);
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
		
	});
}

function createKakaoMap(container) {
	
	var latLng = new kakao.maps.LatLng(37.4849681, 126.8981268);
	
	// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
	if (navigator.geolocation) {    
	    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		navigator.geolocation.getCurrentPosition(function(position) {
	        var lat = position.coords.latitude, // 위도
	            lon = position.coords.longitude; // 경도
	        latLng = new kakao.maps.LatLng(lat, lon); // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
	      });
	} 
	
	var options = { //지도를 생성할 때 필요한 기본 옵션
			center: latLng, //지도의 중심좌표.
			level: 3 //지도의 레벨(확대, 축소 정도)
		};

	map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
 
	marker = new kakao.maps.Marker({
	    position: latLng, 
	    image: markerImage // 마커이미지 설정 
	});
	
	marker.setMap(map);  
	// 마커가 드래그 가능하도록 설정합니다 
	marker.setDraggable(true); 
	
	// 출발 마커에 dragend 이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'dragend', function(mouseEvent) {
	     // 출발 마커의 드래그가 종료될 때 마커 이미지를 원래 이미지로 변경합니다
		var latLng = marker.getPosition();
		setMarker(marker, latLng);
	});
	
		
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
	    
	    // 클릭한 위도, 경도 정보를 가져옵니다 
	    var latLng = mouseEvent.latLng;
		//marker.setPosition(latLng);
	    setMarker(marker, latLng);
		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);  
		
	});
	
	//----------------------------  키워드 검색(삭제시킴) -------------------------------------------//
	// 장소 검색 객체를 생성합니다
	//ps = new kakao.maps.services.Places(); 
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	//infowindow = new kakao.maps.InfoWindow({zIndex:1});
	// 키워드로 장소를 검색합니다
	//searchPlaces();
	// 주소-좌표 변환 객체를 생성합니다
	
	
	geocoder = new kakao.maps.services.Geocoder();
	
	
}

function setMarker(marker, latLng){
	marker.setPosition(latLng);
	var lat = latLng.getLat();
	var lng =latLng.getLng();
	
	$("#map").siblings("input[name=calendarXLoc]").val(lat);
	$("#map").siblings("input[name=calendarYLoc]").val(lng);
}

function addressToMapMarker(text) {
	geocoder = new kakao.maps.services.Geocoder();
	geocoder.addressSearch(text, function(result, status) {

	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {

	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	        // 결과값으로 받은 위치를 마커로 표시합니다
	  /*       marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        }); */
	        marker.setMap(map);
	        //marker.setPosition(coords);
	        setMarker(marker, coords);
	        
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">' + text + '</div>'
	        });
	        infowindow.open(map, marker);

	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
	}); 
}

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
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

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
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

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
