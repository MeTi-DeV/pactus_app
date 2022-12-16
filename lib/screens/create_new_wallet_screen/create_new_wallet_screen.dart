import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/icon_park_outline.dart';
import 'package:iconify_flutter/icons/jam.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:pactus_app/screens/create_new_wallet_screen/create_new_wallet_logic.dart';
import 'package:pactus_app/theme/app_colors.dart';

import 'package:pactus_app/theme/dimentions.dart';
import 'package:pactus_app/widgets/border_widget.dart';
import 'package:pactus_app/widgets/default_background_color.dart';
import 'package:pactus_app/widgets/loader_widget.dart';

class CreateNewWalletScreen extends StatelessWidget {
CreateNewWalletLogic logic =Get.put(CreateNewWalletLogic());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return DefaultBackgroundScreen(
          child: logic.hasLoader!.value==true?
          LoaderWidget(): Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: KSize.geHeight(context,25),
            ),
            TextButton(onPressed: (){
              Get.back();
            }, child: Iconify(MaterialSymbols.arrow_back_ios_new_rounded,color: Colors.white,
            
            ),style: TextButton.styleFrom(
              shadowColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent
            )), 
            SizedBox(
              height: KSize.geHeight(context, 100),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 10,
                // vertical: MediaQuery.of(context).size.height / 10
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create a new wallet',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    'Mnemonic seed :',
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontSize: 15),
                  ),
                  SizedBox(height: 32,),
                  BorderWidget(
                      widget: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${logic.randomMnemonic}',
                          style: Theme.of(context).textTheme.headline5,
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
                                  .headline5!
                                  .copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w100),
                            ),
                          ],
                        ),
                      )),
                  SizedBox(
                    height: KSize.geHeight(context, 60),
                  ),
                ],
              ),
            ),
          ],
        ),
        //   child: Column(children: [
        // //  IconButton(onPressed: () {
        // //      Get.toNamed(Routes.MainScreen);
        // //     }, icon:Icon(Icons.arrow_back_ios_rounded,color: Colors.white,) ),
        //   ],),
      ));
    });
  }
}
