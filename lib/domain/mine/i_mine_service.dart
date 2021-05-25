import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/core/failures.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';

abstract class IMineService {
  Future<Either<ValueFailure, Unit>> handleProcess();
  Future<Either<WebScoketFailure, String>> getErWeiCode();
  Future<Either<WebScoketFailure, String>> submitInfo(
      String image, String nickName);

  Future<Either<WebScoketFailure, Map<String, dynamic>>> testVersion(vInfo);
}
