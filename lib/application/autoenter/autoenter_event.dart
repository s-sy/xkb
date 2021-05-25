part of 'autoenter_bloc.dart';

@freezed
abstract class AutoenterEvent with _$AutoenterEvent {
  const factory AutoenterEvent.getcoumerstype() = Getcoumerstype;
  const factory AutoenterEvent.getType() = GetType;
  const factory AutoenterEvent.relogin() = Relogin;
}
