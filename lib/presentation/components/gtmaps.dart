import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class GtMaps extends StatefulWidget {
  final Map<String, dynamic> affData;
  GtMaps(this.affData);

  @override
  _GtMapsState createState() => _GtMapsState();
}

class _GtMapsState extends State<GtMaps> {
  List<Map<String, Object>> keywordList = [
    {"type": true, "keyword": "银行"},
    {"type": true, "keyword": "教育"},
    {"type": true, "keyword": "医疗"},
    {"type": true, "keyword": "美食"},
    {"type": true, "keyword": "购物"},
    // {"type": true, "keyword": "洗浴"},
    // {"type": true, "keyword": "楼盘"},
  ];
  AmapController _controller;
  // List<Marker> _markers = [];

  List<Marker> _markers = [];
  Future addPOI(project, keyword) async {
    var poiList = await AmapSearch.instance.searchAround(
        LatLng(project["latitude"], project["longitude"]),
        keyword: keyword,
        page: 1,
        pageSize: 20,
        radius: 3000);
    print("++++++++++++++++++搜索周边${keyword}++++++++++++++++++");
    print(poiList);
    await poiToMarks(poiList);
  }

  Future poiToMarks(poiList) async {
    for (var item in poiList) {
      LatLng latLng = await item.latLng;
      var latitude = latLng.latitude;
      String title = await item.title;
      String address = await item.address;
      print(title);
      await addPioMarker(latitude, latLng.longitude, title, address);
    }
  }

  Future addPioMarker(lat, log, title, address) async {
    LatLng position = LatLng(lat, log);
    final marker = await _controller?.addMarker(MarkerOption(
      coordinate: position,
      title: title,
      snippet: address,
    ));

    _markers.add(marker);
    // _controller.addMarker(MarkerOption(
    //   coordinate: position,
    //   title: title,
    //   snippet: address,
    // ));
    // Marker marker = Marker(
    //   position: position,
    //   infoWindowEnable: true,
    //   zIndex: 9,
    //   icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
    //   infoWindow: InfoWindow(
    //     title: title,
    //     snippet: address,
    //   ),
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 280,
          child: AmapView(
            // key: Key("mapone"),
            autoRelease: false,
            mapType: MapType.Standard,
            // markers: <MarkerOption>[
            //   if (widget.affData != null)
            //     MarkerOption(
            //       coordinate: LatLng(
            //           widget.affData["latitude"], widget.affData["longitude"]),
            //       title: widget.affData["projectName"] ?? "123",
            //       snippet: widget.affData["address"] ?? "123",
            //     ),
            // ],
            zoomLevel: 13,
            centerCoordinate:
                LatLng(widget.affData["latitude"], widget.affData["longitude"]),
            maskDelay: Duration(milliseconds: 500),
            onMapCreated: (controller) async {
              _controller = controller;
              try {
                await controller.addMarker(
                  MarkerOption(
                    coordinate: LatLng(widget.affData["latitude"],
                        widget.affData["longitude"]),
                    title: widget.affData["projectName"],
                    snippet: widget.affData["address"],
                    infoWindowEnabled: true,
                  ),
                );
                await controller?.showMyLocation(MyLocationOption(
                  show: true,
                ));
              } catch (e) {}
            },
          ),
        ),
        Positioned(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: keywordList.map((item) {
              return InkWell(
                  child: Container(
                    // margin: EdgeInsets.only(left: 10),
                    padding:
                        EdgeInsets.only(left: 10, right: 10, top: 3, bottom: 3),
                    decoration: BoxDecoration(
                        color: item["type"] ? Colors.white : Colors.blue,
                        borderRadius: BorderRadius.circular(5.0)),
                    child: Text(
                      item["keyword"],
                      style: TextStyle(
                          color: item["type"] ? Colors.grey[700] : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  onTap: () async {
                    for (var i = 0; i < this.keywordList.length; i++) {
                      if (item["keyword"] == keywordList[i]["keyword"]) {
                        keywordList[i]["type"] = false;
                      } else {
                        keywordList[i]["type"] = true;
                      }
                    }
                    this.setState(() {});
                    // await addBaseMarker();
                    await _controller.clearMarkers(_markers);
                    await addPOI(widget.affData, item["keyword"]);
                    // await addBaseMarker();
                    // await addPOI(widget.affData, item["keyword"]);
                  });
            }).toList(),
          ),
        ),
      ],
    );
  }
}
