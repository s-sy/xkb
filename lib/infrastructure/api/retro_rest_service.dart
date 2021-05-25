import 'dart:convert';

import 'package:auto_route/auto_route_annotations.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_ui/domain/web_scoket/web_scoket_failure.dart';
import 'package:flutter_ui/infrastructure/utils/constants.dart';
import 'package:http/http.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'retro_rest_service.g.dart';

@singleton
@RestApi(baseUrl: Constants.BASE_URL)
abstract class RetroRestService {
  factory RetroRestService(Dio dio, {String baseUrl}) = _RetroRestService;

  @factoryMethod
  static RetroRestService create() {
    final dio = Dio()
      // ..interceptors.add(LogInterceptor(
      //     responseBody: true,
      //     error: true,
      //     requestHeader: true,
      //     responseHeader: true,
      //     request: true,
      //     requestBody: true))
      ..interceptors.add(InterceptorsWrapper(onResponse: (response) async {
        print(response.data);
        if (response.data is Map) {
          if (response.data.containsKey("code")) {
            if (response.data["code"] == 60001) {
              BotToast.showText(text: "用户已失效，请重新登陆");
              SharedPreferences sharedPrefer =
                  await SharedPreferences.getInstance();
              sharedPrefer.remove("UserInfo");
            } else if (response.data["code"] == 60002) {
              BotToast.showText(text: "用户未登陆，请前往我的登陆");
            }
          }
        }
      }, onError: (DioError e) async {
        print(e.message);
      }))
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
        SharedPreferences _storage = await SharedPreferences.getInstance();
        options.receiveTimeout = 10000;
        options.connectTimeout = 50000;
        options.headers['third-session'] =
            _storage.getString('CACHED_SESSION_KEY');
        return options;
      }));
    return RetroRestService(dio);
  }

  @GET("/broker/mapi/br/chatting/contacts")
  Future<dynamic> getContacts(@Queries() Map<String, dynamic> formdata);

  @GET("/broker/mapi/br/chatting/unread")
  Future<dynamic> getUnreadMessages(@Queries() Map<String, dynamic> formdata);

  @GET("/broker/mapi/br/chatting/page")
  Future<dynamic> historyMessage(@Queries() Map<String, dynamic> formdata);

  @POST("/broker/mapi/br/file/upload")
  Future<dynamic> uploadImgOrAudio(@Body() FormData formdataUpload);

  @POST("/broker/mapi/br/chatting/add")
  Future<dynamic> sendChatMessage(@Body() Map<String, dynamic> formdata);

  @GET("/broker/mapi/br/chatting/received/{contactId}")
  Future<dynamic> getId(@Path("contactId") String contactId);

  @GET("/broker/engine-rest/task/") //这个是对应的getTask
  Future<dynamic> viewProsess(@Queries() Map<String, dynamic> formdata);

  @GET("/broker/engine-rest/process-instance/{executionId}/variables")
  Future<dynamic> viewProsessInfo(@Path() String executionId);

  @POST("/broker/engine-rest/task/{id}/complete")
  Future<dynamic> dealWithProcess(
      @Path() String id, @Body() Map<String, dynamic> formdata);

  @GET("/broker/engine-rest/job")
  Future<dynamic> nextRemind(@Queries() Map<String, dynamic> formdata);

  @POST("/broker/mapi/br/userinfo/qrcode")
  Future<dynamic> shareCode(@Queries() Map<String, dynamic> formdata);

  @GET("/broker/mapi/br/userinfo/salesman/{agentId}")
  Future<dynamic> getAgentName(@Path() String agentId);

  @PUT("/broker/mapi/br/userinfo")
  Future<dynamic> setJPushRid(@Body() Map<String, dynamic> formdata);

  @GET("/broker/mapi/br/remind/page")
  Future<dynamic> managerRemindList(@Queries() Map<String, dynamic> formdata);

  @GET("/broker/mapi/br/referrals/remind")
  Future<dynamic> managerRemindDetails(
      @Queries() Map<String, dynamic> formdata);

  @GET("/broker/mapi/br/remind/unread")
  Future<dynamic> unreadMessageCount(@Queries() Map<String, dynamic> formdata);

  @PUT("/broker/mapi/br/remind")
  Future<dynamic> batchUpdate(@Queries() Map<String, dynamic> formdata);

  @PUT("/broker/mapi/br/userinfo")
  Future<dynamic> submitInfo(@Body() Map<String, dynamic> formdata);

//请求房源期数
  @GET('/broker/mapi/br/housing/staging')
  Future<dynamic> getHouseIng(
    @Queries() Map<String, dynamic> queries,
  );
  // 获取房源期数后  根据栋号，单元 获取渲染列表
  @POST('/broker/mapi/br/housing/list')
  Future getHouseListData(
    @Queries() Map<String, dynamic> queries,
  );
  //获取发送控房的参数 //列
  @GET('/broker/mapi/br/referrals/page')
  Future referrals(@Queries() Map<String, dynamic> activeData);
  //获取控房的流程ID
  @GET('/broker/engine-rest/process-definition')
  Future getProcessDefinition(@Queries() Map<String, dynamic> query);
  //发起流程
  @POST('/broker/engine-rest/process-definition/{processId}/submit-form')
  Future controlPrecess(
      @Path() String processId, @Body() Map<String, dynamic> data);
  //根据user用户Id来查询自己的所有流程
  @GET('/broker/engine-rest/task')
  Future getTask(
    @Queries() Map<String, dynamic> query,
  );
  //根据流程实例ID查询所有参数
  @GET('/broker/engine-rest/process-instance/{processInstanceId}/variables')
  Future getProcessedData(@Path() String processInstanceId);
  //流程处理这里processId 是流程的id
  @POST('/broker/engine-rest/task/{processId}/complete')
  Future processFlow(
      @Path() String processId, @Body() Map<String, dynamic> query);

  //根据楼盘Id查询所有置业顾问
  @GET("/broker/mapi/br/userinfo/salesman/{affId}")
  Future getSalesmanList(@Path() String affId);

  //我的客户列表
  @GET("/broker/mapi/br/referrals/page")
  Future getCoustomList(@Queries() Map<String, dynamic> query);

  //获取计算下次提醒的时间数据
  @GET("/broker/engine-rest/job")
  Future getNextTimeData(@Query("processInstanceId") String processInstanceId);

  //上传图片
  @POST("/broker/mapi/br/file/upload")
  Future qiNiuLoad(@Body() FormData query);

  //冻结客户
  @PUT("/broker/engine-rest/process-instance/{procedId}/variables/suspendTask")
  Future frezzeprcessed(
      @Path() String procedId, @Body() Map<String, dynamic> query);
  //解冻
  @PUT("/broker/engine-rest/process-instance/{procedId}/suspended")
  Future unFrezzeprcessed(
      @Path() String procedId, @Body() Map<String, dynamic> query);

  //提前执行 延期客户
  @POST("/broker/engine-rest/message")
  Future executionWithoutdelay(
    @Body() Map<String, dynamic> query,
  );

  //查询历史
  @GET("/broker/engine-rest/history/task")
  Future getHistory(@Queries() Map<String, dynamic> query);

  //查询历史中的参数
  @GET("/broker/engine-rest/history/variable-instance")
  Future getHistoryVariable(@Queries() Map<String, dynamic> query);
  //购房意向
  @GET("/broker/mapi/br/referrals/mc/{phone}")
  Future getMultipleCustomer(
      @Path() String phone, @Queries() Map<String, dynamic> query);
  //根据楼盘Id查询所有人员
  @GET("/broker/mapi/br/userinfo/personnel/{affId}")
  Future getPersonnelList(@Path() String affId);

  //修改客户详情-备注
  @PUT("/broker/mapi/br/referrals")
  Future updateRemarks(@Body() Map<String, dynamic> data);

//配置信息
  @GET("/broker/mapi/br/variabledefinition/list")
  Future getDefinitionlist(@Queries() Map<String, dynamic> definQuery);

// 获取流程历史条数（新客户）
  @GET('/broker/engine-rest/history/task')
  Future getprocessCount(@Queries() Map<String, dynamic> query);

  //经理跟新房源
  @PUT("/broker/mapi/br/housing")
  Future<dynamic> updataHousing(@Body() Map<String, dynamic> data);

  // 获取首页客户名字
  @GET('/broker/engine-rest/variable-instance')
  Future getCoustomerName(@Queries() Map<String, dynamic> getNameQuery);

  //房源变更
  @POST("/broker/mapi/br/housing/switchover")
  Future changeHouse(@Queries() Map<String, dynamic> formdata);

  //首页幻灯片
  @GET('/broker/mapi/br/slideshow/list')
  Future slideshow(@Queries() Map<String, dynamic> formdata);

  //登陆角色获取
  @GET('/broker/mapi/br/userinfo/roles')
  Future getRoles(@Queries() Map<String, dynamic> formdata);

  //登陆楼盘获取
  @GET('/broker/mapi/br/userinfo/affiliated')
  Future getAffiliated(@Queries() Map<String, dynamic> formdata);

  //后台拿最新版本
  @GET('/broker/mapi/br/versioning/newest')
  Future testVersion();

  //获取图表总数据
  @GET("/broker/mapi/br/referrals/analysis/{affId}")
  Future getPie(@Path() String affId, @Query("tenantId") String tenantId);

  // 图表
  @GET("/broker/mapi/br/referrals/duration/{affId}")
  Future getDuration(
    @Path() String affId,
    @Query("tenantId") String tenantId,
    @Query("duration") String duration,
    @Query("portion") String portion,
  );

  @GET("/broker/mapi/br/referrals/fastreport/{mineId}")
  Future getFastreport(
    @Path() String mineId,
    @Query("duration") String mineDuration,
    @Query("portion") String minePortion,
    @Query("tenantId") String tenantId,
    @Query("affiliationId") String affiliationId,
    @Query("leaderweek") int leaderweek,
  );

  // @POST("/mapi/br/userinfo/affcode")
  // Future<dynamic> getAffCode(@Body() List<String> affIds);

  // @GET("/products.json?auth={authToken}")
  // Future<Map<String, Product>> getProducts(@Path("authToken") String authToken);

  // @POST("/products.json?auth={authToken}")
  // Future<NameId> addProduct(
  //     @Path("authToken") String authToken, @Body() String product);

  // @PATCH("/products/{id}.json?auth={authToken}")
  // Future<Product> editProduct(@Path("id") String id,
  //     @Path("authToken") String authToken, @Body() String product);

  // @DELETE("/products/{id}.json?auth={authToken}")
  // Future<void> deleteProduct(
  //     @Path("id") String id, @Path("authToken") String authToken);
}
