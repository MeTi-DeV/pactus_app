import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:pactus_app/theme/app_colors.dart';
class LoaderWidget extends StatelessWidget {
  const LoaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: LoadingAnimationWidget.threeArchedCircle(color: AppColors.main_color, size: 64)
      );
  }
}