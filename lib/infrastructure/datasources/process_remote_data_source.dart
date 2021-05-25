import 'dart:typed_data';

import 'package:flutter_ui/infrastructure/api/result/api_result.dart';
import 'package:flutter_ui/infrastructure/api/result/network_exceptions.dart';
import 'package:flutter_ui/infrastructure/api/retro_rest_service.dart';
import 'package:flutter_ui/presentation/bean/consultant_bean.dart';
import 'package:flutter_ui/presentation/bean/process_bean.dart';
import 'package:flutter_ui/presentation/components/chat/public.dart';
import 'package:flutter_ui/presentation/home/message/process/save_image.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share/share.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ProcessRemoteDataSource {
  Future<ApiResult> handleProcess();
  Future<ApiResult> dealWithProcess(String id, String taskDefinitionKey);
  Future<ApiResult> nextRemind(String processInstanceId);
  Future<ApiResult> handleByConsultant(ConsultantBean consultantBean);
  Future<ApiResult> shareCode();
}

List<String> imagePaths = [];

@LazySingleton(as: ProcessRemoteDataSource)
class ProcessRemoteDataSourceImpl implements ProcessRemoteDataSource {
  final RetroRestService retroRestService;
  ProcessRemoteDataSourceImpl(this.retroRestService);
  @override
  Future<ApiResult> handleProcess() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String cachedSignInUser = sharedPreferences.get('CACHED_SIGN_IN_USER');
    Map<String, dynamic> formdata = {
      "assigneeI": jsonDecode(cachedSignInUser)['id'],
      // "assigneeIn": "1318816628100804610" //经理
      //置业顾问
      // "assignee": '1332158148605116417',
      //经理
      // "assignee": '1332158637736460289',
      //财务
      // "assignee": '1332159825970200578',
      //销秘
      // "assignee": '1332159104952565762',
    };
    try {
      final response = await retroRestService.viewProsess(formdata);
      // if (response != null) {
      //   List list = response;
      //   List<ProcessBean> _listProcessBean = [];
      //   for (int i = 0; i < list.length; i++) {
      //     String nickName = "";
      //     String salesName = "";
      //     String id = list[i]['id'];
      //     String name = list[i]['name'];
      //     String createTime =
      //         list[i]['created'].substring(0, 19).replaceRange(10, 11, ' ' * 1);
      //     String taskDefinitionKey = list[i]['taskDefinitionKey'];
      //     String executionId = list[i]['executionId'];
      //     String processInstanceId = list[i]['processInstanceId'];
      //     //不清楚这两个有什么区别，返回的字段都一样
      //     final responseInfo =
      //         await retroRestService.viewProsessInfo(executionId);
      //     //通过置业顾问id查找置业顾问名字
      //     // print(jsonDecode(cachedSignInUser)['affiliated'][0]);
      //     final responseName = await retroRestService
      //         .getAgentName(jsonDecode(cachedSignInUser)['affiliated'][0]);
      //     List listName = responseName["data"];
      //     for (int i = 0; i < listName.length; i++) {
      //       if (responseInfo['agentId']['value'] == listName[i]["id"]) {
      //         nickName = listName[i]["nickName"];
      //         salesName = listName[i]["realName"];
      //         // print(listName[i]["nickName"]);
      //         // print(listName[i]["realName"]);
      //       }
      //     }
      //     _listProcessBean.add(ProcessBean(
      //       id: id,
      //       name: name,
      //       created: createTime,
      //       taskDefinitionKey: taskDefinitionKey,
      //       executionId: executionId,
      //       processInstanceId: processInstanceId,
      //       customerName: responseInfo['customerName']['value'],
      //       brokerName: responseInfo['brokerName']['value'],
      //       phone: responseInfo['phone']['value'],
      //       brokerPhone: responseInfo['brokerPhone']['value'],
      //       introduction: responseInfo['introduction']['value'],
      //       depositDuration: responseInfo['depositDuration']['value'],
      //       realName: responseInfo['userInfoDto']['value']['realName'], //销秘?
      //       agentId: responseInfo['agentId']['value'],
      //       nickName: nickName,
      //       salesName: salesName,
      //     ));
      //   }
      // return ApiResult.success(data: _listProcessBean);
      // }
      if (response != null) {
        return ApiResult.success(data: response);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Map<String, dynamic> getFormdata(String taskDefinitionKey) {
    Map<String, dynamic> formdata;
    switch (taskDefinitionKey) {
      case 'ManagerCheckGuest':
        //人员判客
        formdata = {"msg": "eeeee"};
        return formdata;

      case 'ManagerAssigns':
        //分配客户
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "agentId": {"value": "1332158148605116417"},
            "currentTaskDeposit": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'CategoryManagent':
        //置业顾问跟踪办理(邀约)
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "trackConfirmInv": {"value": true},
            "poorConfirmInv": {"value": false}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'Activity_0vv7s63':
        //置业顾问跟踪办理(认筹/下定)
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "poorConfirmDep": {"value": false},
            "trackConfirmDep": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'Activity_1atwvxw':
        //管理员审核
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "passedDep": {"value": true},
            "recognition": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'Activity_0fcrae3':
        //转定
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "passedDep": {"value": true},
            "recognition": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'Activity_1p4qp4l':
        //转定审核
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "passedTransfer": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'Activity_10po9sk':
        //签订合同
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "passedTransfer": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'Activity_0ar3k0c':
        //合同审核
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "skipLoan": {"value": true},
            "passedContract": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'Activity_1olkns4':
        //银行放款
        formdata = {"msg": "dddddddd"};
        return formdata;

      case 'Activity_0sjwc2q':
        //银行房款审核
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "passedLoan": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;

      case 'Activity_07a78ln':
        //财务结佣
        formdata = {
          "variables": {
            "repetition": {"value": true},
            "settlement": {"value": true}
          },
          "withVariablesInReturn": true
        };
        return formdata;
    }
    return formdata;
  }

  @override
  Future<ApiResult> dealWithProcess(String id, String taskDefinitionKey) async {
    //置业顾问办理邀约
    // print(id);
    // print(taskDefinitionKey);
    Map<String, dynamic> formdata = getFormdata(taskDefinitionKey);
    try {
      final response = await retroRestService.dealWithProcess(id, formdata);
      // print(response);
      if (response != null) {
        return ApiResult.success(data: response);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  @override
  Future<ApiResult> nextRemind(String processInstanceId) async {
    Map<String, dynamic> formdata = {"processInstanceId": processInstanceId};
    try {
      final response = await retroRestService.nextRemind(formdata);
      // print(response);
      if (response != null) {
        return ApiResult.success(data: response);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /*
   *把置业顾问（邀约和下定都放一起算了） 
   */
  @override
  Future<ApiResult> handleByConsultant(ConsultantBean consultantBean) async {
    if (consultantBean.customerLevel == "无用客户") {
      if (consultantBean.taskDefinitionKey == "CategoryManagent") {
        Map<String, dynamic> formdata = {
          "variables": {
            "repetition": {"value": true},
            "poorConfirmInv": {"value": true},
          },
          "withVariablesInReturn": true
        };
        final response =
            await retroRestService.dealWithProcess(consultantBean.id, formdata);
        print(response);
      } else if (consultantBean.taskDefinitionKey == "Activity_0vv7s63") {
        Map<String, dynamic> formdata = {
          "variables": {
            "repetition": {"value": true},
            "poorConfirmDep": {"value": true},
          },
          "withVariablesInReturn": true
        };
        final response =
            await retroRestService.dealWithProcess(consultantBean.id, formdata);
        print(response);
      }
    } else if (consultantBean.nextRemindTime != "") {
      String nextRemindTime = "PT" + consultantBean.nextRemindTime + "M";
      if (consultantBean.taskDefinitionKey == "CategoryManagent") {
        Map<String, dynamic> formdata = {
          "variables": {
            "repetition": {"value": true},
            "trackConfirmInv": {"value": false},
            "poorConfirmInv": {"value": false},
            "reminderTimeInv": {"value": nextRemindTime}
          },
          "withVariablesInReturn": true
        };
        final response =
            await retroRestService.dealWithProcess(consultantBean.id, formdata);
        print(response);
      } else if (consultantBean.taskDefinitionKey == "Activity_0vv7s63") {
        Map<String, dynamic> formdata = {
          "variables": {
            "repetition": {"value": true},
            "poorConfirmDep": {"value": false},
            "trackConfirmDep": {"value": false},
            "reminderTimeDep": {"value": nextRemindTime}
          },
          "withVariablesInReturn": true
        };
        final response =
            await retroRestService.dealWithProcess(consultantBean.id, formdata);
        print(response);
      }
    }
    //冻结还没做
    return ApiResult.success(data: ["ddd"]);
    // try {
    //   final response =
    //       await retroRestService.dealWithProcess(consultantBean.id, formdata);
    //   // print(response);
    //   if (response != null) {
    //     return ApiResult.success(data: response);
    //   }
    //   return ApiResult.failure(
    //       error: NetworkExceptions.getDioException('failed'));
    // } catch (e) {
    //   return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    // }
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
  Future<ApiResult> shareCode() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String userInfo = sharedPreferences.get('CACHED_SIGN_IN_USER');
    String houseShortCode = sharedPreferences.get('HOUSESHORTCODE');
    // print(houseShortCode);
    if (houseShortCode == null) {
      String affiliateds = sharedPreferences.get('AFFILIATEDS');
      if (affiliateds != null) {
        houseShortCode = jsonDecode(affiliateds)[0]["affiliationCode"];
      }
    }
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
      createFileFromString(response['data']).then((value) {
        // print(value);
        AppUtil.saveImage(value, isAsset: true);
        if (imagePaths.isEmpty) {
          imagePaths.add(value);
        }
        if (imagePaths.isNotEmpty) {
          Share.shareFiles(imagePaths);
        } else {
          print('imagePaths并没有数据啊！！！');
        }
      });
      if (response['ok'] == true) {
        return ApiResult.success(data: ["ddd"]);
        // return ApiResult.success(data: response);
      }
      return ApiResult.failure(
          error: NetworkExceptions.getDioException('login failed'));
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
