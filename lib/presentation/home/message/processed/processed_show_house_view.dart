import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_ui/application/messages/processed/processed_bloc.dart';

class ShowHouseView extends StatefulWidget {
  @override
  _ShowHouseViewState createState() => _ShowHouseViewState();
}

class _ShowHouseViewState extends State<ShowHouseView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProcessedBloc, ProcessedState>(
        listener: (context, state) {
      // TODO: implement listener
      // if(state.processedData)
      print(state.endListData);
    }, builder: (context, state) {
      return state.processedData.containsKey("houses")
          ? Container(
              child: Row(

//           "serialNumber" -> "1-1-201"
// 1:"staging" -> "三期"
// 2:"building" -> "1号楼"
// 3:"entrance" -> "1"
// state.processedData["houses"]["value"].map((value) {return Container(child: ,);}).toList(),
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "申请控房:",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: getHouses(
                              state.processedData["houses"]["value"])),
                    )
                    // getHouses(state.processedData["houses"]["value"])
                  ]),
            )
          : SizedBox();
    });
  }

  List<Widget> getHouses(value) {
    List<Widget> list = [];
    value.forEach((item) {
      list.add(Container(
          margin: EdgeInsets.only(left: 10),
          child: Row(
            children: [
              Container(
                child: Text(item["staging"],
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                child: Text(item["building"],
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                child: Text(item["entrance"],
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500)),
              ),
              Container(
                child: Text(item["serialNumber"],
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          )));
    });
    return list;
  }
}
