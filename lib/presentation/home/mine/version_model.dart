class VersionModel {
  String version;
  bool mandatory;
  List<String> updateContent;
  String iosAddress;
  String androidAddress;
  VersionModel.fromJson(Map<String, dynamic> json) {
    version = json['version'];
    mandatory = json['mandatory'];
    updateContent = List.from(json['updateContent']);
    iosAddress = json['iosAddress'];
    androidAddress = json['androidAddress'];
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'version': version,
      'mandatory': mandatory,
      'updateContent': updateContent,
      'iosAddress': iosAddress,
      'androidAddress': androidAddress,
    };
  }
}
