import 'package:flutter/material.dart';
import 'package:sanskriti/utils/app_colors.dart';

class CulturePage extends StatelessWidget {
  final String appbarTitle;
  const CulturePage({super.key, required this.appbarTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text(appbarTitle),
        backgroundColor: AppColors.lightsky,
      ),
      body: Center(
        child: Text(appbarTitle),
      ),
    );
  }
}
