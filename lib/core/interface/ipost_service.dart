import '../../pages/comment/comment_model.dart';
import '../../pages/post/post_model.dart';

abstract class IPostService {
  Future<List<PostModel>?> fetchPostItem();
  Future<List<CommentModel>?> fetchCommentsWithPostId(int id);
  Future<bool> deletePostItem(int id);
}
