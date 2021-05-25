part of 'buyinghouse_bloc.dart';

@freezed
abstract class BuyinghouseEvent with _$BuyinghouseEvent {
  const factory BuyinghouseEvent.started(Map<String, dynamic> affData) =
      _Started;
  const factory BuyinghouseEvent.checkphone(String phone) = _Checkphone;
  const factory BuyinghouseEvent.sendworkflow(
      String name, String phone, String remark, String sex) = _Sendworkflow;
  const factory BuyinghouseEvent.getTaills() = _GetTaills;
  const factory BuyinghouseEvent.repeatTip() = _RepeatTip;
}
