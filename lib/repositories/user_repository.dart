import 'package:injectable/injectable.dart';

import 'package:shop_nike_app/models/index.dart';
import 'package:shop_nike_app/services/http/index.dart';

@Injectable(scope: 'auth')
class UserRepository {
  final HttpClient httpClient;

  UserRepository(this.httpClient) {
    httpClient.registerType(UserProfile.fromJson);
  }

  Future<UserProfile> getUserProfile() {
    return httpClient.get<UserProfile>('/users/1');
  }
}
