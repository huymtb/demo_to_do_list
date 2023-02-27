import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:todo/assets/images/images.dart';

class SplashPageRobot {
  final WidgetTester tester;

  SplashPageRobot(this.tester);

  Future<void> executeTests() async {
    verifyLogo();
  }

  void verifyLogo() {
    expect(find.image(const AssetImage(Images.icApp)), findsOneWidget);
  }
}
