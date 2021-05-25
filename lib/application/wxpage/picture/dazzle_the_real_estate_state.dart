part of 'dazzle_the_real_estate_bloc.dart';

@freezed
abstract class DazzleTheRealEstateState with _$DazzleTheRealEstateState {
  const factory DazzleTheRealEstateState({
    int current,
    int size,
    List pictureList,
    List imgData,
  }) = _DazzleTheRealEstateState;
  factory DazzleTheRealEstateState.initial() => DazzleTheRealEstateState(
        current: 1,
        size: 5,
        pictureList: [],
        imgData: [],
      );
}
