import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/widgets/app_appbar.dart';
import '../../components/widgets/app_item_builder.dart';
import '../../constants/constans.dart';
import 'comment_view_model.dart';

class CommentView extends StatelessWidget {
  const CommentView({super.key});

  @override
  Widget build(BuildContext context) {
    final commentViewModel = Get.put(CommentViewModel(Get.arguments));
    return Scaffold(
        appBar: setAppBar(AppConstants.commentsTitle),
        body: AppItemBuilder(viewModel: commentViewModel));
  }
}
