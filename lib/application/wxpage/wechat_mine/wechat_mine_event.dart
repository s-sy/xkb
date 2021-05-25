part of 'wechat_mine_bloc.dart';

@freezed
abstract class WechatMineEvent with _$WechatMineEvent {
  const factory WechatMineEvent.started() = _Started;

  const factory WechatMineEvent.getApartmentConcern() = _GetApartmentConcern;
  const factory WechatMineEvent.apartmentConcerncennel() =
      _ApartmentConcerncennel;
  const factory WechatMineEvent.getreadingReviews() = _GetreadingReviews;
  const factory WechatMineEvent.getTopicreply(String type) = _GetTopicreply;
  const factory WechatMineEvent.getQuestionsPage() = _GetQuestionsPage;
  const factory WechatMineEvent.getAwesomeshooting() = _GetAwesomeshooting;
  const factory WechatMineEvent.referrals() = _Referrals;
  const factory WechatMineEvent.getvistorInfo() = _GetvistorInfo;
  const factory WechatMineEvent.updatevistorInfo(
      String image, String nickName) = _UpdatevistorInfo;
  const factory WechatMineEvent.isLogin() = _IsLogin;
  const factory WechatMineEvent.loginOut() = _LoginOut;
}
