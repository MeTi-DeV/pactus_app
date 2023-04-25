import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:pactus_app/screens/create_new_wallet_screen/create_new_wallet_logic.dart';
import 'package:pactus_app/theme/app_colors.dart';
import 'package:pactus_app/theme/dimentions.dart';

class SeedInputWidget extends StatelessWidget {
  final CreateNewWalletLogic logic;

  SeedInputWidget({required this.logic});
  final pasteKeySetwindows = LogicalKeySet(
    LogicalKeyboardKey.control,
    LogicalKeyboardKey.keyV,
  );
  @override
  Widget build(BuildContext context) {
    return FocusableActionDetector(
        shortcuts: {
          pasteKeySetwindows: PasteIntent(),
        },
        actions: {
          PasteIntent: CallbackAction(
            onInvoke: (intent) async {
              // ClipboardData? data = await Clipboard.getData('text/plain');
              // print(" paste callBack ${data!.text}");
              return ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text("Paste is forbidden")));
            },
          )
        },
        child: Column(
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
            Form(
              key: logic.mnemonicFormKey,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 120,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != logic.mnemonicList[index]) {
                                print(value);
                                return '';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              
                              print(logic.mnemonicList[index]);
                            },
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              cut: true,
                              paste: false,
                              selectAll: false,
                            ),
                            decoration: InputDecoration(
                              helperText: '',
                              labelText: "${index + 1} .",
                            ),
                            controller: logic.seedController![index],
                            cursorColor: AppColors.main_color,
                          ),
                        );
                      })),
                  SizedBox(
                    height: KSize.geHeight(context, 32),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(6, (index) {
                        return SizedBox(
                          width: 120,
                          child: TextFormField(
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value != logic.mnemonicList[index + 6]) {
                                print(value);
                                return '';
                              }
                              return null;
                            },
                            onChanged: (value) {
                           

                              print(logic.mnemonicList[index + 6]);
                            },
                            toolbarOptions: ToolbarOptions(
                              copy: true,
                              cut: true,
                              paste: false,
                              selectAll: false,
                            ),
                            decoration: InputDecoration(
                              helperText: '',
                              labelText: "${index + 7} .",
                            ),
                            controller: logic.seedController![index + 6],
                            cursorColor: AppColors.main_color,
                          ),
                        );
                      })
                      //  [

                      // SizedBox(
                      //   width: 120,
                      //   child: TextFormField(
                      //     autovalidateMode: AutovalidateMode.onUserInteraction,
                      //     validator: (value) {
                      //       if (value != logic.mnemonicList[1]) {}
                      //       return null;
                      //     },
                      //     toolbarOptions: ToolbarOptions(
                      //       copy: false,
                      //       cut: false,
                      //       paste: false,
                      //       selectAll: false,
                      //     ),
                      //     controller: logic.seedText2,
                      //     cursorColor: AppColors.main_color,
                      //     decoration: InputDecoration(
                      //       labelText: "2 .",
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 120,
                      //   child: TextFormField(
                      //     autovalidateMode: AutovalidateMode.onUserInteraction,
                      //     validator: (value) {
                      //       if (value != logic.mnemonicList[2]) {}
                      //       return null;
                      //     },
                      //     toolbarOptions: ToolbarOptions(
                      //       copy: true,
                      //       cut: true,
                      //       paste: false,
                      //       selectAll: false,
                      //     ),
                      //     controller: logic.seedText3,
                      //     cursorColor: AppColors.main_color,
                      //     decoration: InputDecoration(
                      //       labelText: "3 .",
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 120,
                      //   child: TextFormField(
                      //     autovalidateMode: AutovalidateMode.onUserInteraction,
                      //     validator: (value) {
                      //       if (value != logic.mnemonicList[3]) {}
                      //       return null;
                      //     },
                      //     toolbarOptions: ToolbarOptions(
                      //       copy: true,
                      //       cut: true,
                      //       paste: false,
                      //       selectAll: false,
                      //     ),
                      //     controller: logic.seedText4,
                      //     cursorColor: AppColors.main_color,
                      //     decoration: InputDecoration(
                      //       labelText: "4 .",
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 120,
                      //   child: TextFormField(
                      //     autovalidateMode: AutovalidateMode.onUserInteraction,
                      //     validator: (value) {
                      //       if (value != logic.mnemonicList[4]) {}
                      //       return null;
                      //     },
                      //     toolbarOptions: ToolbarOptions(
                      //       copy: true,
                      //       cut: true,
                      //       paste: false,
                      //       selectAll: false,
                      //     ),
                      //     controller: logic.seedText5,
                      //     cursorColor: AppColors.main_color,
                      //     decoration: InputDecoration(
                      //       labelText: "5 .",
                      //     ),
                      //   ),
                      // ),
                      // SizedBox(
                      //   width: 120,
                      //   child: TextFormField(
                      //     autovalidateMode: AutovalidateMode.onUserInteraction,
                      //     validator: (value) {
                      //       if (value != logic.mnemonicList[5]) {}
                      //       return null;
                      //     },
                      //     toolbarOptions: ToolbarOptions(
                      //       copy: true,
                      //       cut: true,
                      //       paste: false,
                      //       selectAll: false,
                      //     ),
                      //     controller: logic.seedText6,
                      //     cursorColor: AppColors.main_color,
                      //     decoration: InputDecoration(
                      //       labelText: "6 .",
                      //     ),
                      //   ),
                      // ),
                      // ],
                      // [
                      //   SizedBox(
                      //     width: 120,
                      //     child: TextFormField(
                      //       autovalidateMode: AutovalidateMode.onUserInteraction,
                      //       validator: (value) {
                      //         if (value != logic.mnemonicList[6]) {}
                      //         return null;
                      //       },
                      //       toolbarOptions: ToolbarOptions(
                      //         copy: true,
                      //         cut: true,
                      //         paste: false,
                      //         selectAll: false,
                      //       ),
                      //       controller: logic.seedText7,
                      //       cursorColor: AppColors.main_color,
                      //       decoration: InputDecoration(
                      //         labelText: "7 .",
                      //       ),
                      //     ),
                      //   ),
                      //   SizedBox(
                      //     width: 120,
                      //     child: TextFormField(
                      //       autovalidateMode: AutovalidateMode.onUserInteraction,
                      //       validator: (value) {
                      //         if (value != logic.mnemonicList[7]) {}
                      //         return null;
                      //       },
                      //       toolbarOptions: ToolbarOptions(
                      //         copy: false,
                      //         cut: false,
                      //         paste: false,
                      //         selectAll: false,
                      //       ),
                      //       controller: logic.seedText8,
                      //       cursorColor: AppColors.main_color,
                      //       decoration: InputDecoration(
                      //         labelText: "8 .",
                      //       ),
                      //     ),
                      //   ),
                      //   SizedBox(
                      //     width: 120,
                      //     child: TextFormField(
                      //       autovalidateMode: AutovalidateMode.onUserInteraction,
                      //       validator: (value) {
                      //         if (value != logic.mnemonicList[8]) {}
                      //         return null;
                      //       },
                      //       toolbarOptions: ToolbarOptions(
                      //         copy: true,
                      //         cut: true,
                      //         paste: false,
                      //         selectAll: false,
                      //       ),
                      //       controller: logic.seedText9,
                      //       cursorColor: AppColors.main_color,
                      //       decoration: InputDecoration(
                      //         labelText: "9 .",
                      //       ),
                      //     ),
                      //   ),
                      //   SizedBox(
                      //     width: 120,
                      //     child: TextFormField(
                      //       autovalidateMode: AutovalidateMode.onUserInteraction,
                      //       validator: (value) {
                      //         if (value != logic.mnemonicList[9]) {}
                      //         return null;
                      //       },
                      //       toolbarOptions: ToolbarOptions(
                      //         copy: true,
                      //         cut: true,
                      //         paste: false,
                      //         selectAll: false,
                      //       ),
                      //       controller: logic.seedText10,
                      //       cursorColor: AppColors.main_color,
                      //       decoration: InputDecoration(
                      //         labelText: "10 .",
                      //       ),
                      //     ),
                      //   ),
                      //   SizedBox(
                      //     width: 120,
                      //     child: TextFormField(
                      //       autovalidateMode: AutovalidateMode.onUserInteraction,
                      //       validator: (value) {
                      //         if (value != logic.mnemonicList[10]) {}
                      //         return null;
                      //       },
                      //       toolbarOptions: ToolbarOptions(
                      //         copy: true,
                      //         cut: true,
                      //         paste: false,
                      //         selectAll: false,
                      //       ),
                      //       controller: logic.seedText11,
                      //       cursorColor: AppColors.main_color,
                      //       decoration: InputDecoration(
                      //         labelText: "11 .",
                      //       ),
                      //     ),
                      //   ),
                      //   SizedBox(
                      //     width: 120,
                      //     child: TextFormField(
                      //       autovalidateMode: AutovalidateMode.onUserInteraction,
                      //       validator: (value) {
                      //         if (value != logic.mnemonicList[11]) {}
                      //         return null;
                      //       },
                      //       toolbarOptions: ToolbarOptions(
                      //         copy: true,
                      //         cut: true,
                      //         paste: false,
                      //         selectAll: false,
                      //       ),
                      //       controller: logic.seedText12,
                      //       cursorColor: AppColors.main_color,
                      //       decoration: InputDecoration(
                      //         labelText: "12 .",
                      //       ),
                      //     ),
                      //   ),
                      // ],
                      ),
                ],
              ),
            )
          ],
        ));
  }
}

class PasteIntent extends Intent {}
// class CustomTextEditingController extends TextEditingController {
//   final int position;
// 
//   CustomTextEditingController(this.position);
//   
// }