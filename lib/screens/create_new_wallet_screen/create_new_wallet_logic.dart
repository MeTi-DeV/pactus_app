import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bip39/bip39.dart' as bip39;

class CreateNewWalletLogic extends GetxController {
  String? randomMnemonic;
  RxBool? hasLoader = false.obs;
  RxBool? isValidate = false.obs;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  RxInt? page_index = 0.obs;
  @override
  void onInit() {
    generateMnemonic();
    super.onInit();
  }

  generateMnemonic() async {
    hasLoader!.value = true;
    randomMnemonic = await bip39.generateMnemonic();
    print(randomMnemonic);
    List mnemonicList =
        randomMnemonic!.split(" ");
    print(mnemonicList[0]);
    // print(randomMnemonic);
    hasLoader!.value = false;
  }
}
