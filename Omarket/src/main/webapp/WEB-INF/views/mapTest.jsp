<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8"/>
	<title>Kakao ���� �����ϱ�</title>
</head>
<body>
    <div id="map" style="width:500px;height:400px;"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12655b8c06e0cca5e31de284b4c8b1bf&libraries=services,clusterer,drawing"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=12655b8c06e0cca5e31de284b4c8b1bf"></script>
    <!-- services�� clusterer, drawing ���̺귯�� �ҷ����� -->
    

	<script>
		var container = document.getElementById('map'); //���� ǥ�� div
        var options = {
            center: new kakao.maps.LatLng(36.300442, 127.574917), //������ �߽���ǥ
            level: 3 //������ Ȯ�� ����
        };
        var map = new kakao.maps.Map(container, options);
        var geocoder = new kakao.maps.services.Geocoder();        
        var addressArray= ['${add}'];		
		
        for(var i =0;i<addressArray.length;i++){
          geocoder.addressSearch(
            addressArray[i],
            function(result,status,data){
              if (status === kakao.maps.services.Status.OK) {
                var coords = new kakao.maps.LatLng(result[0].y,result[0].x);
                 var marker = new kakao.maps.Marker({
                    map : map,
                    position : coords
                });
                marker.setMap(map);
                map.setCenter(coords);
              }
            }
          )
        }
	</script>
</body>
</html>