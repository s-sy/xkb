// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'api_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
ApiResult<T> _$ApiResultFromJson<T>(Map<String, dynamic> json) {
  switch (json['runtimeType'] as String) {
    case 'success':
      return Success<T>.fromJson(json);
    case 'failure':
      return Failure<T>.fromJson(json);

    default:
      throw FallThroughError();
  }
}

/// @nodoc
class _$ApiResultTearOff {
  const _$ApiResultTearOff();

// ignore: unused_element
  Success<T> success<T>(
      {@required
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
          T data}) {
    return Success<T>(
      data: data,
    );
  }

// ignore: unused_element
  Failure<T> failure<T>({@required NetworkExceptions error}) {
    return Failure<T>(
      error: error,
    );
  }

// ignore: unused_element
  ApiResult<T> fromJson<T>(Map<String, Object> json) {
    return ApiResult<T>.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $ApiResult = _$ApiResultTearOff();

/// @nodoc
mixin _$ApiResult<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result success(
            @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data),
    @required Result failure(NetworkExceptions error),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(
        @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data),
    Result failure(NetworkExceptions error),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result failure(Failure<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result failure(Failure<T> value),
    @required Result orElse(),
  });
  Map<String, dynamic> toJson();
}

/// @nodoc
abstract class $ApiResultCopyWith<T, $Res> {
  factory $ApiResultCopyWith(
          ApiResult<T> value, $Res Function(ApiResult<T>) then) =
      _$ApiResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ApiResultCopyWithImpl<T, $Res> implements $ApiResultCopyWith<T, $Res> {
  _$ApiResultCopyWithImpl(this._value, this._then);

  final ApiResult<T> _value;
  // ignore: unused_field
  final $Res Function(ApiResult<T>) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) then) =
      _$SuccessCopyWithImpl<T, $Res>;
  $Res call({@JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, $Res> extends _$ApiResultCopyWithImpl<T, $Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(Success<T> _value, $Res Function(Success<T>) _then)
      : super(_value, (v) => _then(v as Success<T>));

  @override
  Success<T> get _value => super._value as Success<T>;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(Success<T>(
      data: data == freezed ? _value.data : data as T,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$Success<T> with DiagnosticableTreeMixin implements Success<T> {
  const _$Success(
      {@required
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
          this.data})
      : assert(data != null);

  factory _$Success.fromJson(Map<String, dynamic> json) =>
      _$_$SuccessFromJson(json);

  @override
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  final T data;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResult<$T>.success(data: $data)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResult<$T>.success'))
      ..add(DiagnosticsProperty('data', data));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result success(
            @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data),
    @required Result failure(NetworkExceptions error),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(data);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(
        @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data),
    Result failure(NetworkExceptions error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result failure(Failure<T> value),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result failure(Failure<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$SuccessToJson(this)..['runtimeType'] = 'success';
  }
}

abstract class Success<T> implements ApiResult<T> {
  const factory Success(
      {@required
      @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
          T data}) = _$Success<T>;

  factory Success.fromJson(Map<String, dynamic> json) = _$Success<T>.fromJson;

  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  T get data;
  $SuccessCopyWith<T, Success<T>> get copyWith;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res>;
  $Res call({NetworkExceptions error});

  $NetworkExceptionsCopyWith<$Res> get error;
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res> extends _$ApiResultCopyWithImpl<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(Failure<T> _value, $Res Function(Failure<T>) _then)
      : super(_value, (v) => _then(v as Failure<T>));

  @override
  Failure<T> get _value => super._value as Failure<T>;

  @override
  $Res call({
    Object error = freezed,
  }) {
    return _then(Failure<T>(
      error: error == freezed ? _value.error : error as NetworkExceptions,
    ));
  }

  @override
  $NetworkExceptionsCopyWith<$Res> get error {
    if (_value.error == null) {
      return null;
    }
    return $NetworkExceptionsCopyWith<$Res>(_value.error, (value) {
      return _then(_value.copyWith(error: value));
    });
  }
}

@JsonSerializable()

/// @nodoc
class _$Failure<T> with DiagnosticableTreeMixin implements Failure<T> {
  const _$Failure({@required this.error}) : assert(error != null);

  factory _$Failure.fromJson(Map<String, dynamic> json) =>
      _$_$FailureFromJson(json);

  @override
  final NetworkExceptions error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiResult<$T>.failure(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiResult<$T>.failure'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Failure<T> &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @override
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required
        Result success(
            @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data),
    @required Result failure(NetworkExceptions error),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(error);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result success(
        @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson) T data),
    Result failure(NetworkExceptions error),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result success(Success<T> value),
    @required Result failure(Failure<T> value),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result success(Success<T> value),
    Result failure(Failure<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$_$FailureToJson(this)..['runtimeType'] = 'failure';
  }
}

abstract class Failure<T> implements ApiResult<T> {
  const factory Failure({@required NetworkExceptions error}) = _$Failure<T>;

  factory Failure.fromJson(Map<String, dynamic> json) = _$Failure<T>.fromJson;

  NetworkExceptions get error;
  $FailureCopyWith<T, Failure<T>> get copyWith;
}
