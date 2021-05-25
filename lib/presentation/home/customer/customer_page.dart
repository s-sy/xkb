import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ui/application/coustomer/coustomer_bloc.dart';
import 'package:flutter_ui/injection.dart';
import 'package:flutter_ui/presentation/bean/base_bean.dart';
import 'package:flutter_ui/presentation/core/fintness_app_theme.dart';
import 'package:flutter_ui/presentation/routes/router.gr.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SortCondition {
  String name;
  bool isSelected;

  SortCondition({this.name, this.isSelected});
}

class CustomerPage extends StatefulWidget {
  CustomerPage({Key key}) : super(key: key);

  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  List<BaseBean> _listBaseBean = [];
  var topBarOpacity = 0.0;
  List<String> _dropDownHeaderItemStrings = ['分组', '流程', '筛选', '重置'];
  List<SortCondition> _brandSortConditions = [];
  List<SortCondition> _groupingSortConditions = [];
  List<SortCondition> _resetCondition = [];
  SortCondition _selectBrandSortCondition;
  SortCondition _selectGroupingSortCondition;
  SortCondition _selectResetCondition;
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();

  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();
  List _listData = [];
  List secondList = [];
  bool _isSelect = false;
  List secondLevels = ["已冻结", "带执行", "已完结", "正常", "无效客户"];
  String firstLevelsName = "客户状态";
  String _addValue01 = "";
  String _addValue02 = "";
  String _addValue03 = "";
  String houseName = '';
  Map<String, dynamic> userInfo = {};
  int groupValue = 1;
  Map<String, dynamic> mapName = {};
  String _textFeid = "";
  bool _isSearch = false;
  List _searchList = [];
  bool isGoodCustomer = true;
  List listGoodCustomer = [];
  String salemanName = "置业顾问";

  @override
  void initState() {
    // secondList = [];
    super.initState();
    _brandSortConditions.add(SortCondition(name: '全部流程', isSelected: true));
    _brandSortConditions.add(SortCondition(name: '邀约', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '人员判客', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '认筹/下定', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '认筹/下定审核', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '转定', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '转定审核', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '签订合同', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '合同审核', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '银行放款', isSelected: false));
    _brandSortConditions.add(SortCondition(name: '银行放款审核', isSelected: false));
    _selectBrandSortCondition = _brandSortConditions[0];

    _groupingSortConditions.add(SortCondition(name: '全部分组', isSelected: true));
    _groupingSortConditions
        .add(SortCondition(name: '全民经纪人', isSelected: false));
    _groupingSortConditions.add(SortCondition(name: '手动添加', isSelected: false));
    _groupingSortConditions.add(SortCondition(name: '隐号推荐', isSelected: false));
    _groupingSortConditions.add(SortCondition(name: '平台获客', isSelected: false));
    _selectGroupingSortCondition = _groupingSortConditions[0];

    _resetCondition..add(SortCondition(name: '重置', isSelected: false));
    _selectResetCondition = _resetCondition[0];

    // _listBaseBean.add(BaseBean(
    //     isAttention: true,
    //     testNum: 20,
    //     name: '向女士01',
    //     phone: '13425478552',
    //     level: 'C',
    //     tag: '问询',
    //     time: '2020-07-15 10:25:09',
    //     contact: '来访',
    //     remarks: '看177平11楼，算了价格'));
    // _listBaseBean.add(BaseBean(
    //     isAttention: true,
    //     testNum: 10,
    //     name: '曾先生02',
    //     phone: '13425478552',
    //     level: 'D',
    //     tag: '无效',
    //     time: '2020-07-15 10:25:09',
    //     contact: '去电',
    //     remarks: '无效客户'));
    // _listBaseBean.add(BaseBean(
    //     isAttention: false,
    //     testNum: 30,
    //     name: '江女士03',
    //     phone: '14875426558',
    //     level: 'B',
    //     tag: '问询',
    //     time: '2020-07-15 10:25:09',
    //     contact: '其他',
    //     remarks: '渠道客户'));
  }

  @override
  Widget build(BuildContext context) {
    // return BlocProvider<CoustomerBloc>(
    //           create: (context) =>
    //               getIt<CoustomerBloc>()..add(CoustomerEvent.started()),
    //           child: BlocConsumer<CoustomerBloc, CoustomerState>(
    return BlocProvider(
        create: (context) => getIt<CoustomerBloc>()
          ..add(const CoustomerEvent.started())
          ..add(const CoustomerEvent.getSalesman()),
        child: BlocConsumer<CoustomerBloc, CoustomerState>(
            listener: (context, state) async {
          List listCustomer = [];
          for (int i = 0; i < state.coustomData.length; i++) {
            if (state.coustomData[i]["workflowStatus"] != "4") {
              listCustomer.add(state.coustomData[i]);
            }
          }
          setState(() {
            listGoodCustomer = listCustomer;
            _listData = state.coustomData;
          });
          // print(listGoodCustomer);

          SharedPreferences sharedPreferences =
              await SharedPreferences.getInstance();
          houseName = sharedPreferences.get('HOUSESNAME');
          if (houseName == null) {
            String affiliateds = sharedPreferences.get('AFFILIATEDS');
            if (affiliateds != null) {
              houseName = jsonDecode(affiliateds)[0]["projectName"];
            }
          }
          String userInfoString =
              sharedPreferences.getString("CACHED_SIGN_IN_USER");
          userInfo = jsonDecode(userInfoString);
          // print(state.isSamePhone);
          // print(state.isConfirm);
          if (state.isConfirm) {
            if (state.isSamePhone) {
              // BotToast.showAttachedWidget(
              //     attachedBuilder: (_) => Center(
              //             child: Card(
              //           child: Container(
              //               width: 150,
              //               height: 80,
              //               child: Column(
              //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                 crossAxisAlignment: CrossAxisAlignment.center,
              //                 children: <Widget>[
              //                   Icon(
              //                     Icons.error,
              //                     color: Colors.redAccent,
              //                   ),
              //                   Text(
              //                     "号码已重复！",
              //                     style: TextStyle(
              //                         color: Colors.redAccent,
              //                         fontWeight: FontWeight.w500),
              //                   )
              //                 ],
              //               )),
              //         )),
              //     duration: Duration(seconds: 2),
              //     target: Offset(520, 520));
              BotToast.showText(text: "号码已重复！");
            } else {
              if (_addValue01 != "" &&
                  _addValue02 != "" &&
                  _addValue02.length == 11) {
                // BotToast.showAttachedWidget(
                //     attachedBuilder: (_) => Center(
                //             child: Card(
                //           child: Container(
                //               width: 150,
                //               height: 80,
                //               child: Column(
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceEvenly,
                //                 children: <Widget>[
                //                   Icon(
                //                     Icons.done,
                //                     color: Colors.blue,
                //                   ),
                //                   Text(
                //                     "客户添加成功！",
                //                     style: TextStyle(
                //                         color: Colors.blue,
                //                         fontWeight: FontWeight.w500),
                //                   )
                //                 ],
                //               )),
                //         )),
                //     duration: Duration(seconds: 2),
                //     target: Offset(520, 520));
                BotToast.showText(text: "客户添加成功！");
              } else {
                _showWrongMsg();
              }
            }
            setState(() {
              _addValue01 = '';
              _addValue02 = '';
              _addValue03 = '';
            });
            BlocProvider.of<CoustomerBloc>(context)
              ..add(CoustomerEvent.isReset());
          }
        }, builder: (context, state) {
          return Listener(
              onPointerDown: (onPointerDown) {
                FocusScope.of(context).requestFocus(FocusNode());
                print('手指按下回调');
              },
              child: Scaffold(
                key: _scaffoldKey,
                appBar: PreferredSize(
                    child: AppBar(
                      brightness: Brightness.light,
                      backgroundColor: Colors.white,
                      elevation: 0,
                    ),
                    preferredSize: Size.fromHeight(0)),
                backgroundColor: Colors.grey[300],
                body: Stack(
                  key: _stackKey,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Container(
                        //   width: MediaQuery.of(context).size.width,
                        //   height: 55,
                        //   color: Theme.of(context).primaryColor,
                        //   alignment: Alignment.center,
                        //   child: Text(
                        //     '推荐客户',
                        //     style: TextStyle(
                        //         fontSize: 20,
                        //         color: Colors.white,
                        //         fontWeight: FontWeight.w500),
                        //   ),
                        // ),
                        Container(
                          color: Colors.white,
                          // child: Padding(
                          //   padding: EdgeInsets.only(
                          //       left: 16,
                          //       right: 16,
                          //       top: 16 - 8.0 * topBarOpacity,
                          //       bottom: 12 - 8.0 * topBarOpacity),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text(
                                    '客户',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontFamily: FitnessAppTheme.fontName,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22 + 6 - 6 * topBarOpacity,
                                      letterSpacing: 1.2,
                                      color: FitnessAppTheme.blue,
                                    ),
                                  ),
                                ),
                              ),
                              if (userInfo['userRole'] == 'salesman')
                                _addOwnCustomer(context, state)
                            ],
                          ),
                          // ),
                        ),
                        searchHeader(_isSelect
                            ? secondList
                            : isGoodCustomer
                                ? listGoodCustomer
                                : _listData),

                        if (state.userRole == "manager")
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: RaisedButton(
                                  child: Text(salemanName),
                                  onPressed: () {
                                    _openModalBottomSheetText(
                                        state.salesman, state.coustomData);
                                  },
                                  textColor: salemanName != "置业顾问"
                                      ? Colors.white
                                      : Colors.black,
                                  color: salemanName != "置业顾问"
                                      ? Colors.blue
                                      : Colors.grey[100],
                                  elevation: 2,
                                ),
                              ),
                              Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    "查看小组内置业顾问",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ))
                            ],
                          ),

                        // 下拉菜单头部
                        GZXDropDownHeader(
                          items: [
                            // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
                            GZXDropDownHeaderItem(
                                _dropDownHeaderItemStrings[0]),
                            GZXDropDownHeaderItem(
                                _dropDownHeaderItemStrings[1]),
                            GZXDropDownHeaderItem(
                                _dropDownHeaderItemStrings[2]),
                            GZXDropDownHeaderItem(
                                _dropDownHeaderItemStrings[3]),
                          ],
                          stackKey:
                              _stackKey, // GZXDropDownHeader对应第一父级Stack的key
                          controller:
                              _dropdownMenuController, // controller用于控制menu的显示或隐藏
                          onItemTap: (index) {
                            // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
                            // print("-----++++++++++++------");
                            // print(index);
                            // if (index == 3) {
                            //   _scaffoldKey.currentState.openEndDrawer();
                            //   _dropdownMenuController.hide();
                            // }
                          },
                        ),

                        //内容
                        Expanded(
                          child: listViewLayoutBuilder(
                              // _isSelect
                              //       ? _isSearch
                              //           ? _searchList
                              //           : secondList
                              //       : _listData
                              _isSearch
                                  ? _searchList
                                  : _isSelect
                                      ? secondList
                                      : isGoodCustomer
                                          ? listGoodCustomer
                                          : _listData
                              // secondList.length != 0 ? secondList : _listData
                              ,
                              state),
                        ),
                        SizedBox(height: 60)
                      ],
                    ),
                    // 下拉菜单
                    GZXDropDownMenu(
                      controller:
                          _dropdownMenuController, // controller用于控制menu的显示或隐藏
                      animationMilliseconds: 200, // 下拉菜单显示或隐藏动画时长
                      menus: [
                        // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
                        GZXDropdownMenuBuilder(
                            dropDownHeight: 40 * 5.0,
                            dropDownWidget: _buildConditionListWidget(
                                _groupingSortConditions, (value) {
                              _selectGroupingSortCondition = value;
                              _dropDownHeaderItemStrings[0] =
                                  _selectGroupingSortCondition.name == '全部'
                                      ? '全部'
                                      : _selectGroupingSortCondition.name;
                              _dropdownMenuController.hide();
                              setState(() {});
                            })),
                        GZXDropdownMenuBuilder(
                            dropDownHeight: 40 * 6.0,
                            dropDownWidget: _buildConditionListWidget(
                                _brandSortConditions, (value) {
                              _selectBrandSortCondition = value;
                              _dropDownHeaderItemStrings[1] =
                                  // _selectBrandSortCondition.name == '全部'
                                  //     ? '品牌'
                                  //     :
                                  _selectBrandSortCondition.name;
                              _dropdownMenuController.hide();
                              setState(() {});
                            })),
                        GZXDropdownMenuBuilder(
                            dropDownHeight: 40 * 6.5,
                            dropDownWidget: _buildAddressWidget((selectValue) {
                              _dropDownHeaderItemStrings[2] = selectValue;
                              _dropdownMenuController.hide();
                              setState(() {});
                            })),

                        GZXDropdownMenuBuilder(
                            dropDownHeight: 40 * 4.0,
                            dropDownWidget: _buildConditionListWidget(
                                _resetCondition, (value) {
                              _selectResetCondition = value;
                              _dropDownHeaderItemStrings[3] =
                                  _selectResetCondition.name;
                              _dropdownMenuController.hide();
                              setState(() {});
                            })),
                      ],
                    ),
                  ],
                ),
              ));
        }));
  }

  //这种是自定义弹框，留着以后会有用的
  // _addOwnCustomer(context) {
  //   return Container(
  //       margin: EdgeInsets.only(right: 20),
  //       padding: EdgeInsets.only(top: 10),
  //       child: IconButton(
  //           icon: Icon(Icons.control_point, color: Colors.blue, size: 30.0),
  //           onPressed: () {
  //             showGeneralDialog(
  //                 context: context,
  //                 pageBuilder: (context, anim1, anim2) {
  //                   return;
  //                 },
  //                 barrierColor: Colors.grey.withOpacity(.4),
  //                 barrierDismissible: true,
  //                 barrierLabel: "自有客户添加",
  //                 transitionDuration: Duration(milliseconds: 400),
  //                 transitionBuilder: (context, anim1, anim2, child) {
  //                   return Transform.scale(
  //                       scale: anim1.value,
  //                       child: Opacity(
  //                         opacity: anim1.value,
  //                         child: AlertDialog(
  //                           shape: RoundedRectangleBorder(
  //                               borderRadius:
  //                                   BorderRadius.all(Radius.circular(20))),
  //                           title: Text("自有客户添加"),
  //                           content: StatefulBuilder(
  //                               builder: (context, StateSetter setState) {
  //                             return SingleChildScrollView(
  //                               child: Column(
  //                                 crossAxisAlignment: CrossAxisAlignment.start,
  //                                 children: <Widget>[
  //                                   Text(houseName,
  //                                       style: TextStyle(
  //                                           color: Colors.blue,
  //                                           fontSize: 18,
  //                                           fontWeight: FontWeight.w500)),
  //                                   _dialogContant("姓       名:", "请输入名称"),
  //                                   _dialogContant("电话号码:", "请输入电话"),
  //                                   Row(
  //                                     mainAxisAlignment:
  //                                         MainAxisAlignment.center,
  //                                     children: <Widget>[
  //                                       Text("男"),
  //                                       Radio(
  //                                         value: 1,
  //                                         groupValue: groupValue,
  //                                         onChanged: (value) {
  //                                           setState(() {
  //                                             groupValue = value;
  //                                           });
  //                                         },
  //                                       ),
  //                                       SizedBox(width: 20),
  //                                       Text("女"),
  //                                       Radio(
  //                                         value: 2,
  //                                         groupValue: groupValue,
  //                                         onChanged: (value) {
  //                                           setState(() {
  //                                             groupValue = value;
  //                                           });
  //                                         },
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                             );
  //                           }),
  //                           actions: <Widget>[
  //                             FlatButton(
  //                               child: Text("取消",
  //                                   style: TextStyle(color: Colors.blue[200])),
  //                               onPressed: () {
  //                                 Navigator.of(context).pop(false);
  //                               },
  //                             ),
  //                             Tooltip(
  //                                 message: '提示：无法操作',
  //                                 child: FlatButton(
  //                                   child: Text("确定"),
  //                                   onPressed: () {
  //                                     if (_addValue01 != "" &&
  //                                         _addValue02 != "" &&
  //                                         _addValue02.length == 11) {
  //                                       Navigator.of(context).pop(true);
  //                                       BotToast.showAttachedWidget(
  //                                           attachedBuilder: (_) => Center(
  //                                                   child: Card(
  //                                                 child: Container(
  //                                                     width: 150,
  //                                                     height: 80,
  //                                                     // padding:
  //                                                     //     const EdgeInsets.all(8.0),
  //                                                     child: Column(
  //                                                       mainAxisAlignment:
  //                                                           MainAxisAlignment
  //                                                               .spaceEvenly,
  //                                                       children: <Widget>[
  //                                                         Icon(
  //                                                           Icons.done,
  //                                                           color: Colors.blue,
  //                                                         ),
  //                                                         Text(
  //                                                           "客户添加成功！",
  //                                                           style: TextStyle(
  //                                                               color:
  //                                                                   Colors.blue,
  //                                                               fontWeight:
  //                                                                   FontWeight
  //                                                                       .w500),
  //                                                         )
  //                                                       ],
  //                                                     )),
  //                                               )),
  //                                           duration: Duration(seconds: 2),
  //                                           target: Offset(520, 520));
  //                                     } else {
  //                                       BotToast.showAttachedWidget(
  //                                           attachedBuilder: (_) => Center(
  //                                                   child: Card(
  //                                                 child: Container(
  //                                                     width: 150,
  //                                                     height: 80,
  //                                                     // padding:
  //                                                     //     const EdgeInsets.all(8.0),
  //                                                     child: Column(
  //                                                       mainAxisAlignment:
  //                                                           MainAxisAlignment
  //                                                               .spaceEvenly,
  //                                                       crossAxisAlignment:
  //                                                           CrossAxisAlignment
  //                                                               .center,
  //                                                       children: <Widget>[
  //                                                         Icon(
  //                                                           Icons.error,
  //                                                           color: Colors
  //                                                               .redAccent,
  //                                                         ),
  //                                                         Text(
  //                                                           "数据不全,请重新提交!",
  //                                                           style: TextStyle(
  //                                                               color: Colors
  //                                                                   .redAccent,
  //                                                               fontWeight:
  //                                                                   FontWeight
  //                                                                       .w500),
  //                                                         )
  //                                                       ],
  //                                                     )),
  //                                               )),
  //                                           duration: Duration(seconds: 2),
  //                                           target: Offset(520, 520));
  //                                       print("object");
  //                                     }
  //                                   },
  //                                 )),
  //                           ],
  //                         ),
  //                       ));
  //                 });
  //           }));
  // }

  _addOwnCustomer(context, state) {
    return Container(
        margin: EdgeInsets.only(right: 20),
        padding: EdgeInsets.only(top: 10),
        child: IconButton(
            icon: Icon(Icons.control_point, color: Colors.blue, size: 30.0),
            onPressed: () {
              showDialog(
                  barrierDismissible: true,
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("手动添加客户"),
                      content: StatefulBuilder(
                          builder: (context, StateSetter setState) {
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(houseName,
                                  style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                              _dialogContant("姓        名:", "请输入名称"),
                              _dialogContant("电话号码:", "请输入电话"),
                              _sexRadio(setState),
                              SizedBox(height: 5.0),
                              _remarksIntention(),
                            ],
                          ),
                        );
                      }),
                      actions: <Widget>[
                        FlatButton(
                          child: Text("取消",
                              style: TextStyle(color: Colors.blue[200])),
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                        ),
                        FlatButton(
                            child: Text("确定"),
                            onPressed: () {
                              Navigator.of(context).pop(true);
                            }),
                      ],
                    );
                  }).then((value) {
                if (value != null) {
                  if (value) {
                    //groupValue  _addValue03
                    if (_addValue01 != "" &&
                        _addValue02 != "" &&
                        _addValue02.length == 11) {
                      BlocProvider.of<CoustomerBloc>(context)
                        ..add(CoustomerEvent.getProcessDefinition(_addValue01,
                            _addValue02, groupValue.toString(), _addValue03));
                      BlocProvider.of<CoustomerBloc>(context)
                        ..add(CoustomerEvent.isConfirm());
                    } else {
                      // _showWrongMsg();
                      BotToast.showText(text: "数据不全,请重新提交!");
                    }
                  }
                }
              });
            }));
  }

  _showWrongMsg() {
    return BotToast.showAttachedWidget(
        attachedBuilder: (_) => Center(
                child: Card(
              child: Container(
                  width: 150,
                  height: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.error,
                        color: Colors.redAccent,
                      ),
                      Text(
                        "数据不全,请重新提交!",
                        style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )),
            )),
        duration: Duration(seconds: 2),
        target: Offset(520, 520));
  }

  _sexRadio(setState) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text("性        别:",
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        Expanded(child: SizedBox()),
        Text("男",
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        Radio(
          value: 1,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
        SizedBox(width: 20),
        Text("女",
            style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w500,
                fontSize: 16)),
        Radio(
          value: 2,
          groupValue: groupValue,
          onChanged: (value) {
            setState(() {
              groupValue = value;
            });
          },
        )
      ],
    );
  }

  _remarksIntention() {
    return Container(
      height: 80.0,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('意向备注:',
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                  fontWeight: FontWeight.w500)),
          SizedBox(width: 10.0),
          Expanded(
            child: TextField(
              maxLines: 4,
              autofocus: false,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.pink))),
              onChanged: (value) {
                setState(() {
                  _addValue03 = value;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  _dialogContant(String key, String name) {
    return Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Container(
              child: Text(
                key,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              width: 140,
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.0, color: Color(0xffe5e5e5))),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
              child: TextField(
                  keyboardType: key == "电话号码:"
                      ? TextInputType.number
                      : TextInputType.text,
                  maxLines: 5,
                  minLines: 1,
                  textInputAction: TextInputAction.go,
                  decoration: InputDecoration(
                    hintText: name,
                    border: InputBorder.none,
                    isDense: true,
                    hintStyle: TextStyle(color: Colors.grey[400], fontSize: 15),
                  ),
                  onChanged: (val) {
                    if (key == "姓        名:") {
                      setState(() {
                        _addValue01 = val;
                      });
                    } else if (key == "电话号码:") {
                      setState(() {
                        _addValue02 = val;
                      });
                    }
                    // else if (key == "楼盘状态") {
                    //   _addValue03 = val;
                    // } else if (key == "意向级别") {
                    //   _addValue04 = val;
                    // }
                  }),
            ),
          ],
        ));
  }

  //搜索框
  searchHeader(List list) {
    // return Container(
    //     height: 50.0,
    //     decoration: BoxDecoration(color: Colors.white),
    //     child: Container(
    //       height: 40.0,
    //       margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
    //       padding: EdgeInsets.fromLTRB(20, 8, 20, 8),
    //       decoration: BoxDecoration(
    //           borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: <Widget>[
    //           Icon(
    //             Icons.search,
    //             color: Colors.grey[400],
    //           ),
    //           Text('搜索客户', style: TextStyle(fontSize: 16, color: Colors.grey)),
    //         ],
    //       ),
    //     ));
    return Container(
        height: 50,
        decoration: BoxDecoration(color: Colors.white),
        child: Container(
          height: 40.0,
          margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: Colors.grey[200]),
          child: TextField(
              maxLines: 1,
              textInputAction: TextInputAction.go,
              decoration: InputDecoration(
                hintText: "搜索客户",
                prefixIcon:
                    Icon(Icons.search, color: Colors.grey[400], size: 20),
                border: InputBorder.none,
                isDense: true,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 16),
              ),
              controller: TextEditingController.fromValue(
                TextEditingValue(
                  text: _textFeid,
                  // 保持光标在最后
                  selection: TextSelection.fromPosition(TextPosition(
                    affinity: TextAffinity.downstream,
                    offset: _textFeid.length,
                  )),
                ),
              ),
              onChanged: (val) {
                //一般是点击确定才出来，可能邓总要加的
              },
              onSubmitted: (val) {
                _searchList = [];
                if (val == "") {
                  setState(() {
                    _textFeid = val;
                    _isSearch = false;
                  });
                } else {
                  print(list);
                  for (int i = 0; i < list.length; i++) {
                    if (list[i]['customerName'].indexOf(val) != -1) {
                      _searchList.add(list[i]);
                    }
                  }
                  for (int i = 0; i < list.length; i++) {
                    if (list[i]['phone'].indexOf(val) != -1) {
                      _searchList.add(list[i]);
                    }
                  }
                  setState(() {
                    _isSearch = true;
                    _textFeid = val;
                    salemanName = "置业顾问";
                  });
                }
              }),
        ));
  }

  //中间的下拉框
  _buildConditionListWidget(items, void itemOnTap(sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        SortCondition goodsSortCondition = items[index];
        return GestureDetector(
          onTap: () {
            for (var value in items) {
              value.isSelected = false;
            }
            // print(goodsSortCondition.name + "ddddddddd");
            if (goodsSortCondition.name == "全民经纪人") {
              selectList("全民经纪人");
            } else if (goodsSortCondition.name == "手动添加") {
              selectList("手动添加");
            } else if (goodsSortCondition.name == "隐号推荐") {
              selectList("隐号推荐");
            } else if (goodsSortCondition.name == "平台获客") {
              selectList("平台获客");
            } else if (goodsSortCondition.name == "全部分组") {
              selectList("全部分组");
            } else if (goodsSortCondition.name == "邀约") {
              selectList("邀约");
            } else if (goodsSortCondition.name == "人员判客") {
              selectList("人员判客");
            } else if (goodsSortCondition.name == "认筹/下定") {
              selectList("认筹/下定");
            } else if (goodsSortCondition.name == "认筹/下定审核") {
              selectList("认筹/下定审核");
            } else if (goodsSortCondition.name == "转定") {
              selectList("转定");
            } else if (goodsSortCondition.name == "转定审核") {
              selectList("转定审核");
            } else if (goodsSortCondition.name == "签订合同") {
              selectList("签订合同");
            } else if (goodsSortCondition.name == "合同审核") {
              selectList("合同审核");
            } else if (goodsSortCondition.name == "合同审核") {
              selectList("合同审核");
            } else if (goodsSortCondition.name == "银行放款审核") {
              selectList("银行放款审核");
            } else if (goodsSortCondition.name == "全部流程") {
              selectList("全部流程");
            }
            setState(() {
              _isSelect = true;
              _textFeid = "";
              _isSearch = false;
              salemanName = "置业顾问";
            });
            if (goodsSortCondition.name == "重置") {
              setState(() {
                isGoodCustomer = true;
                _isSelect = false;
                secondList = [];
                mapName = {};
                _textFeid = "";
                _isSearch = false;
                salemanName = "置业顾问";
                _dropDownHeaderItemStrings = ['分组', '流程', '筛选', "重置"];
              });
              BotToast.showText(text: "已全部重置" + " ");
              // goodsSortCondition.isSelected = false; 这样更丑
            }
            goodsSortCondition.isSelected = true;
            itemOnTap(goodsSortCondition);
          },
          child: Container(
            height: 40,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    goodsSortCondition.name,
                    style: TextStyle(
                      color: goodsSortCondition.isSelected
                          ? Theme.of(context).primaryColor
                          : Colors.black,
                    ),
                  ),
                ),
                goodsSortCondition.isSelected
                    ? Icon(
                        Icons.check,
                        color: Theme.of(context).primaryColor,
                        size: 16,
                      )
                    : SizedBox(),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  selectList(String name) {
    secondList = [];
    Map<String, dynamic> selectMap = _selectName(name);
    // print(selectMap);
    //这里需要判断是有效客户还是都有
    if (isGoodCustomer) {
      if (selectMap["selectItemKey01"] != null &&
          selectMap["selectItemKey02"] != null &&
          selectMap["selectItemKey03"] != null) {
        List listSelect = [];
        List listSelect02 = [];
        for (int i = 0; i < listGoodCustomer.length; i++) {
          if (listGoodCustomer[i]['classified'] ==
              selectMap['selectItemName01']) {
            listSelect.add(listGoodCustomer[i]);
          }
        }
        for (int i = 0; i < listSelect.length; i++) {
          if (listSelect[i]['currentHandler'] ==
              selectMap['selectItemName02']) {
            listSelect02.add(listSelect[i]);
          }
        }
        for (int i = 0; i < listSelect02.length; i++) {
          if (listSelect02[i][selectMap['selectItemKey03']] ==
              selectMap['selectItemName03']) {
            secondList.add(listSelect02[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] != null &&
          selectMap["selectItemKey02"] == null &&
          selectMap["selectItemKey03"] != null) {
        List listSelect = [];
        for (int i = 0; i < listGoodCustomer.length; i++) {
          if (listGoodCustomer[i]['classified'] ==
              selectMap['selectItemName01']) {
            listSelect.add(listGoodCustomer[i]);
          }
        }
        for (int i = 0; i < listSelect.length; i++) {
          if (listSelect[i][selectMap['selectItemKey03']] ==
              selectMap['selectItemName03']) {
            secondList.add(listSelect[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] != null &&
          selectMap["selectItemKey02"] != null &&
          selectMap["selectItemKey03"] == null) {
        List listSelect = [];
        for (int i = 0; i < listGoodCustomer.length; i++) {
          if (listGoodCustomer[i]['classified'] ==
              selectMap['selectItemName01']) {
            listSelect.add(listGoodCustomer[i]);
          }
        }
        for (int i = 0; i < listSelect.length; i++) {
          if (listSelect[i]['currentHandler'] ==
              selectMap['selectItemName02']) {
            secondList.add(listSelect[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] == null &&
          selectMap["selectItemKey02"] != null &&
          selectMap["selectItemKey03"] != null) {
        List listSelect = [];
        for (int i = 0; i < listGoodCustomer.length; i++) {
          if (listGoodCustomer[i]['currentHandler'] ==
              selectMap['selectItemName02']) {
            listSelect.add(listGoodCustomer[i]);
          }
        }
        for (int i = 0; i < listSelect.length; i++) {
          if (listSelect[i][selectMap['selectItemKey03']] ==
              selectMap['selectItemName03']) {
            secondList.add(listSelect[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] != null &&
          selectMap["selectItemKey02"] == null &&
          selectMap["selectItemKey03"] == null) {
        for (int i = 0; i < listGoodCustomer.length; i++) {
          if (listGoodCustomer[i]['classified'] ==
              selectMap['selectItemName01']) {
            secondList.add(listGoodCustomer[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] == null &&
          selectMap["selectItemKey02"] != null &&
          selectMap["selectItemKey03"] == null) {
        for (int i = 0; i < listGoodCustomer.length; i++) {
          if (listGoodCustomer[i]['currentHandler'] ==
              selectMap['selectItemName02']) {
            secondList.add(listGoodCustomer[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] == null &&
          selectMap["selectItemKey02"] == null &&
          selectMap["selectItemKey03"] != null) {
        for (int i = 0; i < listGoodCustomer.length; i++) {
          if (listGoodCustomer[i][selectMap['selectItemKey03']] ==
              selectMap['selectItemName03']) {
            secondList.add(listGoodCustomer[i]);
          }
        }
      } else {
        for (int i = 0; i < listGoodCustomer.length; i++) {
          secondList.add(listGoodCustomer[i]);
        }
      }
    } else {
      if (selectMap["selectItemKey01"] != null &&
          selectMap["selectItemKey02"] != null &&
          selectMap["selectItemKey03"] != null) {
        List listSelect = [];
        List listSelect02 = [];
        for (int i = 0; i < _listData.length; i++) {
          if (_listData[i]['classified'] == selectMap['selectItemName01']) {
            listSelect.add(_listData[i]);
          }
        }
        for (int i = 0; i < listSelect.length; i++) {
          if (listSelect[i]['currentHandler'] ==
              selectMap['selectItemName02']) {
            listSelect02.add(listSelect[i]);
          }
        }
        for (int i = 0; i < listSelect02.length; i++) {
          if (listSelect02[i][selectMap['selectItemKey03']] ==
              selectMap['selectItemName03']) {
            secondList.add(listSelect02[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] != null &&
          selectMap["selectItemKey02"] == null &&
          selectMap["selectItemKey03"] != null) {
        List listSelect = [];
        for (int i = 0; i < _listData.length; i++) {
          if (_listData[i]['classified'] == selectMap['selectItemName01']) {
            listSelect.add(_listData[i]);
          }
        }
        for (int i = 0; i < listSelect.length; i++) {
          if (listSelect[i][selectMap['selectItemKey03']] ==
              selectMap['selectItemName03']) {
            secondList.add(listSelect[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] != null &&
          selectMap["selectItemKey02"] != null &&
          selectMap["selectItemKey03"] == null) {
        List listSelect = [];
        for (int i = 0; i < _listData.length; i++) {
          if (_listData[i]['classified'] == selectMap['selectItemName01']) {
            listSelect.add(_listData[i]);
          }
        }
        for (int i = 0; i < listSelect.length; i++) {
          if (listSelect[i]['currentHandler'] ==
              selectMap['selectItemName02']) {
            secondList.add(listSelect[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] == null &&
          selectMap["selectItemKey02"] != null &&
          selectMap["selectItemKey03"] != null) {
        List listSelect = [];
        for (int i = 0; i < _listData.length; i++) {
          if (_listData[i]['currentHandler'] == selectMap['selectItemName02']) {
            listSelect.add(_listData[i]);
          }
        }
        for (int i = 0; i < listSelect.length; i++) {
          if (listSelect[i][selectMap['selectItemKey03']] ==
              selectMap['selectItemName03']) {
            secondList.add(listSelect[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] != null &&
          selectMap["selectItemKey02"] == null &&
          selectMap["selectItemKey03"] == null) {
        for (int i = 0; i < _listData.length; i++) {
          if (_listData[i]['classified'] == selectMap['selectItemName01']) {
            secondList.add(_listData[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] == null &&
          selectMap["selectItemKey02"] != null &&
          selectMap["selectItemKey03"] == null) {
        for (int i = 0; i < _listData.length; i++) {
          if (_listData[i]['currentHandler'] == selectMap['selectItemName02']) {
            secondList.add(_listData[i]);
          }
        }
      } else if (selectMap["selectItemKey01"] == null &&
          selectMap["selectItemKey02"] == null &&
          selectMap["selectItemKey03"] != null) {
        for (int i = 0; i < _listData.length; i++) {
          if (_listData[i][selectMap['selectItemKey03']] ==
              selectMap['selectItemName03']) {
            secondList.add(_listData[i]);
          }
        }
      } else {
        for (int i = 0; i < _listData.length; i++) {
          secondList.add(_listData[i]);
        }
      }
    }
  }

  _selectName(String name) {
    switch (name) {
      case "全部分组":
        mapName.remove('selectItemKey01');
        mapName.remove('selectItemName01');
        return mapName;
      case "全民经纪人":
        mapName["selectItemKey01"] = "classified";
        mapName["selectItemName01"] = "0";
        return mapName;
      case "手动添加":
        mapName["selectItemKey01"] = "classified";
        mapName["selectItemName01"] = "1";
        return mapName;
      case "隐号推荐":
        mapName["selectItemKey01"] = "classified";
        mapName["selectItemName01"] = "2";
        return mapName;
      case "平台获客":
        mapName["selectItemKey01"] = "classified";
        mapName["selectItemName01"] = "3";
        return mapName;
      case "全部流程":
        mapName.remove('selectItemKey02');
        mapName.remove('selectItemName02');
        return mapName;
      case "邀约":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "邀约";
        return mapName;
      case "人员判客":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "人员判客";
        return mapName;
      case "认筹/下定":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "认筹/下定";
        return mapName;
      case "认筹/下定审核":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "认筹/下定审核";
        return mapName;
      case "转定":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "转定";
        return mapName;
      case "转定审核":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "转定审核";
        return mapName;
      case "签订合同":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "签订合同";
        return mapName;
      case "合同审核":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "合同审核";
        return mapName;
      case "银行放款":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "银行放款";
        return mapName;
      case "银行放款审核":
        mapName["selectItemKey02"] = "currentHandler";
        mapName["selectItemName02"] = "银行放款审核";
        return mapName;
      case "正常":
        mapName = {
          "selectItemKey03": "workflowStatus",
          "selectItemName03": "0"
        };
        return mapName;
      case "已完结":
        mapName = {
          "selectItemKey03": "workflowStatus",
          "selectItemName03": "1"
        };
        return mapName;
      case "已冻结":
        mapName = {
          "selectItemKey03": "workflowStatus",
          "selectItemName03": "2"
        };
        return mapName;
      case "待执行":
        mapName = {
          "selectItemKey03": "workflowStatus",
          "selectItemName03": "3"
        };
        return mapName;
      case "无效客户":
        mapName = {
          "selectItemKey03": "workflowStatus",
          "selectItemName03": "4"
        };
        return mapName;
      case "A类客户":
        mapName = {"selectItemKey03": "grade", "selectItemName03": "A"};
        return mapName;
      case "B类客户":
        mapName = {"selectItemKey03": "grade", "selectItemName03": "B"};
        return mapName;
      case "C类客户":
        mapName = {"selectItemKey03": "grade", "selectItemName03": "C"};
        return mapName;
      case "D类客户":
        mapName = {"selectItemKey03": "grade", "selectItemName03": "C"};
        return mapName;
    }
  }

  List _getSecondLevels() {
    switch (firstLevelsName) {
      // case '我的关注':
      //   secondLevels = ["已关注", "未关注"];
      //   return secondLevels;
      case '客户状态':
        secondLevels = ["已冻结", "待执行", "已完结", "正常", "无效客户"];
        return secondLevels;
      case '意向级别':
        secondLevels = ["A类客户", "B类客户", "C类客户", "D类客户"];
        return secondLevels;
      // case '标签':
      //   secondLevels = ["无效", "问询", "去电", "下定"];
      //   return secondLevels;
      // case '备注':
      //   secondLevels = ["未备注", "已备注"];
      //   return secondLevels;
      case '是否重置':
        secondLevels = ["重置"];
        return secondLevels;
    }
  }

  int _selectTempFirstLevelIndex = 0;
  _buildAddressWidget(void itemOnTap(String selectValue)) {
    // List firstLevels = ["我的关注", "客户状态", "意向级别", "标签", "备注", "重置"];
    // , "是否重置"
    List firstLevels = ["客户状态", "意向级别"];

    return Row(
      children: <Widget>[
        Container(
          width: 100,
          child: ListView(
            children: firstLevels.map((item) {
              int index = firstLevels.indexOf(item);
              return GestureDetector(
                onTap: () {
                  // print("------");
                  _selectTempFirstLevelIndex = index;
                  if (_selectTempFirstLevelIndex == 0) {
                    // itemOnTap('全城');
                    // return;
                  }
                  setState(() {
                    firstLevelsName = firstLevels[index];
                  });
                },
                child: Container(
                    height: 40,
                    color: _selectTempFirstLevelIndex == index
                        ? Colors.grey[200]
                        : Colors.white,
                    alignment: Alignment.center,
                    child: _selectTempFirstLevelIndex == index
                        ? Text(
                            '$item',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          )
                        : Text('$item')),
              );
            }).toList(),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.grey[200],
            child: ListView.builder(
                itemCount: _getSecondLevels().length,
                itemBuilder: (context, i) => Center(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                        height: 40,
                        child: RaisedButton(
                          child: Text(_getSecondLevels()[i]),
                          onPressed: () {
                            secondList = [];
                            _isSelect = true;
                            if (_getSecondLevels()[i] == "已冻结") {
                              selectList("已冻结");
                            } else if (_getSecondLevels()[i] == "待执行") {
                              selectList("待执行");
                            } else if (_getSecondLevels()[i] == "无效客户") {
                              setState(() {
                                isGoodCustomer = !isGoodCustomer;
                              });
                              if (isGoodCustomer) {
                                setState(() {
                                  isGoodCustomer = true;
                                  _isSelect = false;
                                  secondList = [];
                                  mapName = {};
                                  _textFeid = "";
                                  _isSearch = false;
                                  _dropDownHeaderItemStrings = [
                                    '分组',
                                    '流程',
                                    '筛选',
                                    "重置"
                                  ];
                                });
                                BotToast.showText(text: "已全部重置(有效客户)");
                              } else {
                                selectList("无效客户");
                                BotToast.showText(text: "搜索无效客户");
                              }
                            } else if (_getSecondLevels()[i] == "正常") {
                              selectList("正常");
                            } else if (_getSecondLevels()[i] == "已完结") {
                              selectList("已完结");
                            } else if (_getSecondLevels()[i] == "A类客户") {
                              selectList("A类客户");
                            } else if (_getSecondLevels()[i] == "B类客户") {
                              selectList("B类客户");
                            } else if (_getSecondLevels()[i] == "C类客户") {
                              selectList("C类客户");
                            } else if (_getSecondLevels()[i] == "D类客户") {
                              selectList("D类客户");
                            } else if (_getSecondLevels()[i] == "重置") {
                              //这里已经没有重置了
                            }

                            print(_getSecondLevels()[i]);
                            print("=============");
                            itemOnTap(_getSecondLevels()[i]);
                          },
                          textColor: _getSecondLevels()[i] == "无效客户"
                              ? isGoodCustomer
                                  ? Colors.blue
                                  : Colors.white
                              : Colors.white,
                          color: _getSecondLevels()[i] == "无效客户"
                              ? isGoodCustomer
                                  ? Colors.white
                                  : Colors.blue
                              : Colors.blue,
                          splashColor: Colors.yellow[100],
                          elevation: 5,
                        ),
                      ),
                    )),
          ),
        )
      ],
    );
  }

  ///listView builder 构建
  Widget listViewLayoutBuilder(list, state) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 2.0),
      reverse: false,
      primary: true,
      itemExtent: 118.0,
      shrinkWrap: true,
      itemCount: list.length,
      // cacheExtent: 5.0,
      physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
      itemBuilder: (context, i) => InkWell(
        onTap: () {
          ExtendedNavigator.of(context)
              .push(Routes.customerDetails,
                  arguments: CustomerDetailsArguments(
                      listData:
                          // isGoodCustomer ? listGoodCustomer[i] : _listData[i]
                          list[i]))
              .then((value) {
            if (value == 'refresh') {
              BlocProvider.of<CoustomerBloc>(context)
                  .add(CoustomerEvent.started());
            }
          });
        },
        child: Container(
            // decoration: BoxDecoration(color: Colors.pink),
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //姓名
            Container(
              height: 35.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  // if (list[i]["customerName"] != null)
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      // '${list[i].name}',
                      list[i]["customerName"] != null
                          ? list[i]["customerName"] != ""
                              ? (list[i]["customerName"] + " ")
                              : "匿名用户"
                          : "匿名用户",
                      style: TextStyle(fontSize: 15.0, color: Colors.black),
                    ),
                  ),
                  if (list[i]["grade"] != null && list[i]["grade"] != "")
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      margin: EdgeInsets.fromLTRB(7, 0, 0, 0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.cyan),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        // '${list[i].level}',
                        list[i]["grade"],
                        style: TextStyle(fontSize: 11, color: Colors.cyan),
                      ),
                    ),
                  if (list[i]["workflowStatus"] == "2")
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        // '${list[i].tag}',
                        '已冻结',
                        style: TextStyle(fontSize: 11, color: Colors.blue),
                      ),
                    ),
                  if (list[i]["workflowStatus"] == "3")
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        // '${list[i].tag}',
                        '待执行',
                        style: TextStyle(fontSize: 11, color: Colors.blue),
                      ),
                    ),
                  if (list[i]["workflowStatus"] == "1")
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        // '${list[i].tag}',
                        '已完结',
                        style: TextStyle(fontSize: 11, color: Colors.blue),
                      ),
                    ),
                  if (list[i]["workflowStatus"] == "4")
                    Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.blue),
                          borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        // '${list[i].tag}',
                        '无效客户',
                        style: TextStyle(fontSize: 11, color: Colors.blue),
                      ),
                    ),
                  Expanded(
                    child: Text(''),
                  ),
                ],
              ),
            ),
            //电话

            Container(
                height: 27.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                    margin: EdgeInsets.fromLTRB(8, 3, 0, 0),
                    // decoration: BoxDecoration(
                    //   border: Border(
                    //       bottom:
                    //           BorderSide(width: 1, color: Color(0xffe5e5e5))),
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          list[i]["phone"],
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                        ),
                        // if (list[i].containsKey("houseName"))
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                            list[i].containsKey("houseName")
                                ? list[i]["houseName"] + " "
                                : "楼盘信息不详",
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.grey),
                          ),
                        )
                      ],
                    ))),
            Container(
                height: 25.0,
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white),
                child: Container(
                    margin: EdgeInsets.fromLTRB(8, 3, 0, 0),
                    // decoration: BoxDecoration(
                    //   border: Border(
                    //       bottom:
                    //           BorderSide(width: 1, color: Color(0xffe5e5e5))),
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          theWay(list[i]["classified"]),
                          style: TextStyle(fontSize: 13.0, color: Colors.grey),
                        ),
                        // if (list[i].containsKey("houseName"))
                        Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Text(
                            getSalesman(list[i]["salesmanId"], state),
                            style:
                                TextStyle(fontSize: 13.0, color: Colors.grey),
                          ),
                        )
                      ],
                    ))),
            //备注
            Container(
              height: 25.0,
              decoration: BoxDecoration(color: Colors.white),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                    child: Text(
                      // '${list[i].time}',
                      list[i]["createTime"],
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Text(
                      // '${list[i].contact}',
                      list[i]["currentHandler"] ?? "暂无流程",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                  Expanded(
                    child: Text(''), // 中间用Expanded控件来撑开
                  ),
                  if (list[i]["description"] != null)
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      width: 120,
                      child: Text(
                        // '${list[i].remarks}',
                        list[i]["description"],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 12.0, color: Colors.grey),
                      ),
                    )
                ],
              ),
            )
          ],
        )),
      ),
    );
  }

  theWay(String name) {
    String theWay = "";
    switch (name) {
      case "0":
        theWay = "全民经纪人";
        break;
      case "1":
        theWay = "手动添加";
        break;
      case "2":
        theWay = "隐号推荐";
        break;
      case "3":
        theWay = "隐号推荐";
        break;
    }
    return theWay;
  }

  getSalesman(String salId, state) {
    // print(state.salesman);
    String salName = "";
    for (int i = 0; i < state.salesman.length; i++) {
      if (state.salesman[i]["id"] == salId) {
        salName = state.salesman[i]["realName"];
      }
    }
    return salName;
  }

  Future _openModalBottomSheetText(List salemanList, List listAll) async {
    final option = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  height: 240.0,
                  child: ListView.builder(
                      itemCount: salemanList.length,
                      itemBuilder: (context, i) => Container(
                          height: 50,
                          child: Center(
                            child: InkWell(
                              child: SingleChildScrollView(
                                physics: BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  "  " + salemanList[i]["realName"] + "  ",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              onTap: () async {
                                _searchList = [];
                                for (int j = 0; j < listAll.length; j++) {
                                  if (salemanList[i]["id"] ==
                                      listAll[j]["salesmanId"]) {
                                    _searchList.add(listAll[j]);
                                  }
                                }
                                setState(() {
                                  _isSearch = true;
                                  salemanName = salemanList[i]["realName"];
                                  isGoodCustomer = true;
                                  _isSelect = false;
                                  secondList = [];
                                  mapName = {};
                                  _textFeid = "";
                                  _dropDownHeaderItemStrings = [
                                    '分组',
                                    '流程',
                                    '筛选',
                                    "重置"
                                  ];
                                });
                                Navigator.of(context).pop(true);
                              },
                            ),
                          )))),
              // ListTile(
              //   title: Text('新增',
              //       textAlign: TextAlign.center,
              //       style: TextStyle(color: Colors.blue)),
              //   onTap: () {
              //     showDialog(
              //         barrierDismissible: true,
              //         context: context,
              //         builder: (context) {
              //           return AlertDialog(
              //             title: Text("提示"),
              //             content: TextField(
              //               maxLines: 5,
              //               minLines: 1,
              //               textInputAction: TextInputAction.go,
              //               decoration: InputDecoration(
              //                 hintText: '请输入内容(不能用新增吧)',
              //                 border: InputBorder.none,
              //                 isDense: true,
              //                 hintStyle: TextStyle(color: Colors.grey[400]),
              //               ),
              //             ),
              //             actions: <Widget>[
              //               FlatButton(
              //                 child: Text("确定"),
              //                 onPressed: () {
              //                   Navigator.of(context).pop(true);
              //                 },
              //               )
              //             ],
              //           );
              //         });
              //   },
              // ),
              ListTile(
                title: Text('取消',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue[200])),
                onTap: () {
                  Navigator.pop(context, '取消');
                },
              ),
            ],
          );
        });
    // print(option);
  }
}
