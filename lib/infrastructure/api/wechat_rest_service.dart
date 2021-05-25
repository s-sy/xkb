import 'package:dio/dio.dart';
import 'package:flutter_ui/infrastructure/utils/constants.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'wechat_rest_service.g.dart';

@singleton
@RestApi(baseUrl: Constants.AUTH_BASE_URL)
abstract class WechatRestService {
  factory WechatRestService(Dio dio, {String baseUrl}) = _WechatRestService;

  @factoryMethod
  static WechatRestService create() {
    final dio = Dio()
      ..interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        SharedPreferences _storage = await SharedPreferences.getInstance();
        options.receiveTimeout = 10000;
        options.connectTimeout = 50000;
        options.headers['tenant-session'] =
            _storage.getString('tenant-session');
        print(_storage.getString('tenant-session'));
        return options;
      }));
    return WechatRestService(dio);
  }

  // @POST('/accounts:signUp?key={authKey}')
  // Future<User> signup(
  //     @Path('authKey') String authKey, @Body() Map<String, dynamic> body);
  // @PUT('/mapi/br/yuntongxun/mac')
  // Future<dynamic> getSMSVerification(@Part() String phone);

  // @POST('/mapi/br/userinfo/login')
  // Future<dynamic> login(@Part() String phone, @Part() String captcha);

  // @Headers(<String, dynamic>{
  //   "Content-Type": "application/json",
  //   "Custom-Header": "Your header"
  // })

  // @POST("/mapi/br/userinfo/affcode")
  // Future<dynamic> getAffCode(
  //     @Body() List<String> affIds,
  //     @Header('content-type') String contentType,
  //     @Header('third-session') String sessionKey);

  // headers: {
  //         'third-session': sessionKey,
  //         "content-type": "application/json"
  //       },
  //根据租户Id 查询楼盘list
  @GET("/estate/mapi/es/platforminfo")
  Future<dynamic> getListByTenantId(@Query("tenantId") String tenantId);

  //通告 和 幻灯广告
  @GET("/estate/mapi/es/advertisement")
  Future getNotice(@Queries() Map<String, dynamic> query);

  //户型
  @GET("/estate/mapi/es/apartmentlayout/page")
  Future getapartmentlayout(@Queries() Map<String, dynamic> query);

  //新闻动态
  @GET("/estate/mapi/es/newstrends/page")
  Future getNewsinformation(@Queries() Map<String, dynamic> query);

  //楼盘炫拍
  @GET("/estate/mapi/es/awesomeshooting/page")
  Future getAwesomeshooting(@Queries() Map<String, dynamic> query);

  //楼盘问答
  @GET("/estate/mapi/es/askquestions/page")
  Future getQuestionsPage(@Queries() Map<String, dynamic> query);
  // 首頁三个浏览量
  @GET("/estate/mapi/es/basicinfo/total/{affId}")
  Future gettotalviews(@Path() String affId);

  //楼盘点评
  @GET("/estate/mapi/es/reviews/page")
  Future getReadingReviews(@Queries() Map<String, dynamic> query);

  //置业顾问列表
  @GET("/estate/mapi/es/salesmen/all")
  Future getTaills(@Query("affId") String affId);

  //楼盘详情
  @GET("/estate/mapi/es/detailsinfo/{affId}")
  Future getBaseBudding(@Path() String affId);

  //电话验证 平台客户
  @GET("/broker/mapi/br/referrals/verify")
  Future checkphonept(@Queries() Map<String, dynamic> query);

  //获取流程定义ID
  @GET('/broker/engine-rest/process-definition')
  Future getProcessDefinition(@Queries() Map<String, dynamic> query);

  //发起流程
  @POST('/broker/engine-rest/process-definition/{id}/submit-form')
  Future sendworkflow(@Path() String id, @Body() Map<String, dynamic> query);

  //电话验证 经纪人 和 隐号 客户
  @GET("/broker/mapi/br/referrals/verification")
  Future checkphonebyborker(@Queries() Map<String, dynamic> query);

  //取消关注
  @POST("/estate/mapi/es/attention/concern")
  Future apartmentConcerncennel(@Queries() Map<String, dynamic> query);

  //我的关注列表
  @GET("/estate/api/es/attention/list2")
  Future getApartmentConcern(@Queries() Map<String, dynamic> query);

  //我的回答
  @GET("/estate/api/es/topicreply/page")
  Future getTopicreply(@Queries() Map<String, dynamic> query);

  //写回复  1 炫拍  2 点评
  @POST("/estate/mapi/es/topicreply")
  Future commentdazzle(@Queries() Map<String, dynamic> query);
}
