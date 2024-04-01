import 'dart:io';
import 'package:dio/dio.dart';

import '../constants/constans.dart';
import '../core/controller/service_response_controller.dart';
import '../core/enum/post_service_enum.dart';
import '../core/interface/ipost_service.dart';
import '../pages/comment/comment_model.dart';
import '../pages/post/post_model.dart';

class PostService implements IPostService {
  final Dio _dio;
  final ServiceController _controller;
  PostService()
      : _dio = Dio(BaseOptions(baseUrl: AppConstants.baseUrl)),
        _controller = ServiceController();

  @override
  Future<List<PostModel>?> fetchPostItem() async {
    try {
      final response = await _dio.get(PostServicePaths.posts.name);
      return _controller.responseController(response, PostModel());
    } catch (e) {}
    return null;
  }

  @override
  Future<List<CommentModel>?> fetchCommentsWithPostId(int id) async {
    try {
      final response = await _dio.get(
          "${PostServicePaths.posts.name}/$id/${PostServicePaths.comments.name}");
      return _controller.responseController(response, CommentModel());
    } catch (e) {}
    return null;
  }

  @override
  Future<bool> deletePostItem(int id) async {
    try {
      final response = await _dio.delete("${PostServicePaths.posts.name}/$id");
      if (response.statusCode == HttpStatus.ok) {
        return true;
      }
    } catch (e) {}
    return false;
  }
}
