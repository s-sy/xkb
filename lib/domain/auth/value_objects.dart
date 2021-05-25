import 'package:dartz/dartz.dart';
import 'package:flutter_ui/domain/core/failures.dart';
import 'package:flutter_ui/domain/core/value_objects.dart';
import 'package:flutter_ui/domain/core/value_validators.dart';

class PhoneNumber extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory PhoneNumber(String input) {
    assert(input != null);
    return PhoneNumber._(
      validatePhoneNumber(input),
    );
  }

  const PhoneNumber._(this.value);
}

class VerificationCode extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory VerificationCode(String input) {
    assert(input != null);
    return VerificationCode._(
      validateVerificationCode(input),
    );
  }

  const VerificationCode._(this.value);
}
