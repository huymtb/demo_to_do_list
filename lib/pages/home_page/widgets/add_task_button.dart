import 'package:flutter/material.dart';
import 'package:todo/generated/l10n.dart';
import 'package:todo/router/router.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/utils/ui_utils.dart';

class AddTaskButton extends StatelessWidget {
  final Function? onPressed;

  const AddTaskButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          push(path: RoutePath.taskDetail);
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: AppDimens.defaultPadding,
              vertical: AppDimens.d_16),
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(AppDimens.d_14)),
          height: AppDimens.d_45,
          width: getScreenWidth(context),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.add,
                color: AppColors.white,
              ),
              SizedBox(
                width: AppDimens.smallPadding,
              ),
              Text(
                S.of(context).addNewTask,
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ));
  }
}
