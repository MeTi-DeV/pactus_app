import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:pactus_app/theme/app_colors.dart';
import 'package:pactus_app/theme/dimentions.dart';
class SeedInputWidget extends StatelessWidget {
  const SeedInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Give your wallet a password',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            SizedBox(
              height: 75,
            ),
            Text(
              'This password cannot be recovered. if you forget ith then wallet will have to be restored from your 25 word mnemonic seed.',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 16, fontWeight: FontWeight.w100),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Iconify(
                      Bi.exclamation_circle,
                      size: 28,
                      color: AppColors.main_color,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                            text: 'Enter a strong password ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500),
                            children: const <TextSpan>[
                              TextSpan(
                                  text:
                                      '(Using letters, numbers, and/or symbols)',
                                  style: TextStyle(fontWeight: FontWeight.w100))
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  border: Border(
                      top:
                          BorderSide(width: 1.5, color: AppColors.main_color))),
            ),
            SizedBox(
              height: KSize.geHeight(context, 40),
            ),
            // ConstrainedBox(
            //   constraints: BoxConstraints(
            //       maxWidth: MediaQuery.of(context).size.width / 1.3),
            //   child:Form(child: Row(children: [
            //     TextFormField(
            //       
            //     )
            //   ],))
            // )
          ],
        );
  }
}