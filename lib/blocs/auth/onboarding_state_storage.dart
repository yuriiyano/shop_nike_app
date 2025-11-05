import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_nike_app/core/constants/index.dart';

@Injectable(scope: 'auth')
class OnboardingStateStorage {
  const OnboardingStateStorage({required SharedPreferences prefs})
    : _prefs = prefs;
  final SharedPreferences _prefs;

  bool read() {
    return _prefs.getBool(AppConstants.rememberOnboardingStateKey) ?? false;
  }

  Future<bool> write({bool onboardingStateValue = true}) {
    if (onboardingStateValue == read()) return Future.value(true);

    return _prefs.setBool(
      AppConstants.rememberOnboardingStateKey,
      onboardingStateValue,
    );
  }

  Future<bool> delete() {
    return _prefs.remove(AppConstants.rememberOnboardingStateKey);
  }
}
