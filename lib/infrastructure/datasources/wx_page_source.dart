import 'dart:convert';

import 'package:flutter_ui/infrastructure/api/result/api_result.dart';
import 'package:flutter_ui/infrastructure/api/result/network_exceptions.dart';
import 'package:flutter_ui/infrastructure/api/wechat_rest_haskey_service.dart';
import 'package:flutter_ui/infrastructure/api/wechat_rest_service.dart';
import 'package:flutter_ui/infrastructure/api/auth_rest_service.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class WxpageSource {
  Future getplatList();

  Future getListbyTendentId(String tenantId);

  Future getListByTenantId(String tenantId);

  Future getNotice(Map<String, dynamic> query);

  Future getapartmentlayout(Map<String, dynamic> query);

  Future getNewsinformation(Map<String, dynamic> query);

  Future getAwesomeshooting(Map<String, dynamic> query);

  Future getQuestionsPage(Map<String, dynamic> query);

  Future gettotalviews(String affId);

  Future getReadingReviews(Map<String, dynamic> query);

  Future getTaills(String affId);

  Future getBaseBudding(String affId);

  Future checkphonept(Map<String, dynamic> query);

  Future getProcessDefinition(String tenantIdIn);

  Future sendworkflow(String id, Map<String, dynamic> query);

  Future checkphonebyborker(Map<String, dynamic> query);

  Future apartmentConcerncennel(Map<String, dynamic> query);

  Future getApartmentConcern(Map<String, dynamic> query);

  Future getTopicreply(Map<String, dynamic> query);

  Future commentdazzle(Map<String, dynamic> query);

  Future releasepreviews(Map<String, dynamic> query);

  Future releasedazzle(Map<String, dynamic> query);

  Future releaseprealestate(Map<String, dynamic> query);

  Future goconcern(Map<String, dynamic> query);

  Future mineGetAwesomeshooting(Map<String, dynamic> query);
  Future mineGetQuestionsPage(Map<String, dynamic> query);
  Future mineGetReadingReviews(Map<String, dynamic> query);
  Future mineGetTopicreply(Map<String, dynamic> query);
  Future referrals(Map<String, dynamic> query);
  Future getvistorInfo();
  Future updatevistorInfo(Map<String, dynamic> query);
}

@LazySingleton(as: WxpageSource)
class WxpageSourceImpl implements WxpageSource {
  SharedPreferences _sharedPreferences;
  final AuthRestService _authrestService;
  final WechatRestService _wechatrestService;
  final WechatRestHaskeyService _wechatRestHaskeyService;
  WxpageSourceImpl(this._sharedPreferences, this._authrestService,
      this._wechatrestService, this._wechatRestHaskeyService);

  @override
  Future getplatList() async {
    try {
      var reslut = await _authrestService.getplatforminfo();
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getListbyTendentId(String tenantId) async {
    try {
      var reslut = await _authrestService.getaffListbytenantId(tenantId);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getListByTenantId(String tenantId) async {
    try {
      var reslut = await _wechatrestService.getListByTenantId(tenantId);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getNotice(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.getNotice(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getapartmentlayout(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.getapartmentlayout(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getNewsinformation(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.getNewsinformation(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getAwesomeshooting(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.getAwesomeshooting(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getQuestionsPage(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.getQuestionsPage(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future gettotalviews(String affId) async {
    try {
      var reslut = await _wechatrestService.gettotalviews(affId);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getReadingReviews(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.getReadingReviews(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getTaills(String affId) async {
    try {
      var reslut = await _wechatrestService.getTaills(affId);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getBaseBudding(String affId) async {
    try {
      var reslut = await _wechatrestService.getBaseBudding(affId);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future checkphonept(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.checkphonept(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getProcessDefinition(String tenantIdIn) async {
    try {
      Map<String, dynamic> query = {"tenantIdIn": tenantIdIn};
      var reslut = await _wechatrestService.getProcessDefinition(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future sendworkflow(String id, Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.sendworkflow(id, query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future checkphonebyborker(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.checkphonebyborker(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future apartmentConcerncennel(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.apartmentConcerncennel(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getApartmentConcern(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.getApartmentConcern(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getTopicreply(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatrestService.getTopicreply(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future commentdazzle(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.commentdazzle(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future releasepreviews(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.releasepreviews(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future releasedazzle(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.releasedazzle(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future releaseprealestate(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.releaseprealestate(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future goconcern(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.goconcern(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future mineGetAwesomeshooting(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.getAwesomeshooting(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future mineGetQuestionsPage(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.getQuestionsPage(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future mineGetReadingReviews(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.getReadingReviews(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future mineGetTopicreply(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.getTopicreply(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future referrals(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.referrals(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future getvistorInfo() async {
    try {
      var reslut = await _wechatRestHaskeyService.getvistorInfo();
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future updatevistorInfo(Map<String, dynamic> query) async {
    try {
      var reslut = await _wechatRestHaskeyService.updatevistorInfo(query);
      return Future.value(reslut);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
