import 'package:flutter/material.dart';
import 'package:todo/theme/app_dimens.dart';
import 'package:todo/widgets/complete_icon_button.dart';

class SortItem extends StatelessWidget {
  final Function? onPressed;
  final bool isSelected;
  final String title;
  final Widget? icon;

  const SortItem({
    Key? key,
    this.onPressed,
    this.isSelected = false,
    this.title = '',
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: Row(
        children: [
          SizedBox(width: AppDimens.defaultPadding),
          CompleteIconButton(
            completed: isSelected,
          ),
          SizedBox(width: AppDimens.defaultPadding),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          if (icon != null) ...[
            icon!,
            SizedBox(width: AppDimens.defaultPadding),
          ],
        ],
      ),
    );
  }
}
