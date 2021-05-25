part of 'autoenter_bloc.dart';

@freezed
abstract class AutoenterState with _$AutoenterState {
  const factory AutoenterState.initial() = Initial;
  const factory AutoenterState.brokerenter() = Brokerenter;
  const factory AutoenterState.estateenter() = Estateenter;
  const factory AutoenterState.est() = Est;
}
