import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:bip39/bip39.dart' as bip39;

class CreateNewWalletLogic extends GetxController {
  String? randomMnemonic;
  RxBool? hasLoader = false.obs;
  RxBool? isValidate = false.obs;
  RxBool? isValidateSeed = false.obs;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  GlobalKey<FormState> mnemonicFormKey = GlobalKey<FormState>();
  List<TextEditingController> ?seedController;
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  RxInt? page_index = 0.obs;
  List mnemonicList = [];
  @override
  void onInit() {
    generateMnemonic();
    super.onInit();
  }

  generateMnemonic() async {
    hasLoader!.value = true;
    randomMnemonic = await bip39.generateMnemonic();
    print(randomMnemonic);
    mnemonicList = randomMnemonic!.split(" ");
    print(mnemonicList[0]);
    print(mnemonicList.length);
    // print(randomMnemonic);
    hasLoader!.value = false;
    seedController = List.generate(12, (i) => TextEditingController());
  }
}
