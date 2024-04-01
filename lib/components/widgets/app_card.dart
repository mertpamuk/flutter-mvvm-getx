import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_box_decorations.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_padding.dart';
import '../../constants/app_text_styles.dart';
import '../../core/enum/post_service_enum.dart';
import '../../core/interface/ibase_model.dart';
import '../../pages/comment/comment_view.dart';
import '../../pages/post/post_model.dart';
import '../../service/post_service.dart';
import 'app_alert_dialog.dart';

class AppCard extends StatelessWidget {
  final IBaseModel model;

  const AppCard({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: AppPadding.paddingDefault,
        child: Card(
          elevation: 4,
          color: AppColors.appCardBackgroundColor,
          child: ListTile(
            minVerticalPadding: 0,
            contentPadding: AppPadding.appCardTitlePadding,
            onTap: model is PostModel
                ? () => Get.to(const CommentView(), arguments: model.id)
                : null,
            leading: Text(
              model.id.toString(),
              style: AppTextStyles.blackTextTitle,
            ),
            title: Container(
              decoration: AppBoxDecorations.appCardTitleDecoration,
              child: Padding(
                padding: AppPadding.paddingDefault,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        model.title,
                        style: AppTextStyles.whiteTextTitle,
                      ),
                    ),
                    model is PostModel
                        ? IconButton(
                            onPressed: () => deleteItem(),
                            icon: const Icon(Icons.close),
                            color: AppColors.primaryIconColor,
                          )
                        : const SizedBox()
                  ],
                ),
              ),
            ),
            subtitle: Padding(
              padding: AppPadding.paddingDefault,
              child: Text(
                model.body,
                style: AppTextStyles.blackTextBody,
              ),
            ),
          ),
        ),
      );

  void deleteItem() {
    PostService().deletePostItem(model.id).then((value) {
      value
          ? Get.dialog(AppDeleteAlertDialog(
              path: model is PostModel
                  ? PostServicePaths.posts
                  : PostServicePaths.comments))
          : null;
    });
  }
}
