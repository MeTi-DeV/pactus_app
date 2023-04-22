import 'package:flutter/material.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:get/get.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/bi.dart';
import 'package:iconify_flutter/icons/icomoon_free.dart';
import 'package:pactus_app/screens/create_new_wallet_screen/create_new_wallet_logic.dart';
import 'package:pactus_app/theme/app_colors.dart';
import 'package:pactus_app/theme/dimentions.dart';

class WalletPasswordWidget extends StatelessWidget {
  final CreateNewWalletLogic? logic;
  final GlobalKey<FlutterPwValidatorState> validatorKey =
      GlobalKey<FlutterPwValidatorState>();

  WalletPasswordWidget({this.logic});
  @override
  Widget build(BuildContext context) {
    RxBool obs_password = true.obs;
    RxBool obs_confirm = true.obs;
    return Obx(() => Column(
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
            ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 1.3),
              child: Form(
                  key: logic?.fromKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextFormField(
                        toolbarOptions: ToolbarOptions(
                            copy: false,
                            paste: false,
                            cut: false,
                            selectAll: true),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        maxLength: 16,
                        controller: logic?.password,
                        onChanged: (value) {
                          if (value == logic!.confirm.text) {
                            logic!.isValidate!.value = true;
                          } else {
                            logic!.isValidate!.value = false;
                          }
                        },
                        validator: (value) {
                          if (value!.length < 8) {
                            return 'Your password must be have at least 8 characters long';
                          }
                          if (!RegExp(r'(?=(.*\d){2,})').hasMatch(value)) {
                            return 'Your password must contain at least 2 digits or more';
                          }
                          if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
                            return 'Your password must contain at least 1 Uppercase letter or more';
                          }
                          if (!RegExp(r'(?=.*[!@#$%])').hasMatch(value)) {
                            return 'Your password must contain at least 1 Uppercase letter or more';
                          }
                          return null;
                        },
                        cursorColor: AppColors.main_color,
                        obscureText: obs_password.value,
                        obscuringCharacter: '●',
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              obs_password.value = !obs_password.value;
                            },
                            child: obs_password.value == true
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Iconify(IcomoonFree.eye,
                                        color: Colors.grey.shade700),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Iconify(IcomoonFree.eye_blocked,
                                        color: Colors.grey.shade700),
                                  ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: Colors.redAccent.shade400,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: Colors.redAccent.shade400,
                              width: 1,
                            ),
                          ),
                          labelStyle: TextStyle(
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.w200,
                              fontSize: 14),
                          labelText: "Enter Password",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: AppColors.main_color,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: KSize.geHeight(context, 25),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              // maxHeight: KSize.geHeight(context, 200),
                              minHeight: KSize.geHeight(context, 200)),
                          child: FlutterPwValidator(
                            controller: logic!.password,
                            minLength: 8,
                            uppercaseCharCount: 1,
                            numericCharCount: 2,
                            specialCharCount: 1,
                            normalCharCount: 4,
                            width: 400,
                            height: 200,
                            onSuccess: () {
                              // print("MATCHED");
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //     new SnackBar(
                              //         content: new Text("Password is matched")));
                            },
                            onFail: () {
                              // print("NOT MATCHED");
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: KSize.geHeight(context, 25),
                      ),
                      TextFormField(
                        toolbarOptions: ToolbarOptions(
                          copy: true,
                          cut: true,
                          paste: false,
                          selectAll: false,
                        ),
                        onChanged: (value) {
                          if (value == logic!.password.text) {
                            logic!.isValidate!.value = true;
                          } else {
                            logic!.isValidate!.value = false;
                          }
                        },
                        // autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value != logic!.password.text) {
                            return 'Your password and confirmation password do not match.';
                          }
                          return null;
                        },
                        maxLength: 16,
                        controller: logic!.confirm,
                        cursorColor: AppColors.main_color,
                        obscureText: obs_confirm.value,
                        obscuringCharacter: '●',
                        decoration: InputDecoration(
                          suffixIcon: GestureDetector(
                            onTap: () {
                              obs_confirm.value = !obs_confirm.value;
                            },
                            child: obs_confirm.value == true
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Iconify(IcomoonFree.eye,
                                        color: Colors.grey.shade700),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Iconify(IcomoonFree.eye_blocked,
                                        color: Colors.grey.shade700),
                                  ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: Colors.redAccent.shade400,
                              width: 1,
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: Colors.redAccent.shade400,
                              width: 1,
                            ),
                          ),
                          labelStyle: TextStyle(
                              color: Colors.grey.shade200,
                              fontWeight: FontWeight.w200,
                              fontSize: 14),
                          labelText: "Enter Password",
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: AppColors.main_color,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide(
                              color: Colors.grey.shade700,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}
