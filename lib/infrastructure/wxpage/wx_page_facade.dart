import 'package:flutter_ui/domain/wxpage/i_wx_page_facade.dart';
import 'package:flutter_ui/infrastructure/datasources/wx_page_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IWxPageFacade)
class WxpageFacade implements IWxPageFacade {
  WxpageSource _wxPageSource;

  WxpageFacade(this._wxPageSource);

  @override
  Future getplatList() async {
    var reslut = await _wxPageSource.getplatList();
    return Future.value(reslut);
  }

  @override
  Future getListbyTendentId(String tenantId) async {
    var reslut = await _wxPageSource.getListbyTendentId(tenantId);
    return Future.value(reslut);
  }

  @override
  Future getListByTenantId(String tenantId) async {
    var reslut = await _wxPageSource.getListByTenantId(tenantId);
    return Future.value(reslut);
  }

  @override
  Future getNotice(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.getNotice(query);
    return Future.value(reslut);
  }

  @override
  Future getapartmentlayout(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.getapartmentlayout(query);
    return Future.value(reslut);
  }

  @override
  Future getNewsinformation(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.getNewsinformation(query);
    return Future.value(reslut);
  }

  @override
  Future getAwesomeshooting(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.getAwesomeshooting(query);
    return Future.value(reslut);
  }

  @override
  Future getQuestionsPage(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.getQuestionsPage(query);
    return Future.value(reslut);
  }

  @override
  Future gettotalviews(String affId) async {
    var reslut = await _wxPageSource.gettotalviews(affId);
    return Future.value(reslut);
  }

  @override
  Future getReadingReviews(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.getReadingReviews(query);
    return Future.value(reslut);
  }

  @override
  Future getTaills(String affId) async {
    var reslut = await _wxPageSource.getTaills(affId);
    return Future.value(reslut);
  }

  @override
  Future getBaseBudding(String affId) async {
    var reslut = await _wxPageSource.getBaseBudding(affId);
    return Future.value(reslut);
  }

  @override
  Future checkphonept(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.checkphonept(query);
    return Future.value(reslut);
  }

  @override
  Future getProcessDefinition(String tenantIdIn) async {
    var reslut = await _wxPageSource.getProcessDefinition(tenantIdIn);
    return Future.value(reslut);
  }

  @override
  Future sendworkflow(String id, Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.sendworkflow(id, query);
    return Future.value(reslut);
  }

  @override
  Future checkphonebyborker(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.checkphonebyborker(query);
    return Future.value(reslut);
  }

  @override
  Future apartmentConcerncennel(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.apartmentConcerncennel(query);
    return Future.value(reslut);
  }

  @override
  Future getApartmentConcern(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.getApartmentConcern(query);
    return Future.value(reslut);
  }

  @override
  Future getTopicreply(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.getTopicreply(query);
    return Future.value(reslut);
  }

  @override
  Future commentdazzle(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.commentdazzle(query);
    return Future.value(reslut);
  }

  @override
  Future releasepreviews(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.releasepreviews(query);
    return Future.value(reslut);
  }

  @override
  Future releasedazzle(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.releasedazzle(query);
    return Future.value(reslut);
  }

  @override
  Future releaseprealestate(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.releaseprealestate(query);
    return Future.value(reslut);
  }

  @override
  Future goconcern(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.goconcern(query);
    return Future.value(reslut);
  }

  @override
  Future mineGetAwesomeshooting(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.mineGetAwesomeshooting(query);
    return Future.value(reslut);
  }

  @override
  Future mineGetQuestionsPage(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.mineGetQuestionsPage(query);
    return Future.value(reslut);
  }

  @override
  Future mineGetReadingReviews(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.mineGetReadingReviews(query);
    return Future.value(reslut);
  }

  @override
  Future mineGetTopicreply(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.mineGetTopicreply(query);
    return Future.value(reslut);
  }

  @override
  Future referrals(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.referrals(query);
    return Future.value(reslut);
  }

  @override
  Future getvistorInfo() async {
    var reslut = await _wxPageSource.getvistorInfo();
    return Future.value(reslut);
  }

  @override
  Future updatevistorInfo(Map<String, dynamic> query) async {
    var reslut = await _wxPageSource.updatevistorInfo(query);
    return Future.value(reslut);
  }
}
