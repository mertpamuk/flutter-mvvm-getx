import 'package:fluttermvvmgetx/pages/comment/comment_model.dart';
import 'package:get/get.dart';

import '../../core/interface/igetxcontroller.dart';
import '../../service/post_service.dart';

class CommentViewModel extends GetxController implements IGetxController {
  final RxBool _isLoading = false.obs;
  late PostService _service;
  int id;
  RxList<CommentModel> commentItems = <CommentModel>[].obs;
  CommentViewModel(this.id);

  @override
  void onInit() {
    super.onInit();
    _service = PostService();
    fetchItems();
  }

  @override
  Future<void> fetchItems() async {
    changeLoading();
    var comments = await _service.fetchCommentsWithPostId(id);
    if (comments != null) commentItems.value = comments;
    changeLoading();
  }

  void changeLoading() => isLoading(!isLoading.value);

  @override
  RxList get items => commentItems;

  @override
  RxBool get isLoading => _isLoading;
}
