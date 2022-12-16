import 'package:get/get.dart';
import 'package:bip39/bip39.dart' as bip39;

class CreateNewWalletLogic extends GetxController {
  String? randomMnemonic;
  RxBool? hasLoader = false.obs;
  @override
  void onInit() {
    generateMnemonic();
    super.onInit();
  }

  generateMnemonic() async {
    hasLoader!.value = true;
    randomMnemonic = await bip39.generateMnemonic();
    hasLoader!.value = false;
  }
}
