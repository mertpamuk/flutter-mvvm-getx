import '../../core/interface/ibase_model.dart';

class PostModel implements IBaseModel<PostModel> {
  int? userId;
  int? postId;
  String? postTitle;
  String? postBody;

  PostModel({this.userId, this.postId, this.postTitle, this.postBody});

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      postId: json['id'],
      postTitle: json['title'],
      postBody: json['body'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }

  @override
  PostModel fromJson(Map<String, dynamic> json) => PostModel.fromJson(json);
  @override
  int get id => postId ?? 1;
  @override
  String get title => postTitle ?? "";
  @override
  String get body => postBody ?? "";
}
