import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:bip39/bip39.dart' as bip39;

class CreateNewWalletLogic extends GetxController {
  String? randomMnemonic;
  RxBool? hasLoader = false.obs;
  RxBool? isValidate = false.obs;
  RxBool? isValidateSeed = false.obs;
  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  GlobalKey<FormState> mnemonicFormKey = GlobalKey<FormState>();
  List<TextEditingController>? seedController;
  TextEditingController password = TextEditingController();
  TextEditingController confirm = TextEditingController();
  RxInt? page_index = 0.obs;
  List mnemonicList = [];
  String userDir = Platform.environment['USERPROFILE']!;
  String appDir = "123456789";
  @override
  void onInit() async {
    print(userDir);
    generateMnemonic();
    processRun();
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
    // createPactusDir();
    await processRun();
      
  }

  createPactusDir() async {
    final Directory _appDocDirFolder = Directory("${userDir}/$appDir/");
    if (await _appDocDirFolder.exists()) {
      //if folder already exists return path
      return _appDocDirFolder.path;
    } else {
      //if folder not exists create folder and then return its path
      final Directory _appDocDirNewFolder =
          await _appDocDirFolder.create(recursive: true);
      return _appDocDirNewFolder.path;
    }
  }

  Future<ProcessResult>? processRun() {
    var result =
        Process.run('D:\\Program Files\\Microvirt\\MEmu\\MEmu.exe',[]);

    result.then((value) {
      print(value.exitCode);
    });
    return result;
  }
}
