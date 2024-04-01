import 'package:get/get.dart';

import '../../core/interface/igetxcontroller.dart';
import '../../service/post_service.dart';
import 'post_model.dart';

class PostViewModel extends GetxController implements IGetxController {
  final RxBool _isLoading = false.obs;
  late PostService _service;
  RxList<PostModel> postItems = <PostModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _service = PostService();
    fetchItems();
  }

  @override
  Future<void> fetchItems() async {
    changeLoading();
    var posts = await _service.fetchPostItem();
    if (posts != null) postItems.value = posts;
    changeLoading();
  }

  void changeLoading() => isLoading(!isLoading.value);
  @override
  RxBool get isLoading => _isLoading;
  @override
  RxList get items => postItems;
}
