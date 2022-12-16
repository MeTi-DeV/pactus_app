import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:pactus_app/screens/create_new_wallet_screen/create_new_wallet_screen.dart';
import 'package:pactus_app/screens/main_screen.dart';

class Routes {
  static const String CreateNewWalletScreen = "/new-wallet";
  static const String MainScreen = "/main-screen";
}

class MyRouter {
  static final routes = [
    GetPage(
      name: Routes.MainScreen,
      page: () => MainScreen(),
    ),
    GetPage(
      name: Routes.CreateNewWalletScreen,
      page: () => CreateNewWalletScreen(),
    ),
  ];
}
