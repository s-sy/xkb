part of 'property_reviews_bloc.dart';

@freezed
abstract class PropertyReviewsState with _$PropertyReviewsState {
  const factory PropertyReviewsState({
    int current,
    int size,
    List propertyreviewsList,
    bool isComment,
    List commentOne,
  }) = _PropertyReviewsState;
  factory PropertyReviewsState.initial() => PropertyReviewsState(
        current: 1,
        size: 5,
        propertyreviewsList: [],
        isComment: false,
        commentOne: [],
      );
}
