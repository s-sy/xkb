// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserInfoDto _$_$_UserInfoDtoFromJson(Map<String, dynamic> json) {
  return _$_UserInfoDto(
    id: json['id'] as String,
    realName: json['realName'] as String,
    headimgUrl: json['headimgUrl'] as String,
    phone: json['phone'] as String,
  );
}

Map<String, dynamic> _$_$_UserInfoDtoToJson(_$_UserInfoDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'realName': instance.realName,
      'headimgUrl': instance.headimgUrl,
      'phone': instance.phone,
    };
