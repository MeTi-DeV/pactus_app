import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/jam.dart';
import 'package:pactus_app/theme/app_colors.dart';
import 'package:pactus_app/widgets/border_widget.dart';

class SeedGeneratorWidget extends StatelessWidget {
  final String? seedKey;

  const SeedGeneratorWidget({required this.seedKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create a new wallet',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        SizedBox(
          height: 75,
        ),
        Text(
          'Mnemonic seed :',
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 15),
        ),
        SizedBox(
          height: 32,
        ),
        BorderWidget(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              '${seedKey}',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Iconify(
                  Jam.triangle_danger,
                  size: 32,
                  color: AppColors.main_color,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'This seed is very important to write down and keep secret.It is all you need to backup and restore your wallet.',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(fontSize: 11, fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
