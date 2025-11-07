part of 'user.dart';

extension UserProfileX on UserProfile {
  String get fullName {
    final first = name.firstname?.trim() ?? '';
    final last = name.lastname?.trim() ?? '';
    final combined = '${first.capitalizeFirst} ${last.capitalizeFirst}'.trim();
    return combined.isNotEmpty ? combined : username;
  }
}
