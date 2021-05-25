// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_rest_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _AuthRestService implements AuthRestService {
  _AuthRestService(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    baseUrl ??= 'https://ad.kehuoa.com';
  }

  final Dio _dio;

  String baseUrl;

  @override
  Future<dynamic> getSMSVerification(phone) async {
    ArgumentError.checkNotNull(phone, 'phone');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (phone != null) {
      _data.fields.add(MapEntry('phone', phone));
    }
    final _result = await _dio.request('/broker/mapi/br/yuntongxun/mac',
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
  Future<dynamic> login(phone, captcha) async {
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(captcha, 'captcha');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (phone != null) {
      _data.fields.add(MapEntry('phone', phone));
    }
    if (captcha != null) {
      _data.fields.add(MapEntry('captcha', captcha));
    }
    final _result = await _dio.request('/broker/mapi/br/userinfo/login',
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
  Future<dynamic> getAffCode(affIds, contentType, sessionKey) async {
    ArgumentError.checkNotNull(affIds, 'affIds');
    ArgumentError.checkNotNull(contentType, 'contentType');
    ArgumentError.checkNotNull(sessionKey, 'sessionKey');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = affIds;
    final _result = await _dio.request('/broker/mapi/br/userinfo/affcode',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'POST',
            headers: <String, dynamic>{
              r'content-type': contentType,
              r'third-session': sessionKey
            },
            extra: _extra,
            contentType: contentType,
            baseUrl: baseUrl),
        data: _data);
    final value = _result.data;
    return value;
  }

  @override
  Future<dynamic> getaffListbytenantId(tenantId) async {
    ArgumentError.checkNotNull(tenantId, 'tenantId');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request(
        '/weixin/api/es/wxuser/tenant?tenantId=$tenantId',
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
  Future<dynamic> getplatforminfo() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.request('/estate/mapi/es/platforminfo/list',
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
  Future<dynamic> eslogin(phone, captcha) async {
    ArgumentError.checkNotNull(phone, 'phone');
    ArgumentError.checkNotNull(captcha, 'captcha');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = FormData();
    if (phone != null) {
      _data.fields.add(MapEntry('phone', phone));
    }
    if (captcha != null) {
      _data.fields.add(MapEntry('captcha', captcha));
    }
    final _result = await _dio.request('/estate/mapi/es/vistorinfo/login',
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
}
