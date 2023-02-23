import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/assets/images/images.dart';

class CompleteIconButton extends StatelessWidget {
  final Function? onPressed;
  final bool completed;

  const CompleteIconButton({
    Key? key,
    this.completed = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      child: SvgPicture.asset(
          completed ? Images.icCheckedCircle : Images.icCircleOutline),
    );
  }
}
