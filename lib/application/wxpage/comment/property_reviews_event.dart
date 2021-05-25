part of 'property_reviews_bloc.dart';

@freezed
abstract class PropertyReviewsEvent with _$PropertyReviewsEvent {
  const factory PropertyReviewsEvent.started(Map<String, dynamic> affData) =
      _Started;
  const factory PropertyReviewsEvent.addcurrent() = _Addcurrent;
  const factory PropertyReviewsEvent.releasepreviews(
      String arrived,
      String ratePrice,
      String ratePlace,
      String rateTraffic,
      String rateMatching,
      String rateEnvironment,
      String remark,
      String check,
      String id) = _Releasepreviews;
  const factory PropertyReviewsEvent.commentpreviews(String replyValue,
      String affid, String id, int type, String createid) = _Commentpreviews;
  const factory PropertyReviewsEvent.replace() = _Replace;
  const factory PropertyReviewsEvent.commentOne(Map<String, dynamic> maps) =
      _CommentOne;
}
