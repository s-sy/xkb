// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'retro_rest_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RetroRestService implements RetroRestService {
  _RetroRestService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://ad.kehuoa.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<dynamic> getContacts(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/chatting/contacts',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getUnreadMessages(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/chatting/unread',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> historyMessage(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/chatting/page',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> uploadImgOrAudio(formdataUpload) async {
    ArgumentError.checkNotNull(formdataUpload, 'formdataUpload');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = formdataUpload;
    final _result = await _dio.request('/broker/mapi/br/file/upload',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> sendChatMessage(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(formdata ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('/broker/mapi/br/chatting/add',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getId(contactId) async {
    ArgumentError.checkNotNull(contactId, 'contactId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/mapi/br/chatting/received/$contactId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> viewProsess(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/engine-rest/task/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> viewProsessInfo(executionId) async {
    ArgumentError.checkNotNull(executionId, 'executionId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/engine-rest/process-instance/$executionId/variables',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> dealWithProcess(id, formdata) async {
    ArgumentError.checkNotNull(id, 'id');
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(formdata ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('/broker/engine-rest/task/$id/complete',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> nextRemind(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/engine-rest/job',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> shareCode(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/userinfo/qrcode',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getAgentName(agentId) async {
    ArgumentError.checkNotNull(agentId, 'agentId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/mapi/br/userinfo/salesman/$agentId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> setJPushRid(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(formdata ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('/broker/mapi/br/userinfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> managerRemindList(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/remind/page',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> managerRemindDetails(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/referrals/remind',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> unreadMessageCount(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/remind/unread',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> batchUpdate(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/remind',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> submitInfo(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(formdata ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('/broker/mapi/br/userinfo',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getHouseIng(queries) async {
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/housing/staging',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getHouseListData(queries) async {
    ArgumentError.checkNotNull(queries, 'queries');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(queries ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/housing/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> referrals(activeData) async {
    ArgumentError.checkNotNull(activeData, 'activeData');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(activeData ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/referrals/page',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getProcessDefinition(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/engine-rest/process-definition',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> controlPrecess(processId, data) async {
    ArgumentError.checkNotNull(processId, 'processId');
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request(
        '/broker/engine-rest/process-definition/$processId/submit-form',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getTask(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/engine-rest/task',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getProcessedData(processInstanceId) async {
    ArgumentError.checkNotNull(processInstanceId, 'processInstanceId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/engine-rest/process-instance/$processInstanceId/variables',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> processFlow(processId, query) async {
    ArgumentError.checkNotNull(processId, 'processId');
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request(
        '/broker/engine-rest/task/$processId/complete',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getSalesmanList(affId) async {
    ArgumentError.checkNotNull(affId, 'affId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/mapi/br/userinfo/salesman/$affId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getCoustomList(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/referrals/page',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getNextTimeData(processInstanceId) async {
    ArgumentError.checkNotNull(processInstanceId, 'processInstanceId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'processInstanceId': processInstanceId
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/engine-rest/job',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> qiNiuLoad(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = query;
    final _result = await _dio.request('/broker/mapi/br/file/upload',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> frezzeprcessed(procedId, query) async {
    ArgumentError.checkNotNull(procedId, 'procedId');
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request(
        '/broker/engine-rest/process-instance/$procedId/variables/suspendTask',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> unFrezzeprcessed(procedId, query) async {
    ArgumentError.checkNotNull(procedId, 'procedId');
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request(
        '/broker/engine-rest/process-instance/$procedId/suspended',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> executionWithoutdelay(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(query ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('/broker/engine-rest/message',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getHistory(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/engine-rest/history/task',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getHistoryVariable(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/engine-rest/history/variable-instance',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getMultipleCustomer(phone, query) async {
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/referrals/mc/$phone',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getPersonnelList(affId) async {
    ArgumentError.checkNotNull(affId, 'affId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/mapi/br/userinfo/personnel/$affId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> updateRemarks(data) async {
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('/broker/mapi/br/referrals',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getDefinitionlist(definQuery) async {
    ArgumentError.checkNotNull(definQuery, 'definQuery');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(definQuery ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/mapi/br/variabledefinition/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getprocessCount(query) async {
    ArgumentError.checkNotNull(query, 'query');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(query ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/engine-rest/history/task',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> updataHousing(data) async {
    ArgumentError.checkNotNull(data, 'data');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(data ?? <String, dynamic>{});
    _data.removeWhere((k, v) => v == null);
    final _result = await _dio.request('/broker/mapi/br/housing',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'PUT',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getCoustomerName(getNameQuery) async {
    ArgumentError.checkNotNull(getNameQuery, 'getNameQuery');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(getNameQuery ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/engine-rest/variable-instance',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> changeHouse(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/housing/switchover',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> slideshow(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/slideshow/list',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getRoles(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/userinfo/roles',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getAffiliated(formdata) async {
    ArgumentError.checkNotNull(formdata, 'formdata');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    queryParameters.addAll(formdata ?? <String, dynamic>{});
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/userinfo/affiliated',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> testVersion() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/broker/mapi/br/versioning/newest',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getPie(affId, tenantId) async {
    ArgumentError.checkNotNull(affId, 'affId');
    ArgumentError.checkNotNull(tenantId, 'tenantId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'tenantId': tenantId};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/mapi/br/referrals/analysis/$affId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getDuration(affId, tenantId, duration, portion) async {
    ArgumentError.checkNotNull(affId, 'affId');
    ArgumentError.checkNotNull(tenantId, 'tenantId');
    ArgumentError.checkNotNull(duration, 'duration');
    ArgumentError.checkNotNull(portion, 'portion');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'tenantId': tenantId,
      r'duration': duration,
      r'portion': portion
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/mapi/br/referrals/duration/$affId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getFastreport(mineId, mineDuration, minePortion, tenantId,
      affiliationId, leaderweek) async {
    ArgumentError.checkNotNull(mineId, 'mineId');
    ArgumentError.checkNotNull(mineDuration, 'mineDuration');
    ArgumentError.checkNotNull(minePortion, 'minePortion');
    ArgumentError.checkNotNull(tenantId, 'tenantId');
    ArgumentError.checkNotNull(affiliationId, 'affiliationId');
    ArgumentError.checkNotNull(leaderweek, 'leaderweek');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'duration': mineDuration,
      r'portion': minePortion,
      r'tenantId': tenantId,
      r'affiliationId': affiliationId,
      r'leaderweek': leaderweek
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/broker/mapi/br/referrals/fastreport/$mineId',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }
}
