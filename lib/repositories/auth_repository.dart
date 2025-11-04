import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/general_models.dart';
import 'package:shop_nike_app/services/http/index.dart';

@Injectable(scope: 'auth')
class AuthRepository {
  final HttpClient httpClient;

  AuthRepository(this.httpClient);

  Stream<AuthStatus> get authenticationStatus =>
      httpClient.authenticationStatus;

  Future<void> signIn(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 2));

    return httpClient.setToken('token');
  }

  Future<void> signOut() {
    return httpClient.clearToken();
  }
}
