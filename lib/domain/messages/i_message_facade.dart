import 'package:dio/dio.dart';

abstract class IMessagesFacade {
  Future getTask(Map<String, dynamic> query);

  Future getProcessedData(String processInstanceId);

  Future processFlow(int groupValue, String processInstanceId);

  Future processSalesman(String processedItem, dynamic query);

  Future getSalesmanList(String affId);

  Future getNextTimeData(String processInstanceId);

  Future qiNiuLoad(FormData query);

  Future frezzeprcessed(String processId, Map<String, dynamic> query);

  Future unFrezzeprcessed(String processId, Map<String, dynamic> query);

  Future getDelay(Map<String, dynamic> query);

  Future getDefinitionlist(Map<String, dynamic> definQuery);

  Future getprocessCount(Map<String, dynamic> unfinainshQuery);

  Future getCoustomerName(Map<String, String> getNameQuery);

  Future getHouseList(Map<String, dynamic> query);

  Future getHouseListData(Map<String, dynamic> queryList);
}
