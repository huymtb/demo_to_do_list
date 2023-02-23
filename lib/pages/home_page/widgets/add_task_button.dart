import 'package:flutter/material.dart';
import 'package:todo/router/router.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';

class AddTaskButton extends StatelessWidget {
  final Function? onPressed;

  const AddTaskButton({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: GestureDetector(
          onTap: () {
            push(path: RoutePath.taskDetail);
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary,
            ),
            height: AppDimens.d_45,
            width: AppDimens.d_45,
            child: const Icon(
              Icons.add,
              color: AppColors.white,
            ),
          )),
    );
  }
}
