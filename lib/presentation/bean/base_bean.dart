//这个是测试用的数据，以后用bloc 就不需要了
import 'package:flutter/material.dart';

class BaseBean {
  int testNum;
  String name;
  String phone;
  String level;
  String tag;
  String time;
  String contact;
  String remarks;
  bool isAttention;
  BaseBean({
    this.testNum,
    this.name,
    this.phone,
    this.level,
    this.tag,
    this.time,
    this.contact,
    this.remarks,
    this.isAttention,
  });
}

/* class TestBaseBean {
  List<BaseBean> list = new List<BaseBean>();
  BaseBean aa = new BaseBean('向女士', '13425478552', 'C', '问询',
      '2020-07-15 10:25:09', '来访', '看177平11楼，算了价格');
  BaseBean bb = new BaseBean(
      '曾先生', '13425478552', 'D', '无效', '2020-07-15 10:25:09', '去电', '无效客户');
  BaseBean cc = new BaseBean(
      '江女士', '14875426558', 'B', '问询', '2020-07-15 10:25:09', '其他', '渠道客户');

  test(List<BaseBean> list) {
    list.add(aa);
    list.add(bb);
    list.add(cc);
    return list;
  }
}
 */
