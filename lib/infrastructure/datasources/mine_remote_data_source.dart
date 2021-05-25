import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ui/infrastructure/api/result/api_result.dart';
import 'package:flutter_ui/infrastructure/api/result/network_exceptions.dart';
import 'package:flutter_ui/infrastructure/api/retro_rest_service.dart';
import 'package:flutter_ui/presentation/home/message/process/save_image.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class MineRemoteDataSource {
  Future<Unit> handleProcess();
  Future<ApiResult> getErWeiCode();
  Future<ApiResult> submitInfo(String image, String nickName);

  Future<ApiResult> testVersion(String vInfo);
}

const CACHED_SIGN_IN_USER = 'CACHED_SIGN_IN_USER';

@LazySingleton(as: MineRemoteDataSource)
class MineRemoteDataSourceImpl implements MineRemoteDataSource {
  final SharedPreferences sharedPreferences;
  final RetroRestService retroRestService;
  MineRemoteDataSourceImpl(this.sharedPreferences, this.retroRestService);

  @override
  Future<Unit> handleProcess() async {
    //我的页面用不到这一条，只是要通bloc就用了
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    // print(jsonDecode(cachedSignInUser)['affiliated'][0]);
    // print(jsonDecode(cachedSignInUser)['tenantId']);
    // String affiliateds = sharedPreferences.get('AFFILIATEDS');
    // print(affiliateds);
    Map<String, dynamic> formdata = {
      "affId": jsonDecode(cachedSignInUser)['affiliated'][0],
      "tenantId": jsonDecode(cachedSignInUser)['tenantId'],
    };
    final unreadMessageCount = await retroRestService
        .unreadMessageCount(formdata); //@ApiOperation(value = "未读消息计数")
    print(unreadMessageCount);
    final batchUpdate = await retroRestService
        .batchUpdate(formdata); //@ApiOperation(value = "批量更新")
    print(batchUpdate);
    return unit;
  }

  Future<String> createFileFromString(String base64Str) async {
    Uint8List bytes = base64.decode(base64Str);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = File(
        "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
    await file.writeAsBytes(bytes);
    return file.path;
  }

  @override
  Future<ApiResult> getErWeiCode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userInfo = sharedPreferences.get('CACHED_SIGN_IN_USER');
    String houseShortCode = sharedPreferences.get('HOUSESHORTCODE');
    if (houseShortCode == null) {
      String affiliateds = sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseShortCode = jsonDecode(affiliateds)[0]["affiliationCode"];
      }
    }
    // print(houseShortCode);
    // print(jsonDecode(userInfo)['userCode'].toString());
    Map<String, dynamic> formdata = {
      "sceneStr": "cle_" +
          houseShortCode +
          "_" +
          jsonDecode(userInfo)['userCode'].toString(),
      "path": "pages/index/index"
    };
    try {
      final response = await retroRestService.shareCode(formdata);
      // print(response);
      Uint8List bytes = base64.decode(response['data']);
      String dir = (await getApplicationDocumentsDirectory()).path;
      File file = File(
          "$dir/" + DateTime.now().millisecondsSinceEpoch.toString() + ".png");
      await file.writeAsBytes(bytes);
      print(file.path);
      return ApiResult.success(data: file.path);
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> submitInfo(String image, String nickName) async {
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    // print(cachedSignInUser);
    // print(image);
    // print(nickName);
    Map<String, dynamic> map = jsonDecode(cachedSignInUser);
    map['nickName'] = nickName;
    if (image.startsWith('https')) {
      map['headimgUrl'] = image;
    } else {
      var imageName = image.substring(image.lastIndexOf("/") + 1, image.length);
      FormData formdataUpload = FormData.fromMap({
        "file": await MultipartFile.fromFile(image, filename: imageName),
        'dir': 'material',
        'fileType': 'image',
        'tenantId': jsonDecode(cachedSignInUser)['tenantId'],
      });
      final response = await retroRestService.uploadImgOrAudio(formdataUpload);
      if (response != null) {
        String imgOnline = jsonDecode(response)['link'];
        // print(imgOnline);
        map['headimgUrl'] = imgOnline;
      }
    }

    try {
      final response = await retroRestService.submitInfo(map);
      print(response);
      if (response['ok'] == true) {
        sharedPreferences.remove('CACHED_SIGN_IN_USER');
        sharedPreferences.setString(CACHED_SIGN_IN_USER, json.encode(map));
        return ApiResult.success(data: response['data'].toString());
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> testVersion(String vInfo) async {
    try {
      final response = await retroRestService.testVersion();
      // print(response);
      if (response['ok'] == true) {
        return ApiResult.success(data: response['data']);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
