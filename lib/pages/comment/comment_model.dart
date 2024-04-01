import '../../core/interface/ibase_model.dart';

class CommentModel implements IBaseModel<CommentModel> {
  int? commentId;
  int? postId;
  String? name;
  String? email;
  String? commentBody;

  CommentModel(
      {this.commentId, this.postId, this.name, this.email, this.commentBody});

  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['id'];
    postId = json['postId'];
    name = json['name'];
    email = json['email'];
    commentBody = json['body'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postId'] = commentId;
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['body'] = body;
    return data;
  }

  @override
  CommentModel fromJson(Map<String, dynamic> json) =>
      CommentModel.fromJson(json);

  int get commentPostId => postId ?? 1;
  @override
  int get id => commentId ?? 1;
  @override
  String get title => email ?? "";
  @override
  String get body => commentBody ?? "";
}
