part of 'process_bloc.dart';

@freezed
abstract class ProcessEvent with _$ProcessEvent {
  const factory ProcessEvent.handleProcess() = _HandleProcess;
  const factory ProcessEvent.dealWithProcess(
      String id, String taskDefinitionKey) = _DealWithProcess;
  const factory ProcessEvent.nextRemind(String processInstanceId) = _NextRemind;
  const factory ProcessEvent.handleByConsultant(ConsultantBean consultantBean) =
      _HandleByConsultant;
  const factory ProcessEvent.shareCode() = _ShareCode;
}
