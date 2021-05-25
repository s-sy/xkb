part of 'wechat_mine_bloc.dart';

@freezed
abstract class WechatMineState with _$WechatMineState {
  const factory WechatMineState({
    List comment,
    List picture,
    List questions,
    List reply,
    Map userInfo,
    List customerList,
    bool isLogin,
  }) = _WechatMineState;
  factory WechatMineState.initial() => WechatMineState(
        comment: [],
        picture: [],
        questions: [],
        reply: [],
        userInfo: {},
        customerList: [],
        isLogin: false,
      );
}
