import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/message/bloc/web_scoket_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/home/message/contacts_remarks.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';

class ContactsList extends StatefulWidget {
  @override
  _ContactsListState createState() => _ContactsListState();
}

List getContactsList = [];

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
            getIt<WebScoketBloc>()..add(const WebScoketEvent.getContacts()),
        child: BlocConsumer<WebScoketBloc, WebScoketState>(
          listener: (context, state) async {
            if (state.getContactsList != null) {
              getContactsList = state.getContactsList;
            }
            for (int i = 0; i < getContactsList.length; i++) {
              print(getContactsList[i]);
            }
          },
          builder: (context, state) {
            return ListView.builder(
                itemCount: getContactsList.length,
                itemBuilder: (context, i) => InkWell(
                      child: Container(
                          child: listTitleMine(
                              getContactsList[i]['contactName'],
                              getContactsList[i]['contactAvatar'])),
                      onTap: () {
                        ExtendedNavigator.of(context).push(
                            Routes.contactsRemarks,
                            arguments: ContactsRemarksArguments(
                              contactName:
                                  '${getContactsList[i]['contactName']}',
                              contactAvatar:
                                  '${getContactsList[i]['contactAvatar']}',
                              phone: '${getContactsList[i]['phone']}',
                              contactId: '${getContactsList[i]['contactId']}',
                            ));
                      },
                    ));
          },
        ));
  }

  listTitleMine(
    String mineTitle,
    String mineImage,
  ) {
    return Container(
        height: 55,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 0.5, color: Color(0xffe5e5e5))),
        ),
        child: Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 10, right: 15),
              child: CircleAvatar(
                  backgroundImage: NetworkImage(mineImage), radius: 20.0),
            ),
            Expanded(
                child: Text(
              mineTitle,
              style: TextStyle(fontSize: 14),
            ))
          ],
        ));
  }
}
