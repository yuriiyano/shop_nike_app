import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:shop_nike_app/core/index.dart';

@Injectable(scope: 'auth')
class OnboardingStateStorage {
  final SharedPreferences _prefs;

  const OnboardingStateStorage(this._prefs);

  Future<bool> read() {
    return Future.value(
      _prefs.getBool(AppConstants.rememberOnboardingStateKey) ?? false,
    );
  }

  Future<bool> write({required bool onboardingStateValue}) {
    return _prefs.setBool(
      AppConstants.rememberOnboardingStateKey,
      onboardingStateValue,
    );
  }

  Future<bool> delete() {
    return _prefs.remove(AppConstants.rememberOnboardingStateKey);
  }
}
