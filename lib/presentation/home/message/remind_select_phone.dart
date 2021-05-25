import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';

class RemindSelectPhone extends StatefulWidget {
  final String phone;
  final String tenantId;
  const RemindSelectPhone({Key key, this.phone, this.tenantId})
      : super(key: key);
  @override
  _RemindSelectPhoneState createState() => _RemindSelectPhoneState();
}

class _RemindSelectPhoneState extends State<RemindSelectPhone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<WebScoketBloc>()
          ..add(WebScoketEvent.managerRemindDetails(
              widget.phone, widget.tenantId)),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
            listener: (context, state) async {},
            builder: (context, state) {
              return Column(
                  // children: [
                  //   if (state.managerRemindDetails["matchingNumber"] != null)
                  //     _openModalBottomSheetText(
                  //         state.managerRemindDetails["matchingNumber"]),

                  //   // _openModalBottomSheetText(state.managerRemindDetails);
                  // ],
                  );
            }));
  }

  // Future _openModalBottomSheetText(List list) async {
  //   final option = await showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return Column(
  //           children: <Widget>[
  //             Container(
  //                 height: 250.0,
  //                 child: ListView.builder(
  //                     itemCount: list.length,
  //                     itemBuilder: (context, i) => InkWell(
  //                           splashColor: Colors.lightBlueAccent,
  //                           child: Container(
  //                             height: 50,
  //                             child: Center(
  //                               child: SingleChildScrollView(
  //                                 physics: BouncingScrollPhysics(),
  //                                 scrollDirection: Axis.horizontal,
  //                                 child: Text(
  //                                   list[i] + " ",
  //                                   // maxLines: 1,
  //                                   // overflow: TextOverflow.ellipsis,
  //                                   style: TextStyle(
  //                                       color: Colors.grey[600],
  //                                       fontSize: 15,
  //                                       fontWeight: FontWeight.w500),
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                           onTap: () async {
  //                             ExtendedNavigator.of(context)
  //                                 .push(Routes.remindDetailsView,
  //                                     arguments: RemindDetailsViewArguments(
  //                                       phone: list[i],
  //                                       tenantId: _list[i]["tenantId"],
  //                                     ));
  //                             Navigator.pop(context, '取消');
  //                           },
  //                         ))),
  //             ListTile(
  //               title: Text('取消',
  //                   textAlign: TextAlign.center,
  //                   style: TextStyle(color: Colors.blue[200])),
  //               onTap: () {
  //                 Navigator.pop(context, '取消');
  //               },
  //             ),
  //           ],
  //         );
  //       });
  //   // print(option);
  // }
}
