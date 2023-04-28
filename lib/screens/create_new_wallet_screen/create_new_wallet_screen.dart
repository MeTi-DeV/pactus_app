import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:pactus_app/router/route.dart';

import 'package:pactus_app/screens/create_new_wallet_screen/create_new_wallet_logic.dart';
import 'package:pactus_app/theme/app_colors.dart';

import 'package:pactus_app/widgets/loader_widget.dart';
import 'package:pactus_app/widgets/seed_generator_widget.dart';
import 'package:pactus_app/widgets/seed_input_widget.dart';
import 'package:pactus_app/widgets/wallet_password_widget.dart';
import 'package:scaffold_gradient_background/scaffold_gradient_background.dart';

class CreateNewWalletScreen extends StatelessWidget {
  CreateNewWalletLogic logic = Get.put(CreateNewWalletLogic());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ScaffoldGradientBackground(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: AppColors.gradient,
        ),
        body: logic.hasLoader!.value == true
            ? LoaderWidget()
            : Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(48),
                      child: TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Iconify(
                            MaterialSymbols.arrow_back_ios_new_rounded,
                            color: Colors.white,
                            size: 36,
                          ),
                          style: TextButton.styleFrom(
                              shadowColor: Colors.transparent,
                              backgroundColor: Colors.transparent,
                              foregroundColor: Colors.transparent,
                              surfaceTintColor: Colors.transparent)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width / 10,
                    ),
                    child: IntroductionScreen(
                      showNextButton: (logic.isValidateSeed!.value == false &&
                              logic.page_index == 1)
                          ? false
                          : (logic.isValidateSeed!.value == true &&
                                  logic.page_index == 1)
                              ? true
                              : (!logic.isValidate!.value &&
                                      logic.page_index == 2)
                                  ? false
                                  : (logic.isValidate!.value &&
                                          logic.page_index == 2)
                                      ? true
                                      : true,
                      onChange: (value) {
                        if (value == 0) {
                          // logic.mnemonicFormKey.currentState?.reassemble();
                          logic.isValidateSeed!.value = false;
                          logic.generateMnemonic();

                          print(logic.randomMnemonic);
                        }
                        if (logic.fromKey.currentState?.validate() ?? false) {
                          logic.isValidate!.value = true;
                        }
                        // if (logic.mnemonicFormKey.currentState?.validate() ??
                        //     false) {
                        //   logic.isValidateSeed!.value = true;
                        // }
                        print(value);
                        logic.page_index!.value = value;
                      },

                      globalBackgroundColor: Colors.transparent,
                      pages: [
                        PageViewModel(
                          title: '',
                          bodyWidget: Container(
                            child: SeedGeneratorWidget(
                                seedKey: logic.randomMnemonic ?? ''),
                          ),
                        ),
                        PageViewModel(
                            title: '',
                            bodyWidget: Container(
                                width: MediaQuery.of(context).size.width,
                                child: SeedInputWidget(
                                  logic: logic,
                                ))),
                        PageViewModel(
                            title: '',
                            bodyWidget: Container(
                                width: MediaQuery.of(context).size.width,
                                child: WalletPasswordWidget(
                                  logic: logic,
                                ))),
                        PageViewModel(
                          title: '',
                          bodyWidget: Container(
                            child: SeedGeneratorWidget(
                                seedKey: logic.randomMnemonic!),
                          ),
                        ),
                      ],
                      showDoneButton: true,
                      onDone: () {
                        Get.offAllNamed(Routes.MainScreen);
                      },
                      skip: null,

                      backStyle: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.main_color),
                      ),
                      doneStyle: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.main_color),
                      ),
                      nextStyle: ButtonStyle(
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                        backgroundColor:
                            MaterialStateProperty.all(AppColors.main_color),
                      ),

                      showBackButton: true,
                      back: Text('Previous'),

                      done: FittedBox(child: Text('Complete')),
                      next: FittedBox(child: Text('Next')),
                      // TextButton(onPressed: (){}, child: Text('Complete')),
                      isProgressTap: false,
                      dotsDecorator: DotsDecorator(
                          size: const Size.square(10.0),
                          activeSize: const Size(10, 10.0),
                          activeColor: AppColors.main_color,
                          color: Colors.white,
                          spacing: const EdgeInsets.symmetric(horizontal: 10),
                          activeShape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100))),
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
