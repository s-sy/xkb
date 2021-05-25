part of 'real_estate_bloc.dart';

@freezed
abstract class RealEstateState with _$RealEstateState {
  const factory RealEstateState({
    int current,
    int size,
    List questionsPageAll,
    bool isComment,
  }) = _RealEstateState;
  factory RealEstateState.initial() => RealEstateState(
        current: 1,
        size: 5,
        questionsPageAll: [],
        isComment: false,
      );
}
