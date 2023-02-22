import 'package:flutter/material.dart';
import 'package:todo/theme/app_colors.dart';
import 'package:todo/widgets/app_bar_custom.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBarCustom(),
      body: Container(),
    );
  }
}
