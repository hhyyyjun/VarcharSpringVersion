// 09.02 구글 지도 API 
// 역삼, 하남1, 2호점, 군자, 거여, 신림, 시흥 총 7개 역삼 본사
var locations = [
	{ place: 1, name : "yeoksam", lat : 37.4999269, lng : 127.0365526 },
	{ place: 2, name : "hanam1", lat : 37.5395044, lng : 127.2246603 },
	{ place: 3, name : "hanam2", lat : 37.5425593, lng : 127.2146418 },
	{ place: 4, name : "gunja", lat : 37.5573355, lng : 127.079589 },
	{ place: 5, name : "geoyeo", lat : 37.493422, lng : 127.143597 },
	{ place: 6, name : "silim", lat : 37.484269, lng : 126.929676 },
	{ place: 7, name : "siheung", lat : 37.3525634, lng : 126.7374223 }
];

var btn1 = document.getElementById('CarStore1');
btn1.addEventListener('click', initMap);
var btn2 = document.getElementById('CarStore2');
btn2.addEventListener('click', func1);
var btn3 = document.getElementById('CarStore3');
btn3.addEventListener('click', func2);
var btn4 = document.getElementById('CarStore4');
btn4.addEventListener('click', func3);
var btn5 = document.getElementById('CarStore5');
btn5.addEventListener('click', func4);
var btn6 = document.getElementById('CarStore6');
btn6.addEventListener('click', func5);
var btn7 = document.getElementById('CarStore7');
btn7.addEventListener('click', func6);

// Initialize and add the map
var map;
var markerMaxWidth = 300;
function initMap() {
  // The location of Uluru
  var yeoksamplace = { lat: 37.4999269, lng: 127.0365526 };
  // The map, centered at Uluru
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: yeoksamplace
  });
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({
    position: yeoksamplace,
    map: map,
    title : "VARCHAR 역삼 본사",
    
    icon : {
		url : "images/varchargoogle.png",
		labelOrigin : new google.maps.Point(100,55)
}
  });
 var infowindow = new google.maps.InfoWindow(
        {
      		content: '<div>'+ '<h6>VARCHAR 역삼 본사</h6>' + 
			'<p>주소: 서울특별시   강남구   역삼동   736-7</p>' + 
			'<p>Tel: 02-1234-5678</p>' +
			'</div>',
             maxWidth: markerMaxWidth
      });
    google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(map, marker);
    });
}

initMap();

function func1() {
  // The location of Uluru
  var hanam1place = { lat : 37.5395044, lng : 127.2246603 };
  // The map, centered at Uluru
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: hanam1place
  });
  // The marker, positioned at Uluru
 var marker = new google.maps.Marker({
    position: hanam1place,
    map: map,
    title : "VARCHAR 하남 1호점",
    
    icon : {
		url : "images/varchargoogle.png",
		labelOrigin : new google.maps.Point(100,55)
}
  });
  var infowindow = new google.maps.InfoWindow(
        {
      		content: '<div>'+ '<h6>VARCHAR 하남 1호점</h6>' + 
			'<p>주소: 경기도 하남시 신장2동 대청로 119</p>' + 
			'<p>Tel: 031-345-6789</p>' +
			'</div>',
             maxWidth: markerMaxWidth
      });
    google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(map, marker);
    });
}

function func2() {
  // The location of Uluru
  var hanam2place = { lat : 37.5425593, lng : 127.2146418 };
  // The map, centered at Uluru
   map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: hanam2place
  });
  // The marker, positioned at Uluru
 var marker = new google.maps.Marker({
    position: hanam2place,
    map: map,
    title : "VARCHAR 하남 2호점",
    
    icon : {
		url : "images/varchargoogle.png",
		labelOrigin : new google.maps.Point(100,55)
}
  });
   var infowindow = new google.maps.InfoWindow(
        {
      		content: '<div>'+ '<h6>VARCHAR 하남 2호점</h6>' + 
			'<p>주소: 경기도 하남시 신장동 560 </p>' + 
			'<p>Tel: 031-777-8888</p>' +
			'</div>',
             maxWidth: markerMaxWidth
      });
    google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(map, marker);
    });
}

function func3() {
  // The location of Uluru
  var gunjaplace = { lat : 37.5573355, lng : 127.079589 };
  // The map, centered at Uluru
   map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: gunjaplace
  });
  // The marker, positioned at Uluru
 var marker =  new google.maps.Marker({
    position: gunjaplace,
    map: map,
    title : "VARCHAR 군자점",
    
    icon : {
		url : "images/varchargoogle.png",
		labelOrigin : new google.maps.Point(100,55)
}
  });
   var infowindow = new google.maps.InfoWindow(
        {
      		content: '<div>'+ '<h6>VARCHAR 군자점</h6>' + 
			'<p>주소: 서울특별시 광진구 능동로37길 11</p>' + 
			'<p>Tel: 02-4567-8901</p>' +
			'</div>',
             maxWidth: markerMaxWidth
      });
    google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(map, marker);
    });
}

function func4() {
  // The location of Uluru
  var geoyeoplace = { lat : 37.493422, lng : 127.143597 };
  // The map, centered at Uluru
   map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: geoyeoplace
  });
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({
    position: geoyeoplace,
    map: map,
    title : "VARCHAR 거여점",
    
    icon : {
		url : "images/varchargoogle.png",
		labelOrigin : new google.maps.Point(100,55)
}
  });
   var infowindow = new google.maps.InfoWindow(
        {
      		content: '<div>'+ '<h6>VARCHAR 거여점</h6>' + 
			'<p>주소: 서울특별시 송파구 거여동 562-3</p>' + 
			'<p>Tel: 02-2222-6666</p>' +
			'</div>',
             maxWidth: markerMaxWidth
      });
    google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(map, marker);
    });
  
}

function func5() {
  // The location of Uluru
  var silimplace = { lat : 37.484269, lng : 126.929676 };
  // The map, centered at Uluru
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: silimplace
  });
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({
    position: silimplace,
    map: map,
    title : "VARCHAR 신림점",
    
    icon : {
		url : "images/varchargoogle.png",
		labelOrigin : new google.maps.Point(100,55)
}
  });
   var infowindow = new google.maps.InfoWindow(
        {
      		content: '<div>'+ '<h6>VARCHAR 신림점</h6>' + 
			'<p>주소: 서울특별시 관악구 신림동 신림로 300</p>' + 
			'<p>Tel: 02-0000-1111</p>' +
			'</div>',
             maxWidth: markerMaxWidth
      });
    google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(map, marker);
    });
}

function func6() {
  // The location of Uluru
  var siheungplace = { lat : 37.3525634, lng : 126.7374223 };
  // The map, centered at Uluru
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 18,
    center: siheungplace
  });
  // The marker, positioned at Uluru
  var marker = new google.maps.Marker({
    position: siheungplace,
    map: map,
    title : "VARCHAR 시흥점",
    
    icon : {
		url : "images/varchargoogle.png",
		labelOrigin : new google.maps.Point(100,55)
}
 });
   var infowindow = new google.maps.InfoWindow(
        {
      		content: '<div>'+ '<h6>VARCHAR 시흥점</h6>' + 
			'<p>주소: 경기도 시흥시 능곡동, 719</p>' + 
			'<p>Tel: 031-333-1111</p>' +
			'</div>',
             maxWidth: markerMaxWidth
      });
    google.maps.event.addListener(marker, 'click', function() {
    	infowindow.open(map, marker);
    });
}


//window.initMap = initMap;