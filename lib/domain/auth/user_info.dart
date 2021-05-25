import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

@freezed
abstract class UserInfo implements _$UserInfo {
  const UserInfo._();

  const factory UserInfo({
    String id,
    String name,
    String photoUrl,
    @required String phoneNumber,
  }) = _UserInfo;
}
