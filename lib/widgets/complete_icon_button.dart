import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo/assets/images/images.dart';

class CompleteIconButton extends StatelessWidget {
  final bool completed;

  const CompleteIconButton({
    Key? key,
    this.completed = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        completed ? Images.icCheckedCircle : Images.icCircleOutline);
  }
}
