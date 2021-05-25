import 'package:dio/dio.dart';
import 'package:flutter_ui/infrastructure/utils/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_rest_service.g.dart';

@singleton
@RestApi(baseUrl: Constants.AUTH_BASE_URL)
abstract class AuthRestService {
  factory AuthRestService(Dio dio, {String baseUrl}) = _AuthRestService;

  @factoryMethod
  static AuthRestService create() {
    final dio = Dio()
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    return AuthRestService(dio);
  }

  // @POST('/accounts:signUp?key={authKey}')
  // Future<User> signup(
  //     @Path('authKey') String authKey, @Body() Map<String, dynamic> body);
  @PUT('/broker/mapi/br/yuntongxun/mac')
  Future<dynamic> getSMSVerification(@Part() String phone);

  @POST('/broker/mapi/br/userinfo/login')
  Future<dynamic> login(@Part() String phone, @Part() String captcha);

  // @Headers(<String, dynamic>{
  //   "Content-Type": "application/json",
  //   "Custom-Header": "Your header"
  // })

  @POST("/broker/mapi/br/userinfo/affcode")
  Future<dynamic> getAffCode(
      @Body() List<String> affIds,
      @Header('content-type') String contentType,
      @Header('third-session') String sessionKey);

  // headers: {
  //         'third-session': sessionKey,
  //         "content-type": "application/json"
  //       },
  //localhost:8082/weixin/api/es/wxuser/tenant?tenantId=1353183630993920000
  @POST("/weixin/api/es/wxuser/tenant?tenantId={tenantId}")
  Future<dynamic> getaffListbytenantId(@Path() String tenantId);

  @GET("/estate/mapi/es/platforminfo/list")
  Future<dynamic> getplatforminfo();

  @POST('/estate/mapi/es/vistorinfo/login')
  Future<dynamic> eslogin(@Part() String phone, @Part() String captcha);
}
