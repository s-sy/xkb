// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Success<T> _$_$SuccessFromJson<T>(Map<String, dynamic> json) {
  return _$Success<T>(
    data: _dataFromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$SuccessToJson<T>(_$Success<T> instance) =>
    <String, dynamic>{
      'data': _dataToJson(instance.data),
    };

_$Failure<T> _$_$FailureFromJson<T>(Map<String, dynamic> json) {
  return _$Failure<T>(
    error: json['error'] == null
        ? null
        : NetworkExceptions.fromJson(json['error'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$FailureToJson<T>(_$Failure<T> instance) =>
    <String, dynamic>{
      'error': instance.error,
    };
