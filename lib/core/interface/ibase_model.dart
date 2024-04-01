abstract class IBaseModel<T> {
  String get title;
  String get body;
  int get id;
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
