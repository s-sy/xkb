import 'package:flutter_ui/domain/auth/user_info.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info_dtos.freezed.dart';
part 'user_info_dtos.g.dart';

@freezed
abstract class UserInfoDto implements _$UserInfoDto {
  const UserInfoDto._();

  const factory UserInfoDto({
    // @JsonKey(ignore: true) String id,
    String id,
    String realName,
    String headimgUrl,
    @required String phone,
  }) = _UserInfoDto;

  UserInfo toDomain() {
    return UserInfo(
      id: id,
      name: realName,
      photoUrl: headimgUrl,
      phoneNumber: phone,
    );
  }

  factory UserInfoDto.fromJson(Map<String, dynamic> json) =>
      _$UserInfoDtoFromJson(json);
}
