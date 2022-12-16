import 'package:flutter/material.dart';
import 'package:pactus_app/theme/app_colors.dart';
class BorderWidget extends StatelessWidget {
final Widget widget;
final Widget title;

  const BorderWidget({super.key, required this.widget, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      child: Column(
        children: [
          widget,
          Container(child: title,
          decoration: BoxDecoration(
            color: Colors.grey.shade900,
            border: Border(top: BorderSide(
              width: 1.5, color: AppColors.main_color

            ))
          ),)
        ],
      ),
decoration: BoxDecoration(
  color: Colors.transparent,
  border:Border.all(width: 1,color:AppColors.main_color )
),

    );
  }


}