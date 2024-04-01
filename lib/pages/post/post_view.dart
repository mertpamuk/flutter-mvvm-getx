import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/widgets/app_appbar.dart';
import '../../components/widgets/app_item_builder.dart';
import '../../constants/constans.dart';
import 'post_view_model.dart';

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    final postViewModel = Get.put(PostViewModel());
    return Scaffold(
      appBar: setAppBar(AppConstants.postsTitle),
      body: AppItemBuilder(viewModel: postViewModel),
    );
  }
}
