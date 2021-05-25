class HostList {
  final String value;

  factory HostList(String input) {

  }

  const HostList._(this.value) : assert(value != null);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is HostList && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'HostList(value: $value)';
}
