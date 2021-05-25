import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/core/failures.dart';
import 'package:flutter_ui/domain/mine/i_mine_service.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';
import 'package:flutter_ui/infrastructure/datasources/mine_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IMineService, env: [Environment.prod])
class MineService implements IMineService {
  final MineRemoteDataSource mineRemoteDataSource;

  MineService(this.mineRemoteDataSource);

  @override
  Future<Either<ValueFailure, Unit>> handleProcess() async {
    await mineRemoteDataSource.handleProcess();
    return right(unit);
  }

  @override
  Future<Either<WebScoketFailure, String>> getErWeiCode() async {
    var apiResult = await mineRemoteDataSource.getErWeiCode();
    String getErWeiCode = "";
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            getErWeiCode = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(getErWeiCode)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, String>> submitInfo(
      String image, String nickName) async {
    var apiResult = await mineRemoteDataSource.submitInfo(image, nickName);
    String submitInfo = "";
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            submitInfo = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(submitInfo)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }

  @override
  Future<Either<WebScoketFailure, Map<String, dynamic>>> testVersion(
      vInfo) async {
    var apiResult = await mineRemoteDataSource.testVersion(vInfo);
    Map<String, dynamic> testVersion = {};
    try {
      bool successAndFailure = false;
      apiResult.when(
          success: (right) {
            successAndFailure = true;
            testVersion = right;
          },
          failure: (error) => successAndFailure = false);
      return successAndFailure
          ? right(testVersion)
          : left(const WebScoketFailure.receiveMessageFail());
    } on Exception catch (error) {
      print("error is :: " + error.toString());
      return left(const WebScoketFailure.serverError());
    }
  }
}
