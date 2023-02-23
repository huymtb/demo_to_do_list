import 'package:flutter/material.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/theme/app_dimens.dart';

class TextFieldCustom extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final int? maxLines;
  final Function(String)? onChanged;
  final bool completed;

  const TextFieldCustom({
    Key? key,
    required this.controller,
    this.hintText,
    this.maxLines,
    this.onChanged,
    this.completed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.d_14),
          border: Border.all(
            color: AppColors.primary,
          )),
      child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          textInputAction: TextInputAction.done,
          maxLines: maxLines,
          onChanged: onChanged,
          enabled: !completed,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                decoration: completed
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(AppDimens.d_14),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: AppColors.grayText))),
    );
  }
}
