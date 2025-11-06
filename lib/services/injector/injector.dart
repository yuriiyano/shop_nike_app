import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_nike_app/router/index.dart';
import 'injector.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  asExtension: true,
  initializerName: 'init',
)
//register only auth dependencies
Future<void> configureAuthDependencies() async {
  final prefs = await SharedPreferences.getInstance();

  getIt
    ..registerSingleton(AppRouter())
    ..registerSingleton(prefs)
    ..initAuthScope();
}


//register other dependencies (except auth ones)
void configureUserDependencies(GetIt getIt) {
  getIt.init();
}
