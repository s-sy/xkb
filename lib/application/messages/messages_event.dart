part of 'messages_bloc.dart';

@freezed
abstract class MessagesEvent with _$MessagesEvent {
  const factory MessagesEvent.started() = _Started;
  const factory MessagesEvent.dosth() = _Dosth;
  const factory MessagesEvent.getHistory() = _GetHistory;
  const factory MessagesEvent.unFreezedCustomer(String processedId) =
      _UnFreezedCustomer;
  const factory MessagesEvent.getDelay() = _GetDelay;
  const factory MessagesEvent.getProcessDefinition() = _GetProcessDefinition;
  const factory MessagesEvent.getNewCoustomer() = _GetNewCoustomer;
  const factory MessagesEvent.getNewCoustomerNames() = _GetNewCoustomerNames;
}
