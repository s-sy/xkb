import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_scoket_failure.freezed.dart';

@freezed
abstract class WebScoketFailure with _$WebScoketFailure {
  const factory WebScoketFailure.serverError() = ServerError;
  const factory WebScoketFailure.connectFail() = ConnectFail;
  const factory WebScoketFailure.receiveMessageFail() = ReceiveMessageFail;
  const factory WebScoketFailure.quitChatFail() = QuitChatFail;
}
